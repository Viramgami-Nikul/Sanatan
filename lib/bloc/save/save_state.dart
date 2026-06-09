part of 'save_bloc.dart';

@freezed
abstract class SaveState with _$SaveState {
  factory SaveState({
    required CommonScreenState status,
    required bool isSaved,
    required List<PostModel> savedPosts,
    String? errorMessage,
  }) = _SaveState;

  factory SaveState.initial() {
    return SaveState(
      status: CommonScreenState.initial,
      isSaved: false,
      savedPosts: const <PostModel>[],
      errorMessage: null,
    );
  }
}
