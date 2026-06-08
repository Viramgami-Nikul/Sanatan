import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:santvani_app/app/my_app.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/app_enums.dart';

void showSnackBar(
    final String message,
    final BuildContext context,
    final SnackBarType snackBarType,
    ) {
  switch (snackBarType) {
    case SnackBarType.success:
      showSuccessSnackBar(message);
      break;

    case SnackBarType.error:
      showErrorSnackBar(message);
      break;

    case SnackBarType.info:
      showInfoSnackBar(message);
      break;

    case SnackBarType.warning:
      showInfoSnackBar(message);
      break;
  }
}

void showSuccessSnackBar(final String message) {
  showTopSnackBar(
    navigatorKey.currentState!.overlay!,

    CustomSnackBar.success(
      message: message,

      textAlign: TextAlign.start,

      textStyle: dMSansW600.copyWith(
        color: Colors.white,

        fontSize: 14,
      ),

      backgroundColor: AppColors.colorSuccess500,
    ),
  );
}

void showErrorSnackBar(final String message) {
  debugPrint('Error: $message');

  showTopSnackBar(
    navigatorKey.currentState!.overlay!,

    CustomSnackBar.error(
      message: message,

      textAlign: TextAlign.start,

      textStyle: dMSansW600.copyWith(
        color: Colors.white,

        fontSize: 14,
      ),

      backgroundColor: AppColors.colorError500,
    ),
  );
}

void showInfoSnackBar(final String message) {
  showTopSnackBar(
    navigatorKey.currentState!.overlay!,

    CustomSnackBar.info(
      message: message,

      textAlign: TextAlign.start,

      textStyle: dMSansW600.copyWith(
        color: Colors.white,

        fontSize: 14,
      ),

      backgroundColor: AppColors.colorPrimary500,
    ),
  );
}
