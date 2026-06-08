import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';

import 'package:santvani_app/components/common_button_widget.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';

import 'package:santvani_app/helper/extension/navigator_ext.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/utils.dart';

class ImagePickerOptionBottomSheet
    extends StatelessWidget {
  const ImagePickerOptionBottomSheet({
    super.key,

    required this.onTapCamera,

    required this.onTapGallery,
  });

  final VoidCallback
  onTapCamera;

  final VoidCallback
  onTapGallery;

  @override
  Widget build(
      final BuildContext context,
      ) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3,
        sigmaY: 3,
      ),

      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.end,

        mainAxisSize:
        MainAxisSize.min,

        children: <Widget>[
          const BottomSheetDragLine(),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            decoration:
            const BoxDecoration(
              color:
              AppColors.white,

              borderRadius:
              BorderRadius.only(
                topLeft:
                Radius.circular(
                  20,
                ),

                topRight:
                Radius.circular(
                  20,
                ),
              ),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: <Widget>[
                20.h,

                Align(
                  alignment:
                  Alignment.center,

                  child: Text(
                    'Choose Profile Photo Option'
                        .tr(context),

                    style:
                    dMSansW700
                        .copyWith(
                      fontSize:
                      18,
                    ),
                  ),
                ),

                30.h,

                AppButton(
                  width:
                  double.maxFinite,

                  type:
                  AppButtonType
                      .primary,

                  isLoading:
                  false,

                  icon: null,

                  onPressed: () {
                    context.pop();

                    onTapCamera.call();
                  },

                  title:
                  'Open Camera'
                      .tr(context),

                  titleColor:
                  AppColors.white,
                ),

                20.h,

                AppButton(
                  width:
                  double.maxFinite,

                  type:
                  AppButtonType
                      .thirdB,

                  isLoading:
                  false,

                  icon: null,

                  onPressed: () {
                    context.pop();

                    onTapGallery.call();
                  },

                  title:
                  'Choose From Gallery'
                      .tr(context),
                ),

                30.h,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
