import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/user_repo.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/views/post/post_detail_screen.dart';

class UserProfileDetailScreen extends StatefulWidget {
  const UserProfileDetailScreen({
    super.key,
    required this.user,
  });

  final UserDataModel user;

  @override
  State<UserProfileDetailScreen> createState() => _UserProfileDetailScreenState();
}

class _UserProfileDetailScreenState extends State<UserProfileDetailScreen> {
  int _selectedTab = 0;
  bool _isFollowing = false;
  int _followersCount = 0;

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

  @override
  void initState() {
    super.initState();
    _followersCount = widget.user.followersCount ?? 0;
    
    // Check initial follow state
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        final result = await context.read<UserRepo>().checkIsFollowing(widget.user.uid ?? '');
        result.fold(
          (failure) => null,
          (isFollowing) {
            if (mounted) {
              setState(() {
                _isFollowing = isFollowing;
              });
            }
          },
        );
      }
    });
  }

  static final List<String> _mockHighlightImages = <String>[
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80',
    'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&w=150&q=80',
  ];

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
                width: 1.5,
              ),
            ),
          ),
          child: Icon(
            icon,
            size: 22,
            color: isActive ? const Color(0xFFE65100) : AppColors.colorNeutral500,
          ),
        ),
      ),
    );
  }

  Widget _statColumn(final String value, final String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value,
          style: dMSansW700.copyWith(fontSize: 16, color: const Color(0xFFE65100), height: 1.1),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: dMSansW400.copyWith(fontSize: 12, color: AppColors.colorNeutral600),
        ),
      ],
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.8,
        shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE65100)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.user.username ?? '',
              style: dMSansW700.copyWith(fontSize: 16, color: const Color(0xFFE65100)),
            ),
            if (widget.user.isVerified == true) ...<Widget>[
              const SizedBox(width: 4),
              const Icon(Icons.verified, size: 16, color: Color(0xFFFFB300)),
            ],
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFFE65100)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 18),
            // Profile Info Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFFFD700),
                          Color(0xFFFF9933),
                          Color(0xFFFF3300),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: CircleAvatar(
                        radius: 41,
                        backgroundColor: AppColors.colorNeutral200,
                        backgroundImage: NetworkImage(
                          (widget.user.photoUrl != null && widget.user.photoUrl!.isNotEmpty)
                              ? widget.user.photoUrl!
                              : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _statColumn(widget.user.postsCount.toString(), 'posts'),
                        _statColumn(_followersCount.toString(), 'followers'),
                        _statColumn(widget.user.followingCount.toString(), 'following'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.user.fullName,
                    style: dMSansW700.copyWith(fontSize: 14, color: AppColors.colorNeutral900),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Spiritual seeker',
                    style: dMSansW500.copyWith(fontSize: 12, color: AppColors.colorNeutral500),
                  ),
                  if (widget.user.bio != null && widget.user.bio!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      widget.user.bio!,
                      style: dMSansW400.copyWith(fontSize: 12.5, color: AppColors.colorNeutral900),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Action Buttons (Follow / Message / Add Person)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final String targetUid = widget.user.uid ?? '';
                        if (targetUid.isEmpty) return;

                        final UserRepo userRepo = context.read<UserRepo>();
                        final bool prevFollowing = _isFollowing;

                        // Optimistic UI updates
                        setState(() {
                          _isFollowing = !_isFollowing;
                          if (_isFollowing) {
                            _followersCount++;
                          } else {
                            _followersCount = (_followersCount - 1).clamp(0, 9999999);
                          }
                        });

                        final result = prevFollowing
                            ? await userRepo.unfollowUser(targetUid)
                            : await userRepo.followUser(targetUid);

                        result.fold(
                          (final failure) {
                            if (mounted) {
                              setState(() {
                                _isFollowing = prevFollowing;
                                _followersCount = widget.user.followersCount ?? 0;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(failure.message ?? 'An error occurred')),
                              );
                            }
                          },
                          (_) => null,
                        );
                      },
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _isFollowing ? const Color(0xFFFFF3E0) : const Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(8),
                          border: _isFollowing ? Border.all(color: const Color(0xFFFFCC80), width: 0.8) : null,
                        ),
                        child: Text(
                          _isFollowing ? 'Following' : 'Follow',
                          style: dMSansW700.copyWith(
                            fontSize: 13,
                            color: _isFollowing ? const Color(0xFFE65100) : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
                      ),
                      child: Text(
                        'Message',
                        style: dMSansW700.copyWith(fontSize: 13, color: const Color(0xFFE65100)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 38,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
                    ),
                    child: const Icon(Icons.person_add_outlined, size: 18, color: Color(0xFFE65100)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Highlights list
            SizedBox(
              height: 85,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _mockHighlightImages.length,
                itemBuilder: (final BuildContext ctx, final int idx) {
                  final listHighlights = <String>['Satsang', 'Bhajans', 'Amritvani'];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFCC80),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                            ),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(_mockHighlightImages[idx]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          listHighlights[idx],
                          style: dMSansW500.copyWith(fontSize: 10, color: AppColors.colorNeutral800),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Post Tab grid
            const Divider(color: AppColors.dividerColor, height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildTabItem(0, Icons.grid_on_sharp),
                _buildTabItem(1, Icons.play_circle_outline_rounded),
                _buildTabItem(2, Icons.portrait_rounded),
              ],
            ),
            if (_selectedTab == 0)
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('post')
                    .where('uid', isEqualTo: widget.user.uid)
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

                  // Sort posts by createdAt descending
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
                          const SizedBox(height: 48),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: docs.length,
                    itemBuilder: (final BuildContext context, final int index) {
                      final Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                      final String imageUrl = data['imageUrl'] as String? ?? '';
                      final String username = widget.user.username ?? widget.user.fullName;
                      final String userAvatarUrl = widget.user.photoUrl ?? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80';
                      final bool isVerified = widget.user.isVerified ?? false;

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
                            uid: widget.user.uid,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (final BuildContext context) => PostDetailScreen(post: postData),
                            ),
                          );
                        },
                        child: Container(
                          color: AppColors.colorNeutral200,
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
                      );
                    },
                  );
                },
              )
            else
              const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
