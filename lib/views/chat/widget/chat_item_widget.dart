import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';

class ChatItemWidget extends StatelessWidget {
  final UserDataModel user;
  final VoidCallback onTap;

  const ChatItemWidget({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    final String imageUrl = user.userProfileImageUrl ?? '';
    final String initial = user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : 'U';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFFFF9933).withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: const Color(0xFFFF9933).withValues(alpha: 0.08),
            width: 1,
          ),
        ),
        child: Row(
          children: <Widget>[
            // 1. Profile Avatar with Premium Gradient Border and Online Status
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFE65100), // Rich Saffron
                        Color(0xFFFFB300), // Saffron Gold
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: const Color(0xFFFFF3E0),
                      backgroundImage: imageUrl.isNotEmpty ? CachedNetworkImageProvider(imageUrl) : null,
                      child: imageUrl.isEmpty
                          ? Text(
                              initial,
                              style: const TextStyle(
                                color: Color(0xFFE65100),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                if (user.uid != null && user.uid!.isNotEmpty)
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: StreamBuilder<bool>(
                      stream: context.read<ChatRepo>().getUserPresence(user.uid!),
                      builder: (final BuildContext context, final AsyncSnapshot<bool> snapshot) {
                        final bool isOnline = snapshot.data ?? false;
                        if (!isOnline) return const SizedBox.shrink();
                        return Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF16A34A), // Success Green
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 2.5,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),

            // 2. User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          user.fullName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                            fontFamily: 'Inter',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (user.isVerified ?? false) ...<Widget>[
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified,
                          color: Color(0xFFE65100),
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.username ?? "user"}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'Inter',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // 3. Dynamic Message Button
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFFCC80),
                  width: 0.8,
                ),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Color(0xFFE65100),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
