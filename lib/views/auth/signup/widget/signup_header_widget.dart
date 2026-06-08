import 'package:flutter/material.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/utils.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // santvani_app logo box — Vepar4u blue matching splash/login
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF3A8DDD).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'santvani_app',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2672C0),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),

        24.0.h,

        Text(
          'Create Account'.tr(context),
          style: dMSansW700.copyWith(
            color: AppColors.black,
            fontSize: 30,
          ),
        ),

        10.0.h,

        Text(
          'Join Vepar4u to grow your distribution business.'.tr(context),
          style: dMSansW400.copyWith(
            color: AppColors.baseColorWhite45,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
