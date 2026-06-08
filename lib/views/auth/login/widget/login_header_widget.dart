import 'package:flutter/material.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/utils.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // santvani_app logo circle — matches splash screen style
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.20),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Santvani',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),

        28.h,

        Text(
          'Welcome to Vepar4u'.tr(context),
          textAlign: TextAlign.center,
          style: dMSansW700.copyWith(
            color: AppColors.white,
            fontSize: 28,
          ),
        ),

        12.h,

        Text(
          'Grow your distribution business'.tr(context),
          textAlign: TextAlign.center,
          style: dMSansW400.copyWith(
            color: AppColors.white,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
