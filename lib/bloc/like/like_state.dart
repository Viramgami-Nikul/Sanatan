part of 'like_bloc.dart';

@freezed
abstract class LikeState with _$LikeState {
  factory LikeState({
    required CommonScreenState status,
    required bool isLiked,
    required int likesCount,
    String? errorMessage,
  }) = _LikeState;

  factory LikeState.initial() {
    return LikeState(
      status: CommonScreenState.initial,
      isLiked: false,
      likesCount: 0,
      errorMessage: null,
    );
  }
}
