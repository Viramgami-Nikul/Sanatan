part of 'comment_bloc.dart';

@freezed
abstract class CommentState with _$CommentState {
  factory CommentState({
    required CommonScreenState status,
    required List<CommentModel> comments,
    String? errorMessage,
  }) = _CommentState;

  factory CommentState.initial() {
    return CommentState(
      status: CommonScreenState.initial,
      comments: const <CommentModel>[],
      errorMessage: null,
    );
  }
}
