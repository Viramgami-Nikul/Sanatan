part of 'post_bloc.dart';

@freezed
abstract class PostState with _$PostState {
  factory PostState({
    required CommonScreenState status,
    required String imagePath,
    required String caption,
    String? category,
    String? errorMessage,
  }) = _PostState;

  factory PostState.initial() {
    return PostState(
      status: CommonScreenState.initial,
      imagePath: '',
      caption: '',
      category: null,
      errorMessage: null,
    );
  }
}
