part of 'signu_up_details_bloc.dart';

@freezed
abstract class SignUpDetailsEvent
    with _$SignUpDetailsEvent {
  const factory SignUpDetailsEvent.initialEvent({
    required SignupRequest
    signupRequest,
  }) = InitialEvent;

  const factory
  SignUpDetailsEvent.onChangePassword({
    required String password,
  }) = OnChangePassword;

  const factory
  SignUpDetailsEvent.onChangeConfirmPassword({
    required String
    confirmPassword,
  }) = OnChangeConfirmPassword;

  const factory
  SignUpDetailsEvent.onSelectQuestion({
    required int questionId,
  }) = OnSelectQuestion;

  const factory
  SignUpDetailsEvent.onChangeAnswer({
    required String answer,
  }) = OnChangeAnswer;

  const factory
  SignUpDetailsEvent.onCheckPrivacyPolicy({
    required bool
    checkPrivacyPolicy,
  }) = OnCheckPrivacyPolicy;

  const factory
  SignUpDetailsEvent.onCheckTermsAndCondition() =
  OnCheckTermsAndCondition;

  const factory
  SignUpDetailsEvent.onTapSubmit() =
  OnTapSubmit;
}
