import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder:
          (
          final BuildContext context,
          final ForgotPasswordState state,
          ) {
        final ForgotPasswordBloc bloc =
        context.read<ForgotPasswordBloc>();

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Form(
            key: bloc.forgotPasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// TITLE
                Text(
                  'Forgot Password'.tr(context),
                  style: dMSansW700.copyWith(
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                ),

                8.h,

                Text(
                  'Enter your registered email address to receive password reset instructions.'
                      .tr(context),
                  style: dMSansW400.copyWith(
                    fontSize: 14,
                    color: AppColors.baseColorWhite45,
                  ),
                ),

                30.h,

                /// EMAIL FIELD
                AppTextField(
                  key: const Key('forgot_password_email_field'),
                  type: TextFieldTypes.email,
                  title: AppStrings.email,
                  initialValue: state.email,
                  strHeaderTitle:
                  '${AppStrings.email.tr(buildContext)}',
                  textInputAction: TextInputAction.done,
                  onChange: (final String value) {
                    bloc.add(
                      OnChangeEmail(email: value),
                    );
                  },
                ),

                35.h,

                /// SUBMIT BUTTON
                AppButton(
                  key: const Key('forgot_password_submit_button'),
                  title: AppStrings.submit.tr(buildContext),
                  width: double.maxFinite,
                  height: 55,
                  isLoading:
                  state.status == CommonScreenState.loading,
                  icon: null,
                  onPressed: () {
                    if (bloc.forgotPasswordFormKey.currentState
                        ?.validate() ==
                        true) {
                      bloc.add(
                        OnTapSubmit(),
                      );
                    }
                  },
                  type: AppButtonType.primary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
