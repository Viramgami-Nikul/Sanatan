import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({
    super.key,
    required this.onTapLogout,
  });

  final VoidCallback onTapLogout;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        color: Colors.black.withValues(alpha: 0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const BottomSheetDragLine(),

            /// MAIN SHEET
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// LOGOUT ICON
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          AppColors.colorError500.withValues(alpha: 0.15),
                          AppColors.colorError500.withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Icon(
                      Icons.logout_rounded,
                      color: AppColors.colorError500,
                      size: 42,
                    ),
                  ),

                  26.h,

                  /// TITLE
                  Text(
                    'Logout'.tr(context),
                    style: dMSansW700.copyWith(
                      fontSize: 26,
                      color: AppColors.black,
                    ),
                  ),

                  12.h,

                  /// DESCRIPTION
                  Text(
                    'Are you sure you want to logout from this account?'
                        .tr(context),
                    textAlign: TextAlign.center,
                    style: dMSansW400.copyWith(
                      fontSize: 15,
                      color: AppColors.baseColorWhite45,
                      height: 1.5,
                    ),
                  ),

                  32.h,

                  /// LOGOUT BUTTON
                  AppButton(
                    title: 'Yes, Logout'.tr(context),
                    onPressed: () {
                      context.pop();
                      onTapLogout.call();
                    },
                    width: double.maxFinite,
                    type: AppButtonType.primary,
                    isLoading: false,
                    icon: null,
                  ),

                  14.h,

                  /// CANCEL BUTTON
                  AppButton(
                    title: 'Cancel'.tr(context),
                    onPressed: () {
                      context.pop();
                    },
                    width: double.maxFinite,
                    type: AppButtonType.thirdB,
                    isLoading: false,
                    icon: null,
                  ),

                  SizedBox(
                    height:
                    MediaQuery.of(context).padding.bottom > 0
                        ? MediaQuery.of(context).padding.bottom
                        : 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
