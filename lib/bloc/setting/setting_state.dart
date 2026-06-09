part of 'setting_bloc.dart';

@freezed
abstract class SettingState with _$SettingState {
  factory SettingState({
    required CommonScreenState status,
    required SettingModel? settings,
    String? errorMessage,
  }) = _SettingState;

  factory SettingState.initial() {
    return SettingState(
      status: CommonScreenState.initial,
      settings: null,
      errorMessage: null,
    );
  }
}
