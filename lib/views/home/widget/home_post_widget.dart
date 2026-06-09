import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/like/like_bloc.dart';
import 'package:santvani_app/bloc/share/share_bloc.dart';
import 'package:santvani_app/bloc/save/save_bloc.dart';
import 'package:santvani_app/data/repository/like_repo.dart';
import 'package:santvani_app/data/repository/share_repo.dart';
import 'package:santvani_app/data/repository/save_repo.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/components/bottom_sheet/comment_bottom_sheet.dart';
import 'package:santvani_app/components/bottom_sheet/post_options_bottom_sheet.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';

class PostData {
  const PostData({
    required this.id,
    required this.username,
    required this.userAvatarUrl,
    required this.postImageUrl,
    required this.isVerified,
    required this.initialLikesCount,
    required this.caption,
    required this.timeAgo,
    this.commentsCount = 0,
    this.uid,
  });

  final String id;
  final String username;
  final String userAvatarUrl;
  final String postImageUrl;
  final bool isVerified;
  final int initialLikesCount;
  final String caption;
  final String timeAgo;
  final int commentsCount;
  final String? uid;
}

class HomePostWidget extends StatefulWidget {
  const HomePostWidget({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  State<HomePostWidget> createState() => _HomePostWidgetState();
}

class _HomePostWidgetState extends State<HomePostWidget> with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  bool _isBookmarked = false;
  late int _likesCount;
  bool _isCaptionExpanded = false;
  late String _caption;

  // Double tap heart animation states
  bool _showDoubleTapHeart = false;
  late AnimationController _heartAnimController;
  late Animation<double> _heartScaleAnimation;
  late Animation<double> _heartOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _likesCount = widget.post.initialLikesCount;
    _caption = widget.post.caption;

    // Animation configuration for double-tap heart pop
    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _heartScaleAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.2).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.2, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.easeInBack)),
        weight: 30,
      ),
    ]).animate(_heartAnimController);

    _heartOpacityAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 0.9),
        weight: 30,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.9, end: 0.9),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.9, end: 0.0),
        weight: 30,
      ),
    ]).animate(_heartAnimController);
  }

  @override
  void dispose() {
    _heartAnimController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant final HomePostWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post.initialLikesCount != widget.post.initialLikesCount) {
      setState(() {
        _likesCount = widget.post.initialLikesCount;
      });
    }
    if (oldWidget.post.caption != widget.post.caption) {
      setState(() {
        _caption = widget.post.caption;
      });
    }
  }

  void _onLikeToggled(final BuildContext context) {
    final bool newLikedState = !_isLiked;
    setState(() {
      _isLiked = newLikedState;
      if (newLikedState) {
        _likesCount++;
      } else {
        _likesCount--;
      }
    });
    context.read<LikeBloc>().add(LikeEvent.onToggleLike(postId: widget.post.id, isLiked: newLikedState));
  }

  void _onSaveToggled(final BuildContext context) {
    final bool newSavedState = !_isBookmarked;
    setState(() {
      _isBookmarked = newSavedState;
    });
    context.read<SaveBloc>().add(SaveEvent.onToggleSave(postId: widget.post.id, isSaved: newSavedState));
  }

  void _onDoubleTapLiked(final BuildContext context) {
    if (!_isLiked) {
      setState(() {
        _isLiked = true;
        _likesCount++;
      });
      context.read<LikeBloc>().add(LikeEvent.onToggleLike(postId: widget.post.id, isLiked: true));
    }

    // Trigger double tap big heart animation
    setState(() {
      _showDoubleTapHeart = true;
    });
    _heartAnimController.forward(from: 0.0).then((_) {
      setState(() {
        _showDoubleTapHeart = false;
      });
    });
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LikeBloc>(
          create: (final BuildContext ctx) => LikeBloc(likeRepo: ctx.read<LikeRepo>())
            ..add(LikeEvent.onCheckLikeStatus(postId: widget.post.id)),
        ),
        BlocProvider<ShareBloc>(
          create: (final BuildContext ctx) => ShareBloc(shareRepo: ctx.read<ShareRepo>()),
        ),
        BlocProvider<SaveBloc>(
          create: (final BuildContext ctx) => SaveBloc(saveRepo: ctx.read<SaveRepo>())
            ..add(SaveEvent.onCheckSaveStatus(postId: widget.post.id)),
        ),
      ],
      child: MultiBlocListener(
        listeners: <BlocListener<dynamic, dynamic>>[
          BlocListener<LikeBloc, LikeState>(
            listener: (final BuildContext ctx, final LikeState state) {
              if (state.status == CommonScreenState.success && state.errorMessage == null) {
                setState(() {
                  _isLiked = state.isLiked;
                });
              }
            },
          ),
          BlocListener<SaveBloc, SaveState>(
            listener: (final BuildContext ctx, final SaveState state) {
              if (state.status == CommonScreenState.success && state.errorMessage == null) {
                setState(() {
                  _isBookmarked = state.isSaved;
                });
              }
            },
          ),
          BlocListener<ShareBloc, ShareState>(
            listener: (final BuildContext ctx, final ShareState state) {
              if (state.status == CommonScreenState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xFFE65100),
                    content: Text('Post link shared successfully! 🌸🙏'),
                  ),
                );
                
                // Update navigation tab to ChatScreen (index 2) and pass the post
                context.read<TabNavigationCubit>().updateTab(2, post: widget.post);

                // Pop the current view if we are on a pushed route (e.g. PostDetailScreen)
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              } else if (state.status == CommonScreenState.error && state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color(0xFFD32F2F),
                    content: Text(state.errorMessage!),
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<LikeBloc, LikeState>(
          builder: (final BuildContext ctx, final LikeState state) {
            return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFFFF9933).withValues(alpha: 0.06),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFFFE0B2).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1. Post Header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                // Circular user avatar with gold halo
                Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFFFD700), // Gold
                        Color(0xFFFF9933), // Saffron
                      ],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(widget.post.userAvatarUrl),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            widget.post.username,
                            style: dMSansW700.copyWith(
                              fontSize: 13,
                              color: const Color(0xFF3E2723), // Deep chocolate
                            ),
                          ),
                          if (widget.post.isVerified) ...<Widget>[
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.verified,
                              size: 13,
                              color: Color(0xFFFFB300), // Golden verified badge
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 1.5),
                      Text(
                        'Spiritual Guide',
                        style: dMSansW500.copyWith(
                          fontSize: 9.5,
                          color: const Color(0xFFFF9933),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.post.uid != null && widget.post.uid == FirebaseAuth.instance.currentUser?.uid)
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 18,
                      color: Color(0xFF8D6E63),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        builder: (final BuildContext sheetCtx) {
                          return PostOptionsBottomSheet(
                            postId: widget.post.id,
                            currentCaption: _caption,
                            onDeleteSuccess: () {
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                            },
                            onEditSuccess: (final String newCaption) {
                              setState(() {
                                _caption = newCaption;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
          ),

          // 2. Devotional Quote / Message scroll block (Captions shown as wisdom card)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDF6), // Serene warm paper background
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFFFF3E0),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Icon(
                        Icons.format_quote_rounded,
                        color: Color(0xFFFFB300),
                        size: 22,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE0B2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'DAILY VANI',
                          style: dMSansW700.copyWith(
                            fontSize: 8,
                            color: const Color(0xFFE65100),
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final String fullText = _caption;
                      final bool showMoreButton = fullText.length > 100 && !_isCaptionExpanded;
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            fullText,
                            maxLines: _isCaptionExpanded ? null : 3,
                            overflow: _isCaptionExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
                            style: dMSansW500.copyWith(
                              fontSize: 12.5,
                              color: const Color(0xFF4E342E), // Deep brown
                              height: 1.45,
                            ),
                          ),
                          if (showMoreButton)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isCaptionExpanded = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'read more',
                                  style: dMSansW600.copyWith(
                                    fontSize: 11.5,
                                    color: const Color(0xFFE65100),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 3. Post Content (Rounded Sacred Portrait Frame with Double Tap Gesture)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onDoubleTap: () => _onDoubleTapLiked(ctx),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFCC80),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.15, // Serene rectangular frame
                        child: Image.network(
                          widget.post.postImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: const Color(0xFFFFFBF0),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFFFF9933),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Animated overlay heart/lotus on double tap
                  if (_showDoubleTapHeart)
                    AnimatedBuilder(
                      animation: _heartAnimController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _heartScaleAnimation.value,
                          child: Opacity(
                            opacity: _heartOpacityAnimation.value,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.9),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: const Color(0xFFFF9933).withValues(alpha: 0.4),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.spa_rounded, // Gorgeous blooming lotus popup for double tap
                                color: Color(0xFFFF9933),
                                size: 68,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),

          // 4. Devotional Action Buttons (Likes, Comment, Share, Bookmark)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Like/Bless icon button
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: _isLiked ? const Color(0xFFE65100) : const Color(0xFF8D6E63),
                        size: 24,
                      ),
                      onPressed: () => _onLikeToggled(ctx),
                    ),
                    const SizedBox(width: 2),
                    // Comment button
                    IconButton(
                      icon: const Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Color(0xFF8D6E63),
                        size: 21,
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          builder: (final BuildContext sheetContext) {
                            return CommentBottomSheet(postId: widget.post.id);
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 2),
                    // Share button
                    IconButton(
                      icon: const Icon(
                        Icons.share_rounded,
                        color: Color(0xFF8D6E63),
                        size: 21,
                      ),
                      onPressed: () {
                        // Update navigation tab to ChatScreen (index 2) and pass the post
                        context.read<TabNavigationCubit>().updateTab(2, post: widget.post);

                        // Pop the current view if we are on a pushed route (e.g. PostDetailScreen)
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    _isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: _isBookmarked ? const Color(0xFFE65100) : const Color(0xFF8D6E63),
                    size: 22,
                  ),
                  onPressed: () => _onSaveToggled(ctx),
                ),
              ],
            ),
          ),

          // 5. Devotional Footer Details
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Soft Blessings count text instead of dry social like count
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: Color(0xFFFFB300),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$_likesCount Blessings',
                      style: dMSansW700.copyWith(
                        fontSize: 11.5,
                        color: const Color(0xFF5D4037),
                      ),
                    ),
                  ],
                ),
                // Timestamp
                Text(
                  widget.post.timeAgo.toUpperCase(),
                  style: dMSansW500.copyWith(
                    fontSize: 8.5,
                    color: const Color(0xFF8D6E63),
                    letterSpacing: 0.3,
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
      ),
    );
  }
}
