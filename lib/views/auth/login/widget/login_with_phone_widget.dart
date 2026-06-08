import 'package:flutter/material.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/Routes/routes_name.dart';
import 'package:santvani_app/bloc/auth/login/login_bloc.dart';
import 'package:santvani_app/bloc/auth/otp/otp_bloc.dart';
import 'package:santvani_app/components/common_snack_bar.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/helper/extension/navigator_ext.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWithPhoneWidget extends StatelessWidget {
  const LoginWithPhoneWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<OtpBloc>(
      create: (final BuildContext context) => OtpBloc(
        authRepo: context.read<AuthRepo>(),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (final BuildContext context, final LoginState loginState) {
          final LoginBloc loginBloc = context.read<LoginBloc>();

          return BlocConsumer<OtpBloc, OtpState>(
            listener: (final BuildContext context, final OtpState state) {
              if (state.status == CommonScreenState.success &&
                  state.isOtpSent &&
                  state.user == null) {
                showSuccessSnackBar('OTP sent successfully'.tr(context));
              }

              if (state.status == CommonScreenState.success &&
                  state.user != null) {
                loginBloc.navigateToDashboard(context);
              }

              if (state.status == CommonScreenState.error) {
                showErrorSnackBar(
                  state.errorMessage ?? 'OTP login failed'.tr(context),
                );
              }
            },
            builder: (final BuildContext context, final OtpState state) {
              final OtpBloc otpBloc = context.read<OtpBloc>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Quick Login'.tr(context),
                    style: dMSansW700.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),

                  10.h,

                  Text(
                    'Login securely using your phone number or email address.'
                        .tr(context),
                    style: dMSansW400.copyWith(
                      fontSize: 14,
                      color: AppColors.baseColorWhite45,
                      height: 1.5,
                    ),
                  ),

                  28.h,

                  AppTextField(
                    key: const Key('otp_email_field'),
                    initialValue: state.emailOrPhone,
                    type: TextFieldTypes.text,
                    title: '${AppStrings.email} / Phone',
                    strHeaderTitle:
                    'Phone Number or Email'.tr(buildContext),
                    textInputAction: TextInputAction.done,
                    onChange: (final String value) {
                      otpBloc.add(
                        OnChangeEmailOrPhone(
                          emailOrPhone: value,
                        ),
                      );
                    },
                  ),

                  if (state.isOtpSent) ...<Widget>[
                    22.h,
                    AppTextField(
                      key: const Key('otp_code_field'),
                      initialValue: state.otp,
                      type: TextFieldTypes.number,
                      title: 'OTP',
                      strHeaderTitle: 'OTP'.tr(buildContext),
                      textInputAction: TextInputAction.done,
                      onChange: (final String value) {
                        otpBloc.add(
                          OnChangeOtp(
                            otp: value,
                          ),
                        );
                      },
                    ),
                  ],

                  35.h,

                  AppButton(
                    key: const Key('send_otp_button'),
                    title: state.isOtpSent
                        ? 'Verify OTP'.tr(buildContext)
                        : 'Send OTP'.tr(buildContext),
                    width: double.maxFinite,
                    isLoading:
                    state.status == CommonScreenState.loading,
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () {
                      if (loginBloc.loginFormKey.currentState
                          ?.validate() ==
                          true) {
                        if (state.isOtpSent) {
                          otpBloc.add(
                            VerifyOtpEvent(context: context),
                          );
                        } else {
                          otpBloc.add(
                            SendOtpEvent(context: context),
                          );
                        }
                      }
                    },
                    type: AppButtonType.primary,
                    bgColor: AppColors.colorPrimary500,
                    titleColor: AppColors.white,
                  ),

                  24.h,

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        loginBloc.add(LoginEvent.loginWithBiometric(context: context));
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
                              size: 26,
                            ),

                            10.w,

                            Text(
                              'Use Fingerprint'.tr(context),
                              style: dMSansW500.copyWith(
                                fontSize: 14,
                                color: AppColors.colorNeutral700,
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
        },
      ),
    );
  }
}
