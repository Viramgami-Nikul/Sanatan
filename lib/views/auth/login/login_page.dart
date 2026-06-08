import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/utils/constants.dart';
import 'package:santvani_app/bloc/auth/login/login_bloc.dart';
import 'package:santvani_app/components/common_snack_bar.dart';
import 'package:santvani_app/data/repository/auth_repo_impl.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/auth/login/widget/login_footer_widget.dart';
import 'package:santvani_app/views/auth/login/widget/login_header_widget.dart';
import 'package:santvani_app/views/auth/login/widget/login_with_email_widget.dart';
import 'package:santvani_app/views/auth/login/widget/login_with_phone_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<LoginBloc>(
      create:
          (final BuildContext context) => LoginBloc(
        authRepo: AuthRepoImp(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (final BuildContext context, final LoginState state) {
          if (state.status == CommonScreenState.success &&
              state.user != null) {
            debugPrint(state.user?.authToken);
            
            final bool? isBiometricEnabled = sharedPreferenceHelper.isBiometricEnabled;
            if (isBiometricEnabled == null) {
              _showBiometricPromptDialog(context);
            } else {
              context.read<LoginBloc>().navigateToDashboard(context);
            }
          }

          if (state.status == CommonScreenState.error) {
            showErrorSnackBar(
              state.errorMessage ?? 'Login failed',
            );
          }
        },
        builder: (final BuildContext context, final LoginState state) {
          final LoginBloc bloc = context.read<LoginBloc>();

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (
                final bool didPop,
                final dynamic result,
                ) {
              if (state.isLoginWithOtp) {
                bloc.add(LoginEvent.onTapLoginWithOtpStateEvent());
              }
            },
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: lightStatusBarTransparent,
              child: Scaffold(
                backgroundColor: const Color(0xFFF5F7FB),

                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        const BiometricTriggerWidget(),

                        /// TOP HEADER
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 40,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF3A8DDD),
                                Color(0xFF1A5FAA),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35),
                            ),
                          ),
                          child: const LoginHeaderWidget(),
                        ),

                        /// LOGIN CARD
                        Transform.translate(
                          offset: const Offset(0, -30),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.black.withValues(
                                    alpha: 0.08,
                                  ),
                                  blurRadius: 25,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),

                            child: Form(
                              key: bloc.loginFormKey,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    state.isLoginWithOtp
                                        ? 'Login with OTP'
                                        : 'Login',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                                  ),

                                  8.h,

                                  Text(
                                    'Manage your distribution business',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                      AppColors.baseColorWhite45,
                                    ),
                                  ),

                                  30.h,

                                  state.isLoginWithOtp
                                      ? const LoginWithPhoneWidget()
                                      : const LoginWithEmailWidget(),

                                  30.h,

                                  const Center(
                                    child: LoginFooterWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        10.h,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showBiometricPromptDialog(final BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (final BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.colorPrimary500.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fingerprint_rounded,
                    color: AppColors.colorPrimary500,
                    size: 56,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enable Fingerprint Login?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Would you like to enable fingerprint login for faster and more secure access next time?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.baseColorWhite45,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: AppColors.baseColorWhite85,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () async {
                          await sharedPreferenceHelper.saveIsBiometricEnabled(false);
                          if (context.mounted) {
                            Navigator.pop(dialogContext);
                            context.read<LoginBloc>().navigateToDashboard(context);
                          }
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          await sharedPreferenceHelper.saveIsBiometricEnabled(true);
                          if (context.mounted) {
                            Navigator.pop(dialogContext);
                            context.read<LoginBloc>().navigateToDashboard(context);
                          }
                        },
                        child: const Text(
                          'Enable',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BiometricTriggerWidget extends StatefulWidget {
  const BiometricTriggerWidget({super.key});

  @override
  State<BiometricTriggerWidget> createState() => _BiometricTriggerWidgetState();
}

class _BiometricTriggerWidgetState extends State<BiometricTriggerWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (sharedPreferenceHelper.isBiometricEnabled == true) {
        context.read<LoginBloc>().add(LoginEvent.loginWithBiometric(context: context));
      }
    });
  }

  @override
  Widget build(final BuildContext context) => const SizedBox.shrink();
}
