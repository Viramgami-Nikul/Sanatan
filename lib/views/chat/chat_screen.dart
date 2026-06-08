import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/chat/chat_bloc.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/chat/chat_room_screen.dart';
import 'package:santvani_app/views/chat/widget/chat_item_widget.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';

class ChatScreen extends StatefulWidget {
  final PostData? sharedPost;
  const ChatScreen({super.key, this.sharedPost});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.loadFollowedUsers());
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F2), // Serene parchment background
      appBar: AppBar(
        title: const Text(
          'Santvani Messaging',
          style: TextStyle(
            color: Color(0xFFE65100),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFFF9933).withValues(alpha: 0.15),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (final BuildContext context, final ChatState state) {
            if (state.status == CommonScreenState.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE65100)),
                ),
              );
            }

            if (state.status == CommonScreenState.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.error_outline_rounded,
                      color: AppColors.colorError500,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.errorMessage ?? 'Unable to load chats',
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE65100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context.read<ChatBloc>().add(const ChatEvent.loadFollowedUsers());
                      },
                      child: const Text('Retry', style: TextStyle(color: AppColors.white)),
                    ),
                  ],
                ),
              );
            }

            final List<UserDataModel> users = state.followedUsers;

            if (users.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.question_answer_outlined,
                        color: Color(0xFFFFCC80),
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Spiritual Connections Yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryTextColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Follow religious guides and friends from the search tab to start exchanging messages.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryTextColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return RefreshIndicator(
              color: const Color(0xFFE65100),
              onRefresh: () async {
                context.read<ChatBloc>().add(const ChatEvent.loadFollowedUsers());
                await Future<void>.delayed(const Duration(milliseconds: 600));
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: users.length,
                itemBuilder: (final BuildContext context, final int index) {
                  final UserDataModel user = users[index];
                  return ChatItemWidget(
                    user: user,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (final BuildContext context) => ChatRoomScreen(
                            targetUser: user,
                            sharedPost: widget.sharedPost,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
