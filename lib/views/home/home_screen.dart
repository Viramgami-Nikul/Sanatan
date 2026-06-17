import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:santvani_app/bloc/auth/home_bloc.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';
import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/api/either.dart';

import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/views/home/widget/home_app_bar_widget.dart';
import 'package:santvani_app/views/home/widget/home_stories_widget.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/bloc/category/category_bloc.dart';
import 'package:santvani_app/views/category/category_page.dart';
import 'package:santvani_app/utils/app_enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserDataModel> _followedUsers = <UserDataModel>[];
  List<PostData> _feedPosts = <PostData>[];
  bool _isLoading = true;
  Future<List<PostData>>? _categoryPostsFuture;
  List<PostModel>? _cachedCategoryPosts;

  static final List<PostData> _mockPosts = <PostData>[
    const PostData(
      id: '1',
      username: 'bhajanmarg_official',
      userAvatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80',
      postImageUrl: 'https://images.unsplash.com/photo-1566737236500-c8ac43014a67?auto=format&fit=crop&w=600&q=80',
      isVerified: true,
      initialLikesCount: 1482,
      caption: 'पूज्य महाराज श्री के दिव्य विचार और मधुर भजन। राधे राधे! 🙏✨ #satsang #bhajan #radharani #krishna #sadguru',
      timeAgo: '2 hours ago',
      commentsCount: 48,
    ),
    const PostData(
      id: '2',
      username: 'sadguru_lines',
      userAvatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
      postImageUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=600&q=80',
      isVerified: true,
      initialLikesCount: 924,
      caption: 'Silence is the source of great strength. Live in the present moment. 🌸🧘‍♂️ #spiritual #wisdom #meditation #peace',
      timeAgo: '5 hours ago',
      commentsCount: 19,
    ),
    const PostData(
      id: '3',
      username: 'sant_vani',
      userAvatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&q=80',
      postImageUrl: 'https://images.unsplash.com/photo-1602631985686-25b7a597e7b5?auto=format&fit=crop&w=600&q=80',
      isVerified: false,
      initialLikesCount: 351,
      caption: 'आज की अमृतवाणी: संतोष ही परम सुख है। मन को शांत रखें और प्रभु स्मरण करें। 🚩🌸 #santvani #motivational #quotes',
      timeAgo: '1 day ago',
      commentsCount: 11,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadHomeFeed();
  }

  String _getTimeAgo(final dynamic createdAt) {
    if (createdAt == null) return 'just now';
    DateTime? date;
    if (createdAt is Timestamp) {
      date = createdAt.toDate();
    } else if (createdAt is DateTime) {
      date = createdAt;
    }
    if (date == null) return 'just now';

    final Duration difference = DateTime.now().difference(date);
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  Future<void> _loadHomeFeed() async {
    try {
      final ChatRepo chatRepo = context.read<ChatRepo>();
      final PostRepo postRepo = context.read<PostRepo>();

      // 1. Fetch followed users
      final Either<Failure, List<UserDataModel>> followedResult = await chatRepo.getFollowedUsers();

      List<UserDataModel> followed = <UserDataModel>[];
      followedResult.fold(
        (final Failure failure) {
          debugPrint('Error fetching followed users: ${failure.message}');
        },
        (final List<UserDataModel> users) {
          followed = users;
        },
      );

      // 2. Fetch posts of followed users
      final List<MapEntry<PostModel, UserDataModel>> merged = <MapEntry<PostModel, UserDataModel>>[];
      if (followed.isNotEmpty) {
        for (final UserDataModel user in followed) {
          final String? uid = user.uid;
          if (uid == null || uid.isEmpty) continue;
          
          final Either<Failure, List<PostModel>> postsResult = await postRepo.getUserPosts(uid: uid);
          postsResult.fold(
            (final Failure failure) {},
            (final List<PostModel> userPosts) {
              for (final PostModel post in userPosts) {
                merged.add(MapEntry<PostModel, UserDataModel>(post, user));
              }
            },
          );
        }
      }

      // Sort the merged list by createdAt descending
      merged.sort((final a, final b) {
        final dynamic aTime = a.key.createdAt;
        final dynamic bTime = b.key.createdAt;
        
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

      // Map to PostData
      final List<PostData> feed = merged.map((final MapEntry<PostModel, UserDataModel> entry) {
        final PostModel post = entry.key;
        final UserDataModel user = entry.value;
        return PostData(
          id: post.postId,
          username: user.username ?? user.fullName,
          userAvatarUrl: user.profileImage ?? user.photoUrl ?? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
          postImageUrl: post.imageUrl,
          isVerified: user.isVerified ?? false,
          initialLikesCount: post.likesCount,
          caption: post.caption,
          timeAgo: _getTimeAgo(post.createdAt),
          commentsCount: post.commentsCount,
          uid: post.uid,
        );
      }).toList();

      if (mounted) {
        setState(() {
          _followedUsers = followed;
          _feedPosts = feed;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading home feed: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<List<PostData>> _mapPostsToPostData(final List<PostModel> posts) async {
    final List<PostData> result = <PostData>[];
    final Map<String, UserDataModel> userCache = <String, UserDataModel>{};
    for (final PostModel post in posts) {
      try {
        UserDataModel? user = userCache[post.uid];
        if (user == null) {
          final DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(post.uid).get();
          if (doc.exists) {
            final Map<String, dynamic> data = Map<String, dynamic>.from(doc.data() as Map<String, dynamic>);
            data['full_name'] ??= data['name'] ?? 'Viramgami Nikul';
            userCache[post.uid] = UserDataModel.fromJson(data);
          }
        }
        user = userCache[post.uid];
        if (user != null) {
          result.add(PostData(
            id: post.postId,
            username: user.username ?? user.fullName,
            userAvatarUrl: user.profileImage ?? user.photoUrl ?? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
            postImageUrl: post.imageUrl,
            isVerified: user.isVerified ?? false,
            initialLikesCount: post.likesCount,
            caption: post.caption,
            timeAgo: _getTimeAgo(post.createdAt),
            commentsCount: post.commentsCount,
            uid: post.uid,
          ));
        }
      } catch (e) {
        debugPrint('Error mapping post ${post.postId}: $e');
      }
    }
    return result;
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..add(OnShowAppUpdateDialog()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: darkStatusBarTransparent,
        child: Scaffold(
          backgroundColor: const Color(0xFFFCF8F2), // Serene parchment/sandstone background
          appBar: const HomeAppBarWidget(),
          body: SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (final BuildContext ctx, final HomeState state) {
                return RefreshIndicator(
                  color: AppColors.color4478D1,
                  onRefresh: () async {
                    ctx.read<HomeBloc>().add(OnShowAppUpdateDialog());
                    await _loadHomeFeed();
                  },
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFE65100),
                          ),
                        )
                      : SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Horizontal Stories List
                              HomeStoriesWidget(followedUsers: _followedUsers),

                              // Category Selection List
                              const CategoryPage(),

                              // Vertical Feed Posts (Filtered by Category)
                              BlocBuilder<CategoryBloc, CategoryState>(
                                builder: (final BuildContext context, final CategoryState categoryState) {
                                  if (categoryState.selectedCategory.toLowerCase() != 'all') {
                                    if (categoryState.status == CommonScreenState.loading) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 40),
                                          child: CircularProgressIndicator(
                                            color: Color(0xFFE65100),
                                          ),
                                        ),
                                      );
                                    }

                                    if (categoryState.posts.isEmpty) {
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              const Icon(
                                                Icons.post_add_rounded,
                                                size: 64,
                                                color: Color(0xFFFFCC80),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                'No posts found in this category.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.brown[400],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    if (_cachedCategoryPosts != categoryState.posts) {
                                      _cachedCategoryPosts = categoryState.posts;
                                      _categoryPostsFuture = _mapPostsToPostData(categoryState.posts);
                                    }

                                    return FutureBuilder<List<PostData>>(
                                      future: _categoryPostsFuture,
                                      builder: (final BuildContext context, final AsyncSnapshot<List<PostData>> snapshot) {
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 40),
                                              child: Text(
                                                'Error: ${snapshot.error}',
                                                style: const TextStyle(color: Colors.redAccent),
                                              ),
                                            ),
                                          );
                                        }
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 40),
                                              child: CircularProgressIndicator(
                                                color: Color(0xFFE65100),
                                              ),
                                            ),
                                          );
                                        }

                                        final List<PostData> categoryFeed = snapshot.data!;
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: categoryFeed.length,
                                          itemBuilder: (final BuildContext context, final int index) {
                                            return HomePostWidget(post: categoryFeed[index]);
                                          },
                                        );
                                      },
                                    );
                                  }

                                  // Default 'All' category behavior: show followed posts or mock posts
                                  if (_followedUsers.isEmpty) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _mockPosts.length,
                                      itemBuilder: (final BuildContext context, final int index) {
                                        return HomePostWidget(post: _mockPosts[index]);
                                      },
                                    );
                                  } else if (_feedPosts.isEmpty) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.post_add_rounded,
                                              size: 64,
                                              color: Color(0xFFFFCC80),
                                            ),
                                            const SizedBox(height: 12),
                                            Text(
                                              'No posts found from the people you follow.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown[400],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _feedPosts.length,
                                      itemBuilder: (final BuildContext context, final int index) {
                                        return HomePostWidget(post: _feedPosts[index]);
                                      },
                                    );
                                  }
                                },
                              ),

                              const SizedBox(height: 100), // Spacing for floating bottom navigation bar
                            ],
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
