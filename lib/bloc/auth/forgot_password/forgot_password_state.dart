part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState
    with _$ForgotPasswordState {
  const factory
  ForgotPasswordState({
    required CommonScreenState
    status,

    String? email,

    String? errorMessage,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState
      .initial() {
    return ForgotPasswordState(
      status:
      CommonScreenState
          .initial,

      email: null,

      errorMessage: null,
    );
  }
}
