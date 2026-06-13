part of 'reel_bloc.dart';

@freezed
abstract class ReelState with _$ReelState {
  factory ReelState({
    required CommonScreenState status,
    required List<ReelModel> reels,
    required String localVideoPath,
    required String caption,
    String? category,
    String? errorMessage,
  }) = _ReelState;

  factory ReelState.initial() {
    return ReelState(
      status: CommonScreenState.initial,
      reels: const <ReelModel>[],
      localVideoPath: '',
      caption: '',
      category: null,
      errorMessage: null,
    );
  }
}
