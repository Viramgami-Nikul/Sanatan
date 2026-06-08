import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santvani_app/components/common_button_widget.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:santvani_app/components/common_text_field_widget.dart';
import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/data/repository/auth_repo_impl.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkStatusBarTransparent,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),

        body: BlocProvider<ForgotPasswordBloc>(
          create: (final BuildContext context) => ForgotPasswordBloc(authRepo: AuthRepoImp()),
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (final BuildContext context, final ForgotPasswordState state) {
              if (state.status == CommonScreenState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Password reset link sent successfully!'),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                  ),
                );
                Navigator.pop(context);
              }
            },
            builder: (final BuildContext context, final ForgotPasswordState state) {
              final ForgotPasswordBloc bloc = context.read<ForgotPasswordBloc>();
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: bloc.forgotPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// BACK BUTTON
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.black.withValues(
                                    alpha: 0.05,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.black,
                              size: 20,
                            ),
                          ),
                        ),

                        40.h,

                        /// HEADER
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: AppColors.colorPrimary500
                                      .withValues(alpha: 0.10),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(
                                  Icons.lock_reset_rounded,
                                  size: 45,
                                  color: AppColors.colorPrimary500,
                                ),
                              ),
                              30.h,
                              Text(
                                'Forgot Password'.tr(context),
                                textAlign: TextAlign.center,
                                style: dMSansW700.copyWith(
                                  fontSize: 28,
                                  color: AppColors.black,
                                ),
                              ),
                              10.h,
                              Text(
                                'Please enter your registered email address to receive a password reset link.'
                                    .tr(context),
                                textAlign: TextAlign.center,
                                style: dMSansW400.copyWith(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: AppColors.baseColorWhite45,
                                ),
                              ),
                            ],
                          ),
                        ),

                        45.h,

                        /// FORM CARD
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: AppColors.black.withValues(
                                  alpha: 0.05,
                                ),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Email Address'.tr(context),
                                style: dMSansW600.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              12.h,
                              AppTextField(
                                key: const Key('forgot_password_email_field'),
                                type: TextFieldTypes.email,
                                title: AppStrings.email,
                                initialValue: state.email,
                                strHeaderTitle: '',
                                textInputAction: TextInputAction.done,
                                onChange: (final String value) {
                                  bloc.add(OnChangeEmail(email: value));
                                },
                              ),
                              35.h,
                              AppButton(
                                key: const Key('forgot_password_submit_btn'),
                                title: 'Send Reset Link'.tr(context),
                                width: double.maxFinite,
                                height: 55,
                                isLoading: state.status == CommonScreenState.loading,
                                icon: null,
                                onPressed: () {
                                  if (bloc.forgotPasswordFormKey.currentState?.validate() == true) {
                                    bloc.add(OnTapSubmit());
                                  }
                                },
                                type: AppButtonType.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
