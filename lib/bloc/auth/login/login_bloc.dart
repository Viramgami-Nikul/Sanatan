import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:package_info_plus/package_info_plus.dart';

import 'package:santvani_app/routes/routes_name.dart';

import 'package:santvani_app/utils/utils.dart';

import 'package:santvani_app/data/api/either.dart';

import 'package:santvani_app/data/errors/failure.dart';

import 'package:santvani_app/data/models/request_model/login_request_model.dart';

import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';

import 'package:santvani_app/data/models/response_model/device_info_model.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';

import 'package:santvani_app/helper/pref_helper/pref_keys.dart';

import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/constants.dart';

import 'package:santvani_app/views/tab_navigation/tab_navigation_view.dart';
import 'package:local_auth/local_auth.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginBloc({required this.authRepo}) : super(LoginState.initial()) {
    on<OnChangeEmail>((
      final OnChangeEmail event,
      final Emitter<LoginState> emit,
    ) {
      emit(state.copyWith(email: event.email));
    });

    on<OnChangePassword>((
      final OnChangePassword event,
      final Emitter<LoginState> emit,
    ) {
      emit(state.copyWith(password: event.password));
    });

    on<OnSubmit>((final OnSubmit event, final Emitter<LoginState> emit) async {
      debugPrint('OnSubmit called');

      emit(state.copyWith(status: CommonScreenState.loading, user: null));

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();

      final String? fcmToken = SharedPreferenceHelper().fcmToken;

      final DeviceInfoModel deviceData = await Utils.getDeviceInfo();

      final LoginRequestModel request = LoginRequestModel(
        emailId: state.email,
        userPassword: state.password,
        appVersion: packageInfo.version,
        deviceToken: fcmToken,
        deviceType: deviceData.deviceType,
        deviceId: deviceData.deviceId,
        deviceName: deviceData.userDeviceName,
      );

      final Either<Failure, UserDataModel> result = await authRepo.apiLogin(
        requestParams: request,
      );

      await result.fold(
        (final Failure error) async {
          emit(
            state.copyWith(
              status: CommonScreenState.error,
              user: null,
              errorMessage: error.message,
            ),
          );
        },

        (final UserDataModel user) async {
          // Save all data BEFORE emitting success so navigation doesn't
          // destroy the bloc while async work is still pending.
          await SharedPreferenceHelper().saveIsLoggedIn(true);
          await SharedPreferenceHelper().saveUser(user);

          if (state.isRememberMe) {
            await sharedPreferenceHelper.setRememberEmail(request.emailId ?? '');
            await sharedPreferenceHelper.setUserPassword(request.userPassword ?? '');
          } else {
            await sharedPreferenceHelper.removeString(PrefKeys.rememberEmail);
            await sharedPreferenceHelper.removeString(PrefKeys.rememberPassword);
          }

          // Non-critical Crashlytics calls — fire-and-forget after save
          unawaited(
            FirebaseCrashlytics.instance
                .setUserIdentifier(user.emailId ?? ''),
          );
          unawaited(
            FirebaseCrashlytics.instance
                .setCustomKey('user_name', user.fullName),
          );
          unawaited(
            FirebaseCrashlytics.instance.setCustomKey(
              'registration_id',
              user.userRegistrationId ?? 'Not Found',
            ),
          );

          // Emit success only after all saves are complete
          emit(state.copyWith(status: CommonScreenState.success, user: user));
        },
      );
    });

    on<OnChangeRememberMe>((
      final OnChangeRememberMe event,
      final Emitter<LoginState> emit,
    ) {
      sharedPreferenceHelper.saveIsRememberMe(event.isRememberMe);

      emit(state.copyWith(isRememberMe: event.isRememberMe));
    });

    on<OnTapForgotPassword>((
      final OnTapForgotPassword event,
      final Emitter<LoginState> emit,
    ) {
      navigateToForgotPassword(event.context);
    });

    on<OnTapLoginWithOtpStateEvent>((
      final OnTapLoginWithOtpStateEvent event,
      final Emitter<LoginState> emit,
    ) async {
      emit(state.copyWith(isLoginWithOtp: !state.isLoginWithOtp));
    });

    on<LoginWithBiometric>((
      final LoginWithBiometric event,
      final Emitter<LoginState> emit,
    ) async {
      final LocalAuthentication auth = LocalAuthentication();
      try {
        final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
        final bool canAuthenticate =
            canAuthenticateWithBiometrics || await auth.isDeviceSupported();

        if (!canAuthenticate) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: 'Biometric authentication is not supported or not set up on this device.',
          ));
          return;
        }

        final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to login securely',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );

        if (didAuthenticate) {
          debugPrint('Biometric login success!');
          
          final UserDataModel? savedUser = SharedPreferenceHelper().user;
          if (savedUser != null) {
            await SharedPreferenceHelper().saveIsLoggedIn(true);
            emit(state.copyWith(
              status: CommonScreenState.success,
              user: savedUser,
            ));
          } else {
            final String rememberEmail = SharedPreferenceHelper().getRememberEmail;
            final String rememberPassword = SharedPreferenceHelper().getSavedPassword;
            if (rememberEmail.isNotEmpty && rememberPassword.isNotEmpty) {
              emit(state.copyWith(
                email: rememberEmail,
                password: rememberPassword,
                status: CommonScreenState.loading,
              ));
              add(const LoginEvent.onSubmit());
            } else {
              emit(state.copyWith(
                status: CommonScreenState.error,
                errorMessage: 'Please login using email and password first to enable biometric login.',
              ));
            }
          }
        } else {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: 'Biometric authentication failed.',
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'An error occurred during biometric authentication.',
        ));
      }
    });
  }

  void navigateToDashboard(final BuildContext context) {
    debugPrint('navigateToDashboard');

    Navigator.pushAndRemoveUntil(
      context,

      MaterialPageRoute(
        builder: (final BuildContext context) => const TabNavigationView(),
      ),

      (final Route<dynamic> route) => false,
    );
  }

  void navigateToForgotPassword(final BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.forgotPasswordScreen,
    );
  }
}
