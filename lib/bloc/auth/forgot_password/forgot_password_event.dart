part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordEvent
    with _$ForgotPasswordEvent {
  const factory
  ForgotPasswordEvent.onTapSubmit() =
  OnTapSubmit;

  const factory
  ForgotPasswordEvent.onChangeEmail({
    required String email,
  }) = OnChangeEmail;
}
