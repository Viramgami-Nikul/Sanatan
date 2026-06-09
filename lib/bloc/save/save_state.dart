part of 'save_bloc.dart';

@freezed
abstract class SaveState with _$SaveState {
  factory SaveState({
    required CommonScreenState status,
    required bool isSaved,
    String? errorMessage,
  }) = _SaveState;

  factory SaveState.initial() {
    return SaveState(
      status: CommonScreenState.initial,
      isSaved: false,
      errorMessage: null,
    );
  }
}
