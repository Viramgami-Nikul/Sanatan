part of 'setting_bloc.dart';

@freezed
abstract class SettingEvent with _$SettingEvent {
  const factory SettingEvent.onLoadSettings({
    required String userId,
  }) = OnLoadSettings;

  const factory SettingEvent.onToggleNotifications({
    required bool isEnabled,
  }) = OnToggleNotifications;

  const factory SettingEvent.onToggleDarkMode({
    required bool isEnabled,
  }) = OnToggleDarkMode;

  const factory SettingEvent.onChangeLanguage({
    required String language,
  }) = OnChangeLanguage;

  const factory SettingEvent.onUpdateFollowerRequests({
    required String value,
  }) = OnUpdateFollowerRequests;

  const factory SettingEvent.onUpdateAcceptedFollowRequests({
    required String value,
  }) = OnUpdateAcceptedFollowRequests;

  const factory SettingEvent.onUpdateAccountSuggestions({
    required String value,
  }) = OnUpdateAccountSuggestions;

  const factory SettingEvent.onUpdateMentionsInBio({
    required String value,
  }) = OnUpdateMentionsInBio;
}
