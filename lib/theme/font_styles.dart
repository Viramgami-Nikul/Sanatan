import 'package:flutter/material.dart';
import 'package:santvani_app/gen/fonts.gen.dart';
import 'package:santvani_app/theme/app_colors.dart';

// ===================== DM Sans ===================== //

TextStyle dMSansW400 = TextStyle(
  fontFamily: FontFamily.dMSans,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle dMSansW500 = TextStyle(
  fontFamily: FontFamily.dMSans,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle dMSansW600 = TextStyle(
  fontFamily: FontFamily.dMSans,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle dMSansW700 = TextStyle(
  fontFamily: FontFamily.dMSans,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: AppColors.black,
);

// ===================== Inter ===================== //

TextStyle interW400 = TextStyle(
  fontFamily: FontFamily.inter,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle interW500 = TextStyle(
  fontFamily: FontFamily.inter,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle interW600 = TextStyle(
  fontFamily: FontFamily.inter,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: AppColors.black,
);

TextStyle interW700 = TextStyle(
  fontFamily: FontFamily.inter,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: AppColors.black,
);

// ===================== Extra Common Styles ===================== //

TextStyle hintTextStyle = dMSansW400.copyWith(
  color: AppColors.baseColorWhite45,
  fontSize: 14,
);

TextStyle errorTextStyle = dMSansW400.copyWith(
  color: AppColors.colorError500,
  fontSize: 13,
);

TextStyle buttonTextStyle = dMSansW600.copyWith(
  color: AppColors.white,
  fontSize: 16,
);

TextStyle appBarTitleStyle = dMSansW700.copyWith(
  color: AppColors.black,
  fontSize: 20,
);

TextStyle screenTitleStyle = dMSansW700.copyWith(
  color: AppColors.black,
  fontSize: 24,
);

TextStyle subtitleStyle = dMSansW400.copyWith(
  color: AppColors.colorNeutral700,
  fontSize: 15,
);

TextStyle smallTextStyle = dMSansW400.copyWith(
  color: AppColors.colorNeutral700,
  fontSize: 12,
);
