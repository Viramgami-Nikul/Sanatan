import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:intl_phone_field/phone_number.dart';

import 'package:santvani_app/utils/app_strings.dart';

import 'package:santvani_app/utils/utils.dart';

import 'package:santvani_app/components/common_rich_text_widget.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';

import 'package:santvani_app/helper/extension/string_ext.dart';

import 'package:santvani_app/helper/extension/widget_ext.dart';

import 'package:santvani_app/helper/validator.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/app_enums.dart';

class AppTextField extends StatelessWidget with Validator {
  final TextFieldTypes type;

  final String title;

  final TextEditingController? textEditingController;

  final String? initialValue;

  final String? strPrefixText;

  final List<TextInputFormatter>? inputFormatters;

  final String? hintText;

  final bool? showHeaderTitle;

  final String? strHeaderTitle;

  final Function(String?)? validator;

  final TextInputAction textInputAction;

  final FocusNode? nextFocusNode;

  final FocusNode? focusNode;

  final ValueChanged<String>? onChange;

  final bool isRequired;

  final Widget? suffixWidget;

  const AppTextField({
    super.key,

    required this.type,

    required this.title,

    this.textEditingController,

    this.strPrefixText = '',

    this.inputFormatters =
    const <TextInputFormatter>[],

    this.hintText,

    this.showHeaderTitle = true,

    this.strHeaderTitle = '',

    this.validator,

    required this.textInputAction,

    this.nextFocusNode,

    this.focusNode,

    this.initialValue,

    this.onChange,

    this.isRequired = true,

    this.suffixWidget,
  });

  @override
  Widget build(
      final BuildContext buildContext,
      ) {
    final ValueNotifier<bool> isShow =
    ValueNotifier<bool>(false);

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: <Widget>[
        if (showHeaderTitle ?? true) ...<
            Widget
        >[
          CommonRichTextWidget(
            strHeaderTitle:
            strHeaderTitle ?? '',

            isRequired: isRequired,
          ),

          10.h,
        ],

        ValueListenableBuilder<bool>(
          valueListenable: isShow,

          builder: (
              final BuildContext context,
              final bool value,
              final Widget? child,
              ) {
            return TextFormField(
              initialValue:
              initialValue ?? '',

              focusNode: focusNode,

              controller:
              textEditingController,

              style: dMSansW400.copyWith(
                fontSize: 15,

                color: AppColors.black,
              ),

              obscureText:
              type ==
                  TextFieldTypes
                      .password &&
                  !isShow.value,

              autovalidateMode:
              AutovalidateMode
                  .onUserInteraction,

              maxLines:
              type ==
                  TextFieldTypes
                      .multiline
                  ? 5
                  : 1,

              minLines:
              type ==
                  TextFieldTypes
                      .multiline
                  ? 5
                  : 1,

              inputFormatters:
              inputFormatters,

              textInputAction:
              textInputAction,

              keyboardType:
              (type ==
                  TextFieldTypes
                      .number
                  ? TextInputType.number
                  : (type ==
                  TextFieldTypes
                      .email
                  ? TextInputType
                  .emailAddress
                  : TextInputType
                  .text)),

              buildCounter: (
                  final BuildContext context, {
                    final int? currentLength,
                    final bool? isFocused,
                    final int? maxLength,
                  }) {
                return null;
              },

              onChanged: onChange,

              onTapOutside: (
                  final PointerDownEvent v,
                  ) {
                FocusScope.of(
                  buildContext,
                ).unfocus();
              },

              onFieldSubmitted: (
                  final String value,
                  ) {
                if (nextFocusNode != null) {
                  FocusScope.of(
                    context,
                  ).requestFocus(
                    nextFocusNode,
                  );
                }
              },

              validator: (
                  final String? value,
                  ) {
                if (validator != null) {
                  return validator?.call(
                    value,
                  );
                }

                return _validateTextField(
                  type,
                  value,
                  title,
                  context,
                  null,
                );
              },

              decoration: InputDecoration(
                filled: true,

                fillColor: AppColors.white,

                errorStyle: TextStyle(
                  color:
                  AppColors
                      .colorError500,

                  fontSize: 12,
                ),

                hintText:
                hintText ??
                    AppStrings.enterTxt.tr(
                      buildContext,

                      namedArgs: <
                          String,
                          String
                      >{
                        'field_name':
                        title
                            .tr(
                          buildContext,
                        )
                            .toLowerCase(),
                      },
                    ),

                hintStyle:
                dMSansW400.copyWith(
                  color:
                  AppColors
                      .baseColorWhite45,

                  fontSize: 14,
                ),

                prefixIcon:
                strPrefixText != ''
                    ? Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .center,

                  children: <
                      Widget
                  >[
                    Text(
                      strPrefixText ??
                          '',

                      style:
                      dMSansW400.copyWith(
                        fontSize:
                        15,
                      ),
                    ).paddingSymmetric(
                      horizontal:
                      10,
                    ),
                  ],
                )
                    : 12.w,

                prefixIconConstraints:
                strPrefixText != ''
                    ? const BoxConstraints(
                  minWidth: 40,
                )
                    : const BoxConstraints(
                  minWidth: 12,
                ),

                suffixIcon:
                type ==
                    TextFieldTypes
                        .password
                    ? GestureDetector(
                  onTap: () {
                    isShow.value =
                    !isShow
                        .value;
                  },

                  child: Icon(
                    isShow.value
                        ? Icons
                        .visibility_outlined
                        : Icons
                        .visibility_off_outlined,

                    color:
                    AppColors
                        .baseColorWhite45,
                  ).paddingAll(
                    12,
                  ),
                )
                    : suffixWidget,

                focusedBorder:
                Utils.inputBorder(
                  AppColors
                      .colorPrimary500,
                ),

                focusedErrorBorder:
                Utils.inputBorder(
                  AppColors
                      .colorError500,
                ),

                errorBorder:
                Utils.inputBorder(
                  AppColors
                      .colorError500,
                ),

                enabledBorder:
                Utils.inputBorder(
                  AppColors
                      .baseColorWhite85,
                ),

                border:
                Utils.inputBorder(
                  AppColors
                      .baseColorWhite85,
                ),

                contentPadding:
                const EdgeInsets.symmetric(
                  horizontal: 16,

                  vertical: 16,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String? _validateTextField(
      final TextFieldTypes type,
      final String? strValue,
      final String title,
      final BuildContext context,
      final PhoneNumber? phoneNumber,
      ) {
    switch (type) {
      case TextFieldTypes.email:
        return validateEmail(
          strValue!,
        )?.tr(context);

      case TextFieldTypes.password:
        return validatePassword(
          strValue!,
        )?.tr(context);

      case TextFieldTypes.number:
        break;

      default:
        if (!strValue
            .isNotNullAndEmpty()) {
          return ('$title is Required')
              .tr(context);
        }
    }

    return null;
  }
}
