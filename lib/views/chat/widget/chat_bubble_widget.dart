import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santvani_app/data/models/chat/message_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/views/post/post_detail_screen.dart';

class ChatBubbleWidget extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const ChatBubbleWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(final BuildContext context) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(message.timestamp);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    final bool hasImage = message.imageUrl != null && message.imageUrl!.isNotEmpty;
    final bool isSharedPost = message.postId != null && message.postId!.isNotEmpty;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: isSharedPost ? () => _navigateToPostDetail(context, message.postId!) : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
        padding: EdgeInsets.symmetric(
          horizontal: hasImage ? 6 : 16,
          vertical: hasImage ? 6 : 10,
        ),
        decoration: BoxDecoration(
          color: isMe ? null : const Color(0xFFF3F4F6),
          gradient: isMe
              ? const LinearGradient(
                  colors: <Color>[
                    Color(0xFFE65100), // Rich Saffron
                    Color(0xFFFF8F00), // Bright Orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
          boxShadow: <BoxShadow>[
            if (isMe)
              BoxShadow(
                color: const Color(0xFFE65100).withValues(alpha: 0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (hasImage) ...<Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: message.imageUrl!,
                  placeholder: (final BuildContext context, final String url) => const SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE65100)),
                      ),
                    ),
                  ),
                  errorWidget: (final BuildContext context, final String url, final Object error) => const SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 40, color: Colors.grey)),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              if (message.message.isNotEmpty && message.message != 'Sent a photo') ...<Widget>[
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: isMe ? AppColors.white : AppColors.primaryTextColor,
                      fontSize: 14,
                      height: 1.3,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ] else
              Text(
                message.message,
                style: TextStyle(
                  color: isMe ? AppColors.white : AppColors.primaryTextColor,
                  fontSize: 15,
                  height: 1.3,
                  fontFamily: 'Inter',
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                right: hasImage ? 8 : 0,
                bottom: hasImage ? 4 : 0,
              ),
              child: Text(
                formattedTime,
                style: TextStyle(
                  color: isMe ? AppColors.white.withValues(alpha: 0.7) : AppColors.secondaryTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Future<void> _navigateToPostDetail(final BuildContext context, final String postId) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (final BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFE65100),
        ),
      ),
    );

    try {
      final DocumentSnapshot postSnap = await FirebaseFirestore.instance
          .collection('post')
          .doc(postId)
          .get();

      if (postSnap.exists && context.mounted) {
        final Map<String, dynamic> postDataMap = postSnap.data() as Map<String, dynamic>;
        final String uid = postDataMap['uid'] as String? ?? '';

        String username = 'user';
        String userAvatarUrl = 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80';
        bool isVerified = false;

        if (uid.isNotEmpty) {
          final DocumentSnapshot userSnap = await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .get();

          if (!context.mounted) return;

          if (userSnap.exists) {
            final Map<String, dynamic>? userData = userSnap.data() as Map<String, dynamic>?;
            username = userData?['username'] as String? ?? userData?['fullName'] as String? ?? 'user';
            userAvatarUrl = userData?['userProfileImageUrl'] as String? ?? userData?['profileImage'] as String? ?? userAvatarUrl;
            isVerified = userData?['isVerified'] as bool? ?? false;
          }
        }

        String timeAgo = 'just now';
        final dynamic createdAt = postDataMap['createdAt'];
        if (createdAt != null) {
          DateTime? dateTime;
          if (createdAt is Timestamp) {
            dateTime = createdAt.toDate();
          } else if (createdAt is DateTime) {
            dateTime = createdAt;
          }
          if (dateTime != null) {
            final Duration difference = DateTime.now().difference(dateTime);
            if (difference.inDays >= 365) {
              final int years = (difference.inDays / 365).floor();
              timeAgo = '$years ${years == 1 ? "year" : "years"} ago';
            } else if (difference.inDays >= 30) {
              final int months = (difference.inDays / 30).floor();
              timeAgo = '$months ${months == 1 ? "month" : "months"} ago';
            } else if (difference.inDays >= 7) {
              final int weeks = (difference.inDays / 7).floor();
              timeAgo = '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
            } else if (difference.inDays >= 1) {
              timeAgo = '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} ago';
            } else if (difference.inHours >= 1) {
              timeAgo = '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} ago';
            } else if (difference.inMinutes >= 1) {
              timeAgo = '${difference.inMinutes} ${difference.inMinutes == 1 ? "minute" : "minutes"} ago';
            }
          }
        }

        final PostData post = PostData(
          id: postId,
          username: username,
          userAvatarUrl: userAvatarUrl,
          postImageUrl: postDataMap['imageUrl'] as String? ?? '',
          isVerified: isVerified,
          initialLikesCount: postDataMap['likesCount'] as int? ?? 0,
          caption: postDataMap['caption'] as String? ?? '',
          timeAgo: timeAgo,
          commentsCount: postDataMap['commentsCount'] as int? ?? 0,
          uid: uid,
        );

        if (!context.mounted) return;

        Navigator.pop(context); // Pop loading indicator

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (final BuildContext context) => PostDetailScreen(post: post),
          ),
        );
      } else {
        if (context.mounted) Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      debugPrint('Error loading shared post: $e');
    }
  }
}
