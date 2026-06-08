import 'package:flutter/material.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  String _greeting() {
    final int hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(final BuildContext context) {
    final String? fullName =
        SharedPreferenceHelper().user?.fullName;
    final String firstName =
        (fullName ?? 'User').split(' ').first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      child: Row(
        children: <Widget>[
          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.colorPrimary100,
            child: Text(
              firstName.isNotEmpty ? firstName[0].toUpperCase() : 'U',
              style: dMSansW700.copyWith(
                fontSize: 20,
                color: AppColors.color4478D1,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Greeting text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${_greeting()} ',
                      style: dMSansW400.copyWith(
                        fontSize: 13,
                        color: AppColors.colorNeutral600,
                      ),
                    ),
                    const Text('👋', style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  fullName ?? 'User',
                  style: dMSansW700.copyWith(
                    fontSize: 17,
                    color: AppColors.colorNeutral900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Settings icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.colorNeutral200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.settings_outlined,
              size: 20,
              color: AppColors.colorNeutral700,
            ),
          ),
        ],
      ),
    );
  }
}
