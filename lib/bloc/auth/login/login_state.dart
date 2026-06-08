part of 'login_bloc.dart';

@freezed
abstract class LoginState
    with _$LoginState {
  factory LoginState({
    required CommonScreenState
    status,

    required String email,

    required String password,

    required bool isRememberMe,

    required bool isLoginWithOtp,

    required String emailOrPhone,

    required UserDataModel?
    user,

    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      status:
      CommonScreenState
          .initial,

      email:
      sharedPreferenceHelper
          .getRememberEmail,

      password:
      sharedPreferenceHelper
          .getSavedPassword,

      user: null,

      isRememberMe:
      sharedPreferenceHelper
          .isRememberMe ??
          false,

      isLoginWithOtp:
      false,

      emailOrPhone: '',

      errorMessage: null,
    );
  }
}
