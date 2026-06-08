import 'package:flutter/material.dart';

import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.colorPrimary500,
        primary: AppColors.colorPrimary500,
        error: AppColors.colorError500,
      ),
      fontFamily: 'DMSans',
      textTheme: TextTheme(
        bodyMedium: dMSansW400,
        titleMedium: dMSansW600,
        titleLarge: dMSansW700,
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.colorNeutral900,
    );
  }
}
