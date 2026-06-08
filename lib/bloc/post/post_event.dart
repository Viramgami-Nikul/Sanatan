part of 'post_bloc.dart';

@freezed
abstract class PostEvent with _$PostEvent {
  const factory PostEvent.onSelectImage({
    required String imagePath,
  }) = OnSelectImage;

  const factory PostEvent.onCaptionChanged({
    required String caption,
  }) = OnCaptionChanged;

  const factory PostEvent.onCategoryChanged({
    required String category,
  }) = OnCategoryChanged;

  const factory PostEvent.onSubmitPost() = OnSubmitPost;
}
