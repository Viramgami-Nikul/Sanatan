part of 'privacy_policy_bloc.dart';

@freezed
abstract class PrivacyPolicyState
    with _$PrivacyPolicyState {
  factory PrivacyPolicyState({
    required CommonScreenState
    status,

    required WebViewController
    controller,

    String? errorMessage,
  }) = _PrivacyPolicyState;

  factory PrivacyPolicyState
      .initial() {
    return PrivacyPolicyState(
      status:
      CommonScreenState
          .loading,

      controller:
      WebViewController(),

      errorMessage: null,
    );
  }
}
