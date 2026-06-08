part of 'home_bloc.dart';

@freezed
abstract class HomeState
    with _$HomeState {
  factory HomeState({
    required bool
    showAppUpdatePopUp,

    AppSettingModel?
    appSettingsData,

    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      showAppUpdatePopUp:
      false,

      appSettingsData:
      null,

      errorMessage: null,
    );
  }
}
