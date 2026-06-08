import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/widget_ext.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/views/auth/signup/signup_page.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: AppColors.baseColorWhite85,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'OR'.tr(context),
                style: dMSansW500.copyWith(
                  fontSize: 13,
                  color: AppColors.baseColorWhite45,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.baseColorWhite85,
                thickness: 1,
              ),
            ),
          ],
        ),

        24.paddingTop,

        Container(
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.baseColorWhite85,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.g_mobiledata_rounded,
                size: 34,
                color: Colors.red,
              ),
              6.paddingLeft,
              Text(
                'Continue with Google'.tr(context),
                style: dMSansW600.copyWith(
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),

        28.paddingTop,

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Don’t have an account? '.tr(context),
            style: dMSansW400.copyWith(
              fontSize: 14,
              color: AppColors.baseColorWhite45,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: 'Sign Up'.tr(context),
                style: dMSansW700.copyWith(
                  fontSize: 15,
                  color: AppColors.colorPrimary500,
                  decoration: TextDecoration.underline,
                ),
                recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (final BuildContext context) =>
                            SignUpScreen(),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(top: 20);
  }
}

