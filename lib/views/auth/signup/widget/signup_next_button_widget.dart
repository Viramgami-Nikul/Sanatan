import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/bloc/auth/signup/signup_bloc.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/components/common_snack_bar.dart';
import 'package:santvani_app/data/models/request_model/signup_request_model.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/routes/routes_name.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';

import '../../../../helper/extension/widget_ext.dart';

/// The "Next" button on the Sign Up screen.
/// Extracted from [SignUpScreen] to keep it under the 200-line limit.
/// All navigation logic is unchanged.
class SignUpNextButtonWidget extends StatelessWidget {
  const SignUpNextButtonWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (final BuildContext ctx, final SignUpState state) {
        final SignUpBloc bloc = ctx.read<SignUpBloc>();

        return AppButton(
          title: AppStrings.next.tr(context),
          width: double.maxFinite,
          isLoading: state.status == CommonScreenState.loading,
          icon: null,
          type: AppButtonType.primary,
          onPressed: () {
            FocusScope.of(ctx).unfocus();

            if (bloc.signUpFormKey.currentState?.validate() != true) {
              return;
            }

            if (state.mobileNumber.isEmpty) {
              showErrorSnackBar(
                AppStrings.pleaseEnterMobileNumber.tr(ctx),
              );
              return;
            }

            if (state.birthDate == null ||
                state.countryId == null ||
                state.genderId == null) {
              showErrorSnackBar(
                AppStrings.pleaseEnterRequiredValue.tr(ctx),
              );
              return;
            }

            if (state.userType == 'Salesman' && state.selectedDistributorId == null) {
              showErrorSnackBar(
                'Please select your distributor'.tr(ctx),
              );
              return;
            }

            ctx.pushNamed(
              RouteName.signUpDetailScreen,
              arguments: SignupRequest(
                contactNo: state.mobileNumber,
                countryCodeISO2: state.countryCode,
                emailId: state.email,
                firstName: state.firstName,
                lastName: state.lastName,
                isdCode: state.countryISOCode,
                gender: state.genderList[state.genderId ?? 0]['value'],
                county: state.countryList[state.countryId ?? 0]['value'],
                address: state.address,
                dateOfBirth: state.birthDate,
                userType: state.userType,
                distributorId: state.selectedDistributorId,
                distributorName: state.selectedDistributorName,
              ),
            );
          },
        ).paddingSymmetric(horizontal: 20);
      },
    );
  }
}
