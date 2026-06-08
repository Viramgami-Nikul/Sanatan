part of 'like_bloc.dart';

@freezed
abstract class LikeEvent with _$LikeEvent {
  const factory LikeEvent.onCheckLikeStatus({
    required String postId,
  }) = OnCheckLikeStatus;

  const factory LikeEvent.onToggleLike({
    required String postId,
    required bool isLiked,
  }) = OnToggleLike;
}
