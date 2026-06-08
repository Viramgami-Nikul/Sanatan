part of 'login_bloc.dart';

@freezed
abstract class LoginEvent
    with _$LoginEvent {
  const factory
  LoginEvent.onChangeRememberMe({
    required bool isRememberMe,
  }) = OnChangeRememberMe;

  const factory
  LoginEvent.onChangeEmail({
    required String email,
  }) = OnChangeEmail;

  const factory
  LoginEvent.onChangePassword({
    required String password,
  }) = OnChangePassword;

  const factory LoginEvent.onSubmit() =
  OnSubmit;

  const factory
  LoginEvent.onTapForgotPassword({
    required BuildContext context,
  }) = OnTapForgotPassword;

  const factory
  LoginEvent.onTapLoginWithOtpStateEvent() =
  OnTapLoginWithOtpStateEvent;

  const factory
  LoginEvent.loginWithBiometric({
    required BuildContext context,
  }) = LoginWithBiometric;
}
