import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/auth/signup/signup_bloc.dart';
import 'package:santvani_app/components/common_dropdown_widget.dart';
import 'package:santvani_app/components/common_phone_field_widget.dart';
import 'package:santvani_app/components/common_rich_text_widget.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/views/auth/signup/widget/date_picker_widget.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (
          final BuildContext context,
          final SignUpState state,
          ) {
        final SignUpBloc bloc =
        context.read<SignUpBloc>();

        return Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: <Widget>[
            AppTextField(
              key: const Key(
                'signup_first_name_field',
              ),
              type: TextFieldTypes.text,
              title: AppStrings.firstName,
              initialValue: state.firstName,
              strHeaderTitle:
              AppStrings.firstName.tr(
                buildContext,
              ),
              textInputAction:
              TextInputAction.next,
              focusNode: bloc.fNameFocus,
              nextFocusNode: bloc.lNameFocus,
              onChange: (
                  final String value,
                  ) {
                bloc.add(
                  OnChangeFirstName(
                    fName: value,
                  ),
                );
              },
            ),

            20.h,

            AppTextField(
              key: const Key(
                'signup_last_name_field',
              ),
              type: TextFieldTypes.text,
              title: AppStrings.lastName,
              initialValue: state.lastName,
              strHeaderTitle:
              AppStrings.lastName.tr(
                buildContext,
              ),
              textInputAction:
              TextInputAction.next,
              focusNode: bloc.lNameFocus,
              nextFocusNode: bloc.emailFocus,
              onChange: (
                  final String value,
                  ) {
                bloc.add(
                  OnChangeLastName(
                    lName: value,
                  ),
                );
              },
            ),

            20.h,

            AppTextField(
              key: const Key(
                'signup_email_field',
              ),
              type: TextFieldTypes.email,
              title: AppStrings.email,
              initialValue: state.email,
              strHeaderTitle:
              AppStrings.emailAddress.tr(
                buildContext,
              ),
              textInputAction:
              TextInputAction.next,
              focusNode: bloc.emailFocus,
              nextFocusNode:
              bloc.mobileFocus,
              onChange: (
                  final String value,
                  ) {
                bloc.add(
                  OnChangeEmail(
                    email: value,
                  ),
                );
              },
            ),

            20.h,

            CommonPhoneFieldWidget(
              key: const Key(
                'signup_mobile_field',
              ),
              focusNode: bloc.mobileFocus,
              strHeaderTitle:
              AppStrings.mobileNumber,
              initialValue:
              state.mobileNumber,
              countryCode:
              state.countryISOCode,
              textInputAction:
              TextInputAction.done,
              onChange: (
                  final PhoneNumber number,
                  ) {
                debugPrint(
                  number.completeNumber,
                );

                bloc.add(
                  OnChangeMobileNumber(
                    mobileNumber:
                    number.number,
                  ),
                );
              },
              onCountryChanged: (
                  final Country country,
                  ) {
                bloc.add(
                  OnChangeCountry(
                    selectedCountry:
                    country,
                  ),
                );
              },
            ),

            20.h,

            CommonRichTextWidget(
              strHeaderTitle:
              'Date of Birth',
            ),

            10.h,

            DatePickerWidget(
              selectedDate:
              state.birthDate,
              onPressed: (
                  final DateTime value,
                  ) {
                bloc.add(
                  OnSelectBirthDate(
                    birthDate:
                    Utils.formatDate(
                      value,
                      'dd/MM/yyyy',
                    ),
                  ),
                );
              },
            ),

            20.h,

            CommonDropdownWidget(
              placeholder:
              'Please Select Gender'
                  .tr(context),
              listData:
              state.genderList,
              title:
              'Gender'.tr(context),
              selectedVal:
              state.genderId,
              height: 55,
              onValueChanged: (
                  final dynamic value,
                  ) {
                bloc.add(
                  OnSelectGender(
                    genderId: value,
                  ),
                );
              },
            ),

            20.h,

            CommonDropdownWidget(
              placeholder:
              'Please Select Country'
                  .tr(context),
              listData:
              state.countryList,
              title:
              'Country'.tr(context),
              selectedVal:
              state.countryId,
              height: 55,
              onValueChanged: (
                  final dynamic value,
                  ) {
                bloc.add(
                  OnSelectCountry(
                    countryId: value,
                  ),
                );
              },
            ),

            20.h,

            AppTextField(
              key: const Key(
                'address_field',
              ),
              type: TextFieldTypes.multiline,
              title: AppStrings.address,
              initialValue:
              state.address,
              strHeaderTitle:
              AppStrings.address.tr(
                buildContext,
              ),
              textInputAction:
              TextInputAction.done,
              focusNode:
              bloc.addressFocus,
              onChange: (
                  final String value,
                  ) {
                bloc.add(
                  OnChangeAddress(
                    address: value,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
