part of 'privacy_policy_bloc.dart';

@freezed
abstract class PrivacyPolicyEvent
    with _$PrivacyPolicyEvent {
  const factory
  PrivacyPolicyEvent.started() =
  _Started;

  const factory
  PrivacyPolicyEvent.initial({
    required String url,
  }) = Initial;
}
