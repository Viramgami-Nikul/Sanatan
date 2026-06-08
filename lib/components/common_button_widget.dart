import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/utils.dart';

class AppButton
    extends StatelessWidget {
  final String title;

  final double width;

  final AppButtonType type;

  final VoidCallback?
  onPressed;

  final Widget? icon;

  final bool isLoading;

  final Color?
  loadingIndicatorColor;

  final Color? bgColor;

  final Color? titleColor;

  final double? height;

  final Color? borderColor;

  final TextStyle? titleStyle;

  const AppButton({
    super.key,

    required this.title,

    required this.onPressed,

    required this.width,

    required this.type,

    required this.icon,

    required this.isLoading,

    this.loadingIndicatorColor,

    this.bgColor,

    this.titleColor,

    this.height,

    this.borderColor,

    this.titleStyle,
  });

  @override
  Widget build(
      final BuildContext context,
      ) {
    return SizedBox(
      width: width,

      height: height ?? 52,

      child: ElevatedButton(
        style: ButtonStyle(
          elevation:
          WidgetStateProperty.all(
            0,
          ),

          padding:
          WidgetStateProperty.all<
              EdgeInsetsGeometry
          >(
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),

          foregroundColor:
          WidgetStateProperty.all<
              Color
          >(
            type ==
                AppButtonType
                    .primary
                ? AppColors
                .colorPrimary500
                : type ==
                AppButtonType
                    .secondary
                ? AppColors
                .colorError500
                : AppColors.white,
          ),

          backgroundColor:
          WidgetStateProperty.all<
              Color
          >(
            type ==
                AppButtonType
                    .primary
                ? bgColor ??
                AppColors
                    .colorPrimary500
                : type ==
                AppButtonType
                    .secondary
                ? AppColors
                .colorPrimary500
                : AppColors.white,
          ),

          shape:
          WidgetStateProperty.all<
              RoundedRectangleBorder
          >(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                12,
              ),

              side: BorderSide(
                color:
                type ==
                    AppButtonType
                        .thirdB
                    ? borderColor ?? AppColors
                    .colorPrimary500
                    : Colors
                    .transparent,
              ),
            ),
          ),
        ),

        onPressed:
        isLoading
            ? null
            : onPressed,

        child:
        isLoading
            ? Platform.isIOS
            ? CupertinoActivityIndicator(
          color:
          loadingIndicatorColor ??
              AppColors.white,
        )
            : CircularProgressIndicator(
          strokeWidth: 2.5,

          color:
          loadingIndicatorColor ??
              AppColors.white,
        )
            : Row(
          mainAxisAlignment:
          MainAxisAlignment
              .center,

          children: <Widget>[
            icon ?? 0.w,

            SizedBox(
              width:
              icon != null &&
                  title
                      .isNotEmpty
                  ? 10
                  : 0,
            ),

            Flexible(
              child: Text(
                title,

                textAlign:
                TextAlign
                    .center,

                overflow:
                TextOverflow
                    .ellipsis,

                style:
                titleStyle ?? dMSansW400
                    .copyWith(
                  fontSize:
                  16,

                  color:
                  type ==
                      AppButtonType
                          .primary ||
                      type ==
                          AppButtonType
                              .secondary
                      ? titleColor ??
                      AppColors
                          .white
                      : titleColor ??
                      AppColors
                          .colorPrimary500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
