part of 'share_bloc.dart';

@freezed
abstract class ShareState with _$ShareState {
  factory ShareState({
    required CommonScreenState status,
    String? errorMessage,
  }) = _ShareState;

  factory ShareState.initial() {
    return ShareState(
      status: CommonScreenState.initial,
      errorMessage: null,
    );
  }
}
