import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 1,
        sigmaY: 1,
      ),
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Permission Required'.tr(context),
          textAlign: TextAlign.start,
          style: dMSansW700.copyWith(
            fontSize: 18,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style: dMSansW400.copyWith(
                fontSize: 16,
              ),
            ),

            50.h,

            Row(
              children: <Widget>[
                Expanded(
                  child: AppButton(
                    width: double.maxFinite,
                    type: AppButtonType.primary,
                    isLoading: false,
                    icon: null,
                    title: 'Cancel'.tr(context),
                    titleColor: AppColors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                17.w,

                Expanded(
                  child: AppButton(
                    width: double.maxFinite,
                    type: AppButtonType.thirdB,
                    isLoading: false,
                    icon: null,
                    title: 'Settings'.tr(context),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await openAppSettings();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
