import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';
import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({
    super.key,
    required this.onTapChangeLanguage,
  });

  final void Function(dynamic) onTapChangeLanguage;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<LocalisationBloc, LocalisationState>(
      builder: (final BuildContext context, final LocalisationState state) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                /// DRAG LINE
                const BottomSheetDragLine(),

                /// MAIN CONTAINER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// TITLE
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Select Language'.tr(context),
                              style: dMSansW700.copyWith(
                                color: AppColors.colorPrimary500,
                                fontSize: 24,
                              ),
                            ),

                            6.h,

                            Text(
                              'Choose your preferred language'.tr(context),
                              textAlign: TextAlign.center,
                              style: dMSansW400.copyWith(
                                color: AppColors.baseColorWhite45,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      28.h,

                      /// LANGUAGE LIST
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: SupportedLangCode.values.length,
                        separatorBuilder:
                            (final BuildContext context, final int index) =>
                        14.h,
                        itemBuilder: (
                            final BuildContext context,
                            final int index,
                            ) {
                          final SupportedLangCode item =
                          SupportedLangCode.values[index];

                          final bool isSelected =
                              state.language.languageCode == item.langCode;

                          return GestureDetector(
                            onTap: () {
                              onTapChangeLanguage(item);
                              context.pop();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                gradient:
                                isSelected
                                    ? LinearGradient(
                                  colors: <Color>[
                                    AppColors.colorA478D1,
                                    AppColors.color4478D1,
                                  ],
                                )
                                    : null,
                                color:
                                isSelected
                                    ? null
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color:
                                  isSelected
                                      ? Colors.transparent
                                      : AppColors.baseColorWhite85
                                      .withValues(alpha: 0.5),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color:
                                    isSelected
                                        ? AppColors.color4478D1
                                        .withValues(alpha: 0.25)
                                        : AppColors.black.withValues(
                                      alpha: 0.04,
                                    ),
                                    blurRadius: 12,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  /// FLAG
                                  Container(
                                    height: 48,
                                    width: 48,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: isSelected ? 0.2 : 1,
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Text(
                                      item.flag,
                                      style: dMSansW700.copyWith(
                                        fontSize: 13,
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.colorPrimary500,
                                      ),
                                    ),
                                  ),

                                  16.w,

                                  /// LANGUAGE NAME
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item.name.tr(context),
                                          style: dMSansW700.copyWith(
                                            fontSize: 16,
                                            color:
                                            isSelected
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),

                                        4.h,

                                        Text(
                                          item.langCode.toUpperCase(),
                                          style: dMSansW400.copyWith(
                                            fontSize: 12,
                                            color:
                                            isSelected
                                                ? AppColors.white
                                                .withValues(alpha: 0.8)
                                                : AppColors
                                                .baseColorWhite45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// CHECK ICON
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                      isSelected
                                          ? AppColors.white
                                          : Colors.transparent,
                                      border: Border.all(
                                        color:
                                        isSelected
                                            ? AppColors.white
                                            : AppColors.baseColorWhite45,
                                      ),
                                    ),
                                    child:
                                    isSelected
                                        ? Icon(
                                      Icons.check,
                                      size: 16,
                                      color:
                                      AppColors.colorPrimary500,
                                    )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height:
                  context.bottomPadding > 0
                      ? context.bottomPadding
                      : 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
