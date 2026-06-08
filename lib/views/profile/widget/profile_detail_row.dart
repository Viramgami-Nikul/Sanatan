import 'package:flutter/material.dart';

import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/utils.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow(
    this.label,
    this.value, {
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.colorA478D1.withValues(alpha: 0.15),
            AppColors.color4478D1.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: dMSansW400.copyWith(
              fontSize: 14,
              color: AppColors.baseColorWhite45,
            ),
          ),
          4.h,
          Text(
            value,
            style: dMSansW600.copyWith(
              fontSize: 16,
              color: AppColors.color4478D1,
            ),
          ),
        ],
      ),
    );
  }
}
