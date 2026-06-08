import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/Routes/routes_name.dart';
import 'package:santvani_app/bloc/auth/login/login_bloc.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';

class LoginWithEmailWidget extends StatelessWidget {
  const LoginWithEmailWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (final BuildContext context, final LoginState state) {
        final LoginBloc bloc = context.read<LoginBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppTextField(
              key: const Key('login_email_field'),
              initialValue: state.email,
              type: TextFieldTypes.email,
              title: AppStrings.email,
              strHeaderTitle: AppStrings.email.tr(buildContext),
              textInputAction: TextInputAction.next,
              onChange: (final String value) {
                bloc.add(OnChangeEmail(email: value));
              },
            ),

            22.h,

            AppTextField(
              key: const Key('login_password_field'),
              initialValue: state.password,
              type: TextFieldTypes.password,
              title: AppStrings.password,
              strHeaderTitle: AppStrings.password.tr(buildContext),
              textInputAction: TextInputAction.done,
              onChange: (final String value) {
                bloc.add(OnChangePassword(password: value));
              },
            ),

            14.h,

            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      bloc.add(
                        OnChangeRememberMe(
                          isRememberMe: !state.isRememberMe,
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color:
                            state.isRememberMe
                                ? AppColors.colorPrimary500
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.colorPrimary500,
                            ),
                          ),
                          child:
                          state.isRememberMe
                              ? Icon(
                            Icons.check,
                            size: 16,
                            color: AppColors.white,
                          )
                              : null,
                        ),

                        10.w,

                        Text(
                          'Remember Me'.tr(context),
                          style: dMSansW400.copyWith(
                            fontSize: 14,
                            color: AppColors.baseColorWhite45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    bloc.add(
                      LoginEvent.onTapForgotPassword(context: context),
                    );
                  },
                  child: Text(
                    'Forgot Password?'.tr(context),
                    style: dMSansW600.copyWith(
                      color: AppColors.colorPrimary500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            35.h,

            AppButton(
              key: const Key('login_button'),
              title: AppStrings.login.tr(buildContext),
              width: double.maxFinite,
              isLoading: state.status == CommonScreenState.loading,
              icon: null,
              type: AppButtonType.primary,
              bgColor: AppColors.colorPrimary500,
              titleColor: AppColors.white,
              onPressed: () {
                if (bloc.loginFormKey.currentState?.validate() == true) {
                  bloc.add(const LoginEvent.onSubmit());
                }
              },
            ),

            24.h,

            Center(
              child: GestureDetector(
                onTap: () {
                  bloc.add(LoginEvent.onTapLoginWithOtpStateEvent());
                },
                child: Text(
                  'Login with OTP'.tr(context),
                  style: dMSansW500.copyWith(
                    color: AppColors.colorPrimary500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            20.h,

            Center(
              child: GestureDetector(
                onTap: () {
                  bloc.add(LoginEvent.loginWithBiometric(context: context));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.baseColorWhite85,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.fingerprint_rounded,
                        color: AppColors.colorPrimary500,
                        size: 24,
                      ),

                      10.w,

                      Text(
                        'Use Fingerprint'.tr(context),
                        style: dMSansW500.copyWith(
                          color: AppColors.colorNeutral700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
