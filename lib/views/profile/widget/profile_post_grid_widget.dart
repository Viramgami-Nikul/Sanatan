import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/views/post/post_detail_screen.dart';

class ProfilePostGridWidget extends StatefulWidget {
  const ProfilePostGridWidget({super.key});

  @override
  State<ProfilePostGridWidget> createState() => _ProfilePostGridWidgetState();
}

class _ProfilePostGridWidgetState extends State<ProfilePostGridWidget> {
  int _selectedTab = 0;

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
      return '$years ${years == 1 ? "year" : "years"} ago';
    } else if (difference.inDays >= 30) {
      final int months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? "month" : "months"} ago';
    } else if (difference.inDays >= 7) {
      final int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? "minute" : "minutes"} ago';
    } else {
      return 'just now';
    }
  }

  Widget _buildTabItem(final int index, final IconData icon) {
    final bool isActive = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? const Color(0xFFE65100) : Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
          child: Icon(
            icon,
            size: 22,
            color: isActive ? const Color(0xFFE65100) : const Color(0xFF8D6E63),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final String currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final ProfileState profileState = context.watch<ProfileBloc>().state;
    final UserDataModel? userData = profileState.userData;
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
    final bool isVerified = userData?.isVerified ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Grid Tabs row
        const Divider(color: Color(0xFFFFCC80), height: 1),
        Container(
          color: const Color(0xFFFCF8F2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildTabItem(0, Icons.grid_on_sharp),
              _buildTabItem(1, Icons.play_circle_outline_rounded),
              _buildTabItem(2, Icons.portrait_rounded),
            ],
          ),
        ),
        const Divider(color: Color(0xFFFFCC80), height: 1),
        // Grid Posts list or blank section
        if (_selectedTab == 0)
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('post')
                .where('uid', isEqualTo: currentUid)
                .snapshots(),
            builder: (final BuildContext context, final AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFE65100)),
                  ),
                );
              }

              final List<QueryDocumentSnapshot> rawDocs = snapshot.data?.docs ?? <QueryDocumentSnapshot>[];
              
              // Filter out mock/default posts (those containing unsplash.com or with mock IDs)
              final List<QueryDocumentSnapshot> filteredDocs = rawDocs.where((final doc) {
                final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                final String imageUrl = data['imageUrl'] as String? ?? '';
                final String postId = data['postId'] as String? ?? doc.id;
                return !imageUrl.contains('unsplash.com') &&
                    postId != '1' &&
                    postId != '2' &&
                    postId != '3';
              }).toList();

              // Sort posts in memory by createdAt descending
              final List<QueryDocumentSnapshot> docs = List<QueryDocumentSnapshot>.from(filteredDocs)
                ..sort((final a, final b) {
                  final Map<String, dynamic> aData = a.data() as Map<String, dynamic>;
                  final Map<String, dynamic> bData = b.data() as Map<String, dynamic>;
                  final dynamic aTime = aData['createdAt'];
                  final dynamic bTime = bData['createdAt'];
                  
                  if (aTime == null && bTime == null) return 0;
                  if (aTime == null) return -1;
                  if (bTime == null) return 1;
                  
                  DateTime? aDate;
                  DateTime? bDate;
                  if (aTime is Timestamp) {
                    aDate = aTime.toDate();
                  } else if (aTime is DateTime) {
                    aDate = aTime;
                  }
                  
                  if (bTime is Timestamp) {
                    bDate = bTime.toDate();
                  } else if (bTime is DateTime) {
                    bDate = bTime;
                  }
                  
                  if (aDate == null && bDate == null) return 0;
                  if (aDate == null) return -1;
                  if (bDate == null) return 1;
                  return bDate.compareTo(aDate);
                });

              if (docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 48),
                      const Icon(Icons.spa_rounded, size: 48, color: Color(0xFFFF9933)),
                      const SizedBox(height: 12),
                      Text(
                        'No Posts Yet',
                        style: dMSansW700.copyWith(fontSize: 15, color: const Color(0xFF3E2723)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Your spiritual journey posts will appear here. 🌸🙏',
                        style: dMSansW500.copyWith(fontSize: 11.5, color: const Color(0xFF8D6E63)),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: docs.length,
                  itemBuilder: (final BuildContext context, final int index) {
                    final Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                    final String imageUrl = data['imageUrl'] as String? ?? '';

                    return GestureDetector(
                      onTap: () {
                        final PostData postData = PostData(
                          id: data['postId'] as String? ?? docs[index].id,
                          username: username,
                          userAvatarUrl: userAvatarUrl,
                          postImageUrl: imageUrl,
                          isVerified: isVerified,
                          initialLikesCount: data['likesCount'] as int? ?? 0,
                          caption: data['caption'] as String? ?? '',
                          timeAgo: _formatTimeAgo(data['createdAt']),
                          commentsCount: data['commentsCount'] as int? ?? 0,
                          uid: currentUid,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (final BuildContext context) => PostDetailScreen(post: postData),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFDF6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFFFE0B2).withValues(alpha: 0.8),
                            width: 1.2,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFFFF9933).withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageUrl.isNotEmpty
                              ? Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (final BuildContext context, final Widget child, final ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFE65100)),
                                      ),
                                    );
                                  },
                                  errorBuilder: (final BuildContext context, final Object error, final StackTrace? stackTrace) {
                                    return Container(
                                      color: const Color(0xFFFFF3E0),
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported_outlined,
                                          color: Color(0xFFFFB300),
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: const Color(0xFFFFF3E0),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: Color(0xFFFFB300),
                                      size: 20,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        else
          const SizedBox(height: 300), // Show blank section
      ],
    );
  }
}
