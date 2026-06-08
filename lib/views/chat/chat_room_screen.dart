import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/chat/chat_bloc.dart';
import 'package:santvani_app/data/models/chat/message_model.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/views/chat/widget/chat_bubble_widget.dart';
import 'package:santvani_app/views/chat/widget/chat_input_widget.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';
import 'package:santvani_app/data/repository/share_repo.dart';

class ChatRoomScreen extends StatefulWidget {
  final UserDataModel targetUser;
  final PostData? sharedPost;
  const ChatRoomScreen({super.key, required this.targetUser, this.sharedPost});
  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  PostData? _sharedPost;

  @override
  void initState() {
    super.initState();
    _sharedPost = widget.sharedPost;
    context.read<ChatBloc>().add(ChatEvent.openChat(targetUser: widget.targetUser));
    context.read<TabNavigationCubit>().clearSharedPost();
  }

  @override
  void dispose() {
    context.read<ChatBloc>().add(const ChatEvent.clearActiveChat());
    super.dispose();
  }

  void _showThemeSelectionDialog(final BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        title: const Text('Select Chat Theme', style: TextStyle(color: Color(0xFFE65100), fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _themeOptionTile(context, 0, 'Saffron Parchment', const Color(0xFFFCF8F2)),
            _themeOptionTile(context, 1, 'Spiritual Light Gold', const Color(0xFFFEF3C7)),
            _themeOptionTile(context, 2, 'Tranquil Sky Blue', const Color(0xFFE0F2FE)),
            _themeOptionTile(context, 3, 'Pure Saffron Light', const Color(0xFFFFF3E0)),
          ],
        ),
      ),
    );
  }

  Widget _themeOptionTile(final BuildContext context, final int index, final String name, final Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color, radius: 12, child: Container(decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 0.5)))),
      title: Text(name),
      onTap: () {
        context.read<ChatBloc>().add(ChatEvent.changeTheme(themeIndex: index));
        Navigator.pop(context);
      },
    );
  }

  void _showClearChatConfirmation(final BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (final BuildContext dialogContext) => AlertDialog(
        title: const Text('Clear chat?', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('This will delete all messages in this chat.'),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Cancel', style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () {
              context.read<ChatBloc>().add(const ChatEvent.clearChatMessages());
              Navigator.pop(dialogContext);
            },
            child: const Text('Clear chat', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final String myUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final String imageUrl = widget.targetUser.userProfileImageUrl ?? '';
    final String initial = widget.targetUser.fullName.isNotEmpty ? widget.targetUser.fullName[0].toUpperCase() : 'U';
    final List<Color> themes = <Color>[const Color(0xFFFCF8F2), const Color(0xFFFEF3C7), const Color(0xFFE0F2FE), const Color(0xFFFFF3E0)];

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (final BuildContext context, final ChatState state) {
        return Scaffold(
          backgroundColor: themes[state.themeIndex],
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryTextColor, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            titleSpacing: 0,
            title: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFFFFF3E0),
                  backgroundImage: imageUrl.isNotEmpty ? CachedNetworkImageProvider(imageUrl) : null,
                  child: imageUrl.isEmpty ? Text(initial, style: const TextStyle(color: Color(0xFFE65100), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Inter')) : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(child: Text(widget.targetUser.fullName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryTextColor, fontFamily: 'Inter'), maxLines: 1, overflow: TextOverflow.ellipsis)),
                          if (widget.targetUser.isVerified ?? false) ...<Widget>[const SizedBox(width: 4), const Icon(Icons.verified, color: Color(0xFFE65100), size: 15)],
                        ],
                      ),
                      const SizedBox(height: 2),
                      StreamBuilder<bool>(
                        stream: context.read<ChatRepo>().getUserPresence(widget.targetUser.uid ?? ''),
                        builder: (final BuildContext context, final AsyncSnapshot<bool> snapshot) {
                          final bool isOnline = snapshot.data ?? false;
                          return Text(isOnline ? 'Online' : 'Offline', style: TextStyle(fontSize: 11, color: isOnline ? const Color(0xFF16A34A) : AppColors.secondaryTextColor, fontWeight: isOnline ? FontWeight.bold : FontWeight.normal, fontFamily: 'Inter'), maxLines: 1, overflow: TextOverflow.ellipsis);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              StreamBuilder<bool>(
                stream: context.read<ChatRepo>().isUserBlocked(widget.targetUser.uid ?? ''),
                builder: (final BuildContext context, final AsyncSnapshot<bool> snapshot) {
                  final bool isBlocked = snapshot.data ?? false;
                  return PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: AppColors.primaryTextColor),
                    onSelected: (final String value) {
                      if (value == 'theme') _showThemeSelectionDialog(context);
                      if (value == 'clear') _showClearChatConfirmation(context);
                      if (value == 'block') {
                        context.read<ChatBloc>().add(ChatEvent.toggleBlockUser(targetUid: widget.targetUser.uid ?? '', block: !isBlocked));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isBlocked ? 'User Unblocked' : 'User Blocked')));
                      }
                    },
                    itemBuilder: (final BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(value: 'theme', child: Row(children: <Widget>[Icon(Icons.palette_outlined, size: 20), SizedBox(width: 8), Text('Chat Theme')])),
                      PopupMenuItem<String>(value: 'block', child: Row(children: <Widget>[Icon(isBlocked ? Icons.security : Icons.block, size: 20, color: Colors.red), const SizedBox(width: 8), Text(isBlocked ? 'Unblock User' : 'Block User', style: const TextStyle(color: Colors.red))])),
                      const PopupMenuItem<String>(value: 'clear', child: Row(children: <Widget>[Icon(Icons.delete_sweep_outlined, size: 20, color: Colors.red), SizedBox(width: 8), Text('Clear Chat', style: TextStyle(color: Colors.red))])),
                    ],
                  );
                },
              ),
            ],
            bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0), child: Container(color: const Color(0xFFFF9933).withValues(alpha: 0.15), height: 1.0)),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (final BuildContext context, final ChatState state) {
                      final List<MessageModel> reversedMessages = state.messages.reversed.toList();
                      if (reversedMessages.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(Icons.chat_bubble_outline_rounded, color: Color(0xFFFFE0B2), size: 48),
                              const SizedBox(height: 12),
                              Text('Exchanging blessings with ${widget.targetUser.fullName}', style: const TextStyle(fontSize: 14, color: AppColors.secondaryTextColor, fontStyle: FontStyle.italic, fontFamily: 'Inter')),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: reversedMessages.length,
                        itemBuilder: (final BuildContext context, final int index) {
                          final MessageModel message = reversedMessages[index];
                          return ChatBubbleWidget(message: message, isMe: message.senderId == myUid);
                        },
                      );
                    },
                  ),
                ),
                if (_sharedPost != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1), // Light golden paper color
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFFB300), width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: _sharedPost!.postImageUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sharing post from ${_sharedPost!.username}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE65100),
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _sharedPost!.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _sharedPost = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ChatInputWidget(
                  onSend: (final String text) => context.read<ChatBloc>().add(ChatEvent.sendMessage(messageText: text)),
                  onSendImage: (final String path) => context.read<ChatBloc>().add(ChatEvent.sendPhoto(localFilePath: path)),
                  onSendShare: _sharedPost == null ? null : (final String text) {
                    final String msgText = text.isEmpty ? _sharedPost!.caption : text;
                    context.read<ChatBloc>().add(ChatEvent.sendMessage(
                      messageText: msgText,
                      imageUrl: _sharedPost!.postImageUrl,
                      postId: _sharedPost!.id,
                    ));
                    
                    // Increment the share count in DB & show success snackbar!
                    context.read<ShareRepo>().sharePost(postId: _sharedPost!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xFFE65100),
                        content: Text('Post link shared successfully! 🌸🙏'),
                      ),
                    );

                    setState(() {
                      _sharedPost = null;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
