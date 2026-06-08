part of 'share_bloc.dart';

@freezed
abstract class ShareEvent with _$ShareEvent {
  const factory ShareEvent.onSharePost({
    required String postId,
  }) = OnSharePost;
}
