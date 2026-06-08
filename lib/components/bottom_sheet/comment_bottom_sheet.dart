import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/comment/comment_bloc.dart';
import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:santvani_app/data/models/post/comment_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/comment_repo.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key, required this.postId});

  final String postId;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  String _formatTimeAgo(final dynamic createdAt) {
    if (createdAt == null) return 'just now';
    DateTime? dateTime;
    if (createdAt is Timestamp) {
      dateTime = createdAt.toDate();
    } else if (createdAt is DateTime) {
      dateTime = createdAt;
    }
    if (dateTime == null) return 'just now';
    final Duration difference = DateTime.now().difference(dateTime);
    if (difference.inDays >= 365) {
      final int years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? "yr" : "yrs"} ago';
    } else if (difference.inDays >= 30) {
      final int months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? "mo" : "mos"} ago';
    } else if (difference.inDays >= 7) {
      final int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? "wk" : "wks"} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? "d" : "d"} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? "h" : "h"} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? "m" : "m"} ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(final BuildContext context) {
    // Read user details directly from SharedPreferenceHelper to avoid scoping issues across routes
    final UserDataModel? userData = SharedPreferenceHelper().user;
    final String username = (userData?.username != null && userData!.username!.isNotEmpty)
        ? userData.username!
        : (userData?.fullName != null && userData!.fullName.isNotEmpty)
            ? userData.fullName
            : 'user';
    final String userAvatarUrl = (userData?.userProfileImageUrl != null && userData!.userProfileImageUrl!.isNotEmpty)
        ? userData.userProfileImageUrl!
        : (userData?.profileImage != null && userData!.profileImage!.isNotEmpty)
            ? userData.profileImage!
            : 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80';

    return BlocProvider<CommentBloc>(
      create: (final BuildContext ctx) => CommentBloc(commentRepo: ctx.read<CommentRepo>())
        ..add(CommentEvent.onLoadComments(postId: widget.postId)),
      child: BlocConsumer<CommentBloc, CommentState>(
        listener: (final BuildContext ctx, final CommentState state) {
          if (state.status == CommonScreenState.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFFD32F2F),
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        builder: (final BuildContext ctx, final CommentState state) {
          final List<CommentModel> commentsList = state.comments;
          final bool isLoading = state.status == CommonScreenState.loading;

          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Color(0xFFFCF8F2), // Serene parchment background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 8),
                const BottomSheetDragLine(),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Devotional Thoughts 🌸',
                        style: dMSansW700.copyWith(fontSize: 16, color: const Color(0xFFE65100)),
                      ),
                      Text(
                        '${commentsList.length} comments',
                        style: dMSansW600.copyWith(fontSize: 12, color: const Color(0xFF8D6E63)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(color: Color(0xFFFFCC80), height: 1),
                Expanded(
                  child: state.status == CommonScreenState.loading && commentsList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFE65100)),
                        )
                      : commentsList.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(Icons.spa_rounded, size: 40, color: Color(0xFFFFCC80)),
                                  const SizedBox(height: 12),
                                  Text(
                                    'No comments yet',
                                    style: dMSansW700.copyWith(fontSize: 14, color: const Color(0xFF3E2723)),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Be the first to share devotional greetings! 🙏',
                                    style: dMSansW500.copyWith(fontSize: 11.5, color: const Color(0xFF8D6E63)),
                                  ),
                                ],
                              ),
                            )
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              itemCount: commentsList.length,
                              separatorBuilder: (context, index) => const SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                final CommentModel comment = commentsList[index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Avatar
                                    Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFFFFD700),
                                            Color(0xFFFF9933),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(1),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundImage: NetworkImage(comment.userAvatarUrl),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                comment.username,
                                                style: dMSansW700.copyWith(fontSize: 12.5, color: const Color(0xFF3E2723)),
                                              ),
                                              Text(
                                                _formatTimeAgo(comment.createdAt),
                                                style: dMSansW500.copyWith(fontSize: 9.5, color: const Color(0xFF8D6E63)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            comment.commentText,
                                            style: dMSansW500.copyWith(fontSize: 12, color: const Color(0xFF4E342E), height: 1.35),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                ),
                const Divider(color: Color(0xFFFFCC80), height: 1),
                // Comment input area
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                  ),
                  child: Row(
                    children: <Widget>[
                      // Input TextField Container
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
                          ),
                          child: TextField(
                            controller: _commentController,
                            style: dMSansW500.copyWith(fontSize: 13.5, color: const Color(0xFF3E2723)),
                            decoration: const InputDecoration(
                              hintText: 'Share a devotional greeting... 🙏',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Color(0xFFBCAAA4), fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Send Button
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE65100),
                        ),
                        child: IconButton(
                          icon: isLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                              : const Icon(Icons.send_rounded, color: Colors.white, size: 18),
                          onPressed: isLoading
                              ? null
                              : () {
                                  final String text = _commentController.text.trim();
                                  if (text.isNotEmpty) {
                                    ctx.read<CommentBloc>().add(
                                          CommentEvent.onAddComment(
                                            postId: widget.postId,
                                            commentText: text,
                                            username: username,
                                            userAvatarUrl: userAvatarUrl,
                                          ),
                                        );
                                    _commentController.clear();
                                    // Dismiss keyboard
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
