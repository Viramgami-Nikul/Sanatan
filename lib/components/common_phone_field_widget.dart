import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';

import 'package:santvani_app/components/common_rich_text_widget.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';

import 'package:santvani_app/helper/regex_helper.dart';

import 'package:santvani_app/helper/validator.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/app_strings.dart';

import 'package:santvani_app/utils/utils.dart';

class CommonPhoneFieldWidget extends StatelessWidget with Validator {
  CommonPhoneFieldWidget({
    super.key,
    this.textEditController,
    this.countryCode,
    this.onCountryChanged,
    this.showHeaderTitle,
    this.strHeaderTitle,
    required this.textInputAction,
    this.nextFocusNode,
    this.focusNode,
    this.initialValue,
    this.onChange,
  });

  final TextEditingController? textEditController;

  final String? countryCode;

  final bool? showHeaderTitle;

  final String? strHeaderTitle;

  final TextInputAction textInputAction;

  final FocusNode? nextFocusNode;

  final FocusNode? focusNode;

  final String? initialValue;

  final ValueChanged<PhoneNumber>? onChange;

  final ValueChanged<Country>? onCountryChanged;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        if (showHeaderTitle ?? true) ...<Widget>[
          CommonRichTextWidget(
            strHeaderTitle:
            strHeaderTitle ??
                AppStrings.mobileNumber,
          ),

          10.h,
        ],

        IntlPhoneField(
          focusNode: focusNode,

          controller: textEditController,

          textInputAction: textInputAction,

          languageCode:
          context
              .read<LocalisationBloc>()
              .state
              .language
              .languageCode,

          textAlign: TextAlign.left,

          style: dMSansW400.copyWith(
            fontSize: 15,
            color: AppColors.black,
          ),

          dropdownTextStyle: dMSansW400.copyWith(
            fontSize: 14,
            color: AppColors.black,
          ),

          keyboardType:
          const TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),

          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegexHelper.mobileNumberRegex,
            ),
          ],

          decoration: InputDecoration(
            filled: true,

            fillColor: AppColors.white,

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),

            hintText:
            'Enter your mobile number'.tr(
              context,
            ),

            hintStyle: dMSansW400.copyWith(
              color: AppColors.baseColorWhite85,
              fontSize: 14,
            ),

            focusedBorder: Utils.inputBorder(
              AppColors.colorPrimary500,
            ),

            focusedErrorBorder:
            Utils.inputBorder(
              AppColors.colorError500,
            ),

            errorBorder: Utils.inputBorder(
              AppColors.colorError500,
            ),

            enabledBorder: Utils.inputBorder(
              AppColors.baseColorWhite85,
            ),

            border: Utils.inputBorder(
              AppColors.baseColorWhite85,
            ),
          ),

          flagsButtonPadding:
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),

          dropdownIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.colorNeutral700,
            size: 22,
          ),

          initialValue: initialValue,

          initialCountryCode:
          countryCode ?? 'IN',

          disableLengthCheck: false,

          onSubmitted: (final String value) {
            if (nextFocusNode != null) {
              FocusScope.of(
                context,
              ).requestFocus(nextFocusNode);
            }
          },

          onCountryChanged:
          onCountryChanged,

          invalidNumberMessage:
          AppMessages.invalidMobile.message.tr(
            context,
          ),

          validator: (
              final PhoneNumber? value,
              ) {
            return validateMobileNumber(
              value,
            )?.tr(context);
          },

          onChanged: onChange,
        ),
      ],
    );
  }
}
