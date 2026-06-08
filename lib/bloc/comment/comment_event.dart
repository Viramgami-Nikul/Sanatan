part of 'comment_bloc.dart';

@freezed
abstract class CommentEvent with _$CommentEvent {
  const factory CommentEvent.onLoadComments({
    required String postId,
  }) = OnLoadComments;

  const factory CommentEvent.onAddComment({
    required String postId,
    required String commentText,
    required String username,
    required String userAvatarUrl,
  }) = OnAddComment;
}
