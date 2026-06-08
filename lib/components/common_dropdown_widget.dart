import 'package:flutter/material.dart';

import 'package:santvani_app/utils/utils.dart';

import 'package:santvani_app/components/common_rich_text_widget.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

class CommonDropdownWidget extends StatelessWidget {
  final List<dynamic> listData;

  final String title;

  final String? placeholder;

  final dynamic selectedVal;

  final double? height;

  final Function(dynamic) onValueChanged;

  const CommonDropdownWidget({
    super.key,

    required this.listData,

    required this.title,

    this.placeholder = '',

    required this.selectedVal,

    required this.height,

    required this.onValueChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        CommonRichTextWidget(
          strHeaderTitle: title,
        ),

        10.h,

        Container(
          decoration: Utils.borderBox(
            borderColor:
            AppColors.baseColorWhite85,

            radius: 12.0,
          ),

          height: height ?? 56,

          child: ButtonTheme(
            alignedDropdown: true,

            child:
            DropdownButtonFormField<
                Object
            >(
              borderRadius:
              BorderRadius.circular(
                12,
              ),

              decoration: InputDecoration(
                filled: true,

                fillColor:
                AppColors.white,

                border:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),

                  borderSide:
                  BorderSide
                      .none,
                ),

                enabledBorder:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),

                  borderSide: BorderSide(
                    color:
                    AppColors
                        .baseColorWhite85,
                  ),
                ),

                focusedBorder:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),

                  borderSide: BorderSide(
                    color:
                    AppColors
                        .colorPrimary500,

                    width: 1.2,
                  ),
                ),

                contentPadding:
                const EdgeInsets.symmetric(
                  horizontal: 14,

                  vertical: 14,
                ),
              ),

              hint:
              (placeholder !=
                  null &&
                  placeholder!
                      .isNotEmpty)
                  ? Text(
                placeholder!,

                style:
                dMSansW400.copyWith(
                  color:
                  AppColors
                      .baseColorWhite45,

                  fontSize:
                  14,
                ),

                maxLines: 1,

                overflow:
                TextOverflow
                    .ellipsis,
              )
                  : const SizedBox(),

              value: selectedVal,

              onChanged:
              onValueChanged,

              onSaved:
                  (
                  final Object?
                  value,
                  ) {
                FocusScope.of(
                  context,
                ).requestFocus(
                  FocusNode(),
                );
              },

              icon: Icon(
                Icons
                    .keyboard_arrow_down_rounded,

                color:
                AppColors
                    .colorNeutral700,

                size: 24,
              ),

              style:
              dMSansW400.copyWith(
                color:
                AppColors
                    .black,

                fontSize: 14,
              ),

              items:
              listData.map((
                  final dynamic
                  valueItem,
                  ) {
                return DropdownMenuItem<
                    Object
                >(
                  value:
                  valueItem['id'],

                  child: Text(
                    valueItem['value']
                        .toString(),

                    style:
                    dMSansW400,

                    maxLines: 1,

                    overflow:
                    TextOverflow
                        .ellipsis,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
