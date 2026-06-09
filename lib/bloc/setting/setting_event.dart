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
}
