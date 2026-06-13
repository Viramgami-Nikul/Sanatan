import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:santvani_app/bloc/like/like_bloc.dart';
import 'package:santvani_app/bloc/share/share_bloc.dart';
import 'package:santvani_app/data/repository/like_repo.dart';
import 'package:santvani_app/data/repository/share_repo.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/components/bottom_sheet/comment_bottom_sheet.dart';

class ReelItemWidget extends StatefulWidget {
  const ReelItemWidget({
    super.key,
    required this.reel,
  });

  final ReelModel reel;

  @override
  State<ReelItemWidget> createState() => _ReelItemWidgetState();
}

class _ReelItemWidgetState extends State<ReelItemWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = true;
  bool _showPlayPauseOverlay = false;
  bool _isLiked = false;
  late int _likesCount;

  @override
  void initState() {
    super.initState();
    _likesCount = widget.reel.likesCount;
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.reel.videoUrl));
    try {
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing video player: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_isInitialized) return;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
      _showPlayPauseOverlay = true;
    });

    Future<void>.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          _showPlayPauseOverlay = false;
        });
      }
    });
  }

  void _toggleLike(final BuildContext ctx) {
    final bool newLikedState = !_isLiked;
    setState(() {
      _isLiked = newLikedState;
      if (newLikedState) {
        _likesCount++;
      } else {
        _likesCount--;
      }
    });
    ctx.read<LikeBloc>().add(LikeEvent.onToggleLike(postId: widget.reel.reelId, isLiked: newLikedState));
  }

  Future<Map<String, dynamic>?> _getUserData() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.reel.uid)
        .get();
    return doc.data() as Map<String, dynamic>?;
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LikeBloc>(
          create: (final BuildContext ctx) => LikeBloc(likeRepo: ctx.read<LikeRepo>())
            ..add(LikeEvent.onCheckLikeStatus(postId: widget.reel.reelId)),
        ),
        BlocProvider<ShareBloc>(
          create: (final BuildContext ctx) => ShareBloc(shareRepo: ctx.read<ShareRepo>()),
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
          BlocListener<ShareBloc, ShareState>(
            listener: (final BuildContext ctx, final ShareState state) {
              if (state.status == CommonScreenState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xFFE65100),
                    content: Text('Reel shared successfully! 🌸🙏'),
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<LikeBloc, LikeState>(
          builder: (final BuildContext ctx, final LikeState state) {
            return Stack(
              children: <Widget>[
                // 1. Video Player
                GestureDetector(
                  onTap: _togglePlayPause,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                    child: _isInitialized
                        ? Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFFF9933),
                            ),
                          ),
                  ),
                ),

                // 2. Play/Pause Overlay Animation
                if (_showPlayPauseOverlay)
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      opacity: _showPlayPauseOverlay ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        child: Icon(
                          _isPlaying ? Icons.play_arrow_rounded : Icons.pause_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                // 3. User & Caption Overlay (Bottom Left)
                Positioned(
                  left: 16,
                  bottom: 24,
                  right: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FutureBuilder<Map<String, dynamic>?>(
                        future: _getUserData(),
                        builder: (final BuildContext context, final AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                          final Map<String, dynamic>? data = snapshot.data;
                          final String username = data?['username'] ?? data?['full_name'] ?? 'spiritual_seeker';
                          final String? avatar = data?['photoUrl'] ?? data?['profile_image'];

                          return Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(1.2),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFF9933),
                                ),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundImage: avatar != null && avatar.isNotEmpty
                                      ? NetworkImage(avatar)
                                      : const NetworkImage(
                                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                                        ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                username,
                                style: dMSansW700.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.reel.caption,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: dMSansW500.copyWith(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.4,
                          shadows: <Shadow>[
                            const Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      if (widget.reel.category != null) ...<Widget>[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9933).withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.reel.category!.toUpperCase(),
                            style: dMSansW700.copyWith(
                              color: Colors.white,
                              fontSize: 9,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // 4. Action Sidebar Overlay (Right)
                Positioned(
                  right: 16,
                  bottom: 40,
                  child: Column(
                    children: <Widget>[
                      // Like Action
                      IconButton(
                        icon: Icon(
                          _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: _isLiked ? const Color(0xFFFF5252) : Colors.white,
                          size: 30,
                        ),
                        onPressed: () => _toggleLike(ctx),
                      ),
                      Text(
                        '$_likesCount',
                        style: dMSansW700.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Comment Action
                      IconButton(
                        icon: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            builder: (final BuildContext sheetContext) {
                              return CommentBottomSheet(postId: widget.reel.reelId);
                            },
                          );
                        },
                      ),
                      Text(
                        '${widget.reel.commentsCount}',
                        style: dMSansW700.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Share Action
                      IconButton(
                        icon: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          ctx.read<ShareBloc>().add(ShareEvent.onSharePost(postId: widget.reel.reelId));
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                // 5. Video Progress Bar (Bottom)
                if (_isInitialized)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Color(0xFFFF9933),
                        bufferedColor: Colors.white30,
                        backgroundColor: Colors.white12,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
