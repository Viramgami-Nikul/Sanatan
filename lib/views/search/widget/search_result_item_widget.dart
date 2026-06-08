import 'package:flutter/material.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/views/search/user_profile_detail_screen.dart';

class SearchResultItemWidget extends StatelessWidget {
  const SearchResultItemWidget({
    super.key,
    required this.user,
  });

  final UserDataModel user;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (final BuildContext ctx) => UserProfileDetailScreen(user: user),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDF6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFE0B2), width: 0.8),
        ),
        child: Row(
          children: <Widget>[
            // Avatar
            Container(
              padding: const EdgeInsets.all(1.5),
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
                padding: const EdgeInsets.all(1.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    (user.photoUrl != null && user.photoUrl!.isNotEmpty)
                        ? user.photoUrl!
                        : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Name / Username
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        user.username ?? '',
                        style: dMSansW700.copyWith(fontSize: 13.5, color: AppColors.colorNeutral900),
                      ),
                      if (user.isVerified == true) ...<Widget>[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          size: 14,
                          color: Color(0xFFFFB300),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    user.fullName,
                    style: dMSansW400.copyWith(fontSize: 12, color: AppColors.colorNeutral600),
                  ),
                ],
              ),
            ),
            // Saffron View Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
              ),
              child: Text(
                'View',
                style: dMSansW700.copyWith(fontSize: 12, color: const Color(0xFFE65100)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
