import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/save/save_bloc.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/save_repo.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/views/post/post_detail_screen.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';
import 'package:santvani_app/views/reel/widget/reel_item_widget.dart';

class SavedPostsScreen extends StatefulWidget {
  const SavedPostsScreen({super.key});

  @override
  State<SavedPostsScreen> createState() => _SavedPostsScreenState();
}

class _SavedPostsScreenState extends State<SavedPostsScreen> {
  final String _currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
  int _selectedTab = 0;

  String _getTimeAgo(final dynamic createdAt) {
    if (createdAt == null) return 'just now';
    final DateTime date = createdAt is Timestamp ? createdAt.toDate() : (createdAt is DateTime ? createdAt : DateTime.now());
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365) return '${(diff.inDays / 365).floor()} years ago';
    if (diff.inDays > 30) return '${(diff.inDays / 30).floor()} months ago';
    if (diff.inDays > 0) return '${diff.inDays} days ago';
    if (diff.inHours > 0) return '${diff.inHours} hours ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes} minutes ago';
    return 'just now';
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

  Widget _buildTabItem(final int index, final IconData icon) {
    final bool isActive = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: isActive ? const Color(0xFFE65100) : Colors.transparent, width: 2.0))),
          child: Icon(icon, size: 22, color: isActive ? const Color(0xFFE65100) : const Color(0xFF8D6E63)),
        ),
      ),
    );
  }

  Widget _buildGrid(final List<PostData> items, final String emptyMsg) {
    if (items.isEmpty) {
      return Center(child: Padding(padding: const EdgeInsets.only(top: 60), child: Text(emptyMsg, style: dMSansW600.copyWith(color: Colors.brown[400], fontSize: 14))));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: items.length,
      itemBuilder: (final _, final int i) {
        final PostData post = items[i];
        final bool isReel = post.caption.toLowerCase().contains('reel');

        return GestureDetector(
          onTap: () {
            if (isReel) {
              final ReelModel reelModel = ReelModel(
                reelId: post.id,
                uid: post.uid ?? '',
                videoUrl: post.postImageUrl,
                caption: post.caption,
                likesCount: post.initialLikesCount,
                commentsCount: post.commentsCount,
                createdAt: null,
              );
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (final BuildContext routeContext) => Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(routeContext),
                      ),
                    ),
                    extendBodyBehindAppBar: true,
                    body: ReelItemWidget(reel: reelModel),
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (final _) => PostDetailScreen(post: post),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFE0B2).withValues(alpha: 0.8), width: 1.2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: isReel
                  ? Container(
                      color: const Color(0xFFFFF3E0),
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_outline_rounded,
                          color: Color(0xFFFFB300),
                          size: 40,
                        ),
                      ),
                    )
                  : post.postImageUrl.isNotEmpty
                      ? Image.network(post.postImageUrl, fit: BoxFit.cover)
                      : Container(
                          color: const Color(0xFFFFF3E0),
                          child: const Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: Color(0xFFFFB300),
                            ),
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SaveBloc>(
      create: (final BuildContext ctx) => SaveBloc(saveRepo: ctx.read<SaveRepo>())..add(SaveEvent.onLoadSavedPosts(userId: _currentUserId)),
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF8F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFCF8F2),
          elevation: 0.8,
          shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFE65100), size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Saved Reels & Posts', style: dMSansW700.copyWith(color: const Color(0xFFE65100), fontSize: 18)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              height: 2,
              decoration: const BoxDecoration(gradient: LinearGradient(colors: <Color>[Color(0xFFFFD700), Color(0xFFFF9933), Color(0xFFFF3300)])),
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<SaveBloc, SaveState>(
            builder: (final BuildContext ctx, final SaveState state) {
              if (state.status == CommonScreenState.loading) {
                return const Center(child: CircularProgressIndicator(color: Color(0xFFE65100)));
              }
              if (state.status == CommonScreenState.error) {
                return Center(child: Text(state.errorMessage ?? 'Error', style: dMSansW600.copyWith(color: Colors.redAccent)));
              }
              if (state.savedPosts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.bookmark_border_rounded, size: 64, color: Color(0xFFFFCC80)),
                      const SizedBox(height: 12),
                      Text('No saved items yet 🌸', style: dMSansW600.copyWith(color: Colors.brown[400], fontSize: 15)),
                    ],
                  ),
                );
              }
              return FutureBuilder<List<PostData>>(
                future: _mapPostsToPostData(state.savedPosts),
                builder: (final BuildContext context, final AsyncSnapshot<List<PostData>> snapshot) {
                  if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}', style: dMSansW600.copyWith(color: Colors.redAccent)));
                  if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Color(0xFFE65100)));

                  final List<PostData> savedFeed = snapshot.data!;
                  final List<PostData> posts = savedFeed.where((final p) => !p.caption.toLowerCase().contains('reel')).toList();
                  final List<PostData> reels = savedFeed.where((final p) => p.caption.toLowerCase().contains('reel')).toList();

                  return Column(
                    children: <Widget>[
                      Row(children: <Widget>[_buildTabItem(0, Icons.grid_on_sharp), _buildTabItem(1, Icons.play_circle_outline_rounded)]),
                      const Divider(color: Color(0xFFFFCC80), height: 1),
                      Expanded(
                        child: _selectedTab == 0
                            ? _buildGrid(posts, 'No saved posts found 🌸')
                            : _buildGrid(reels, 'No saved reels found 🎥'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
