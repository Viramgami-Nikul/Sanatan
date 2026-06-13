part of 'reel_bloc.dart';

@freezed
abstract class ReelEvent with _$ReelEvent {
  const factory ReelEvent.fetchReels() = FetchReels;

  const factory ReelEvent.onSelectVideo({
    required String videoPath,
  }) = OnSelectVideo;

  const factory ReelEvent.onCaptionChanged({
    required String caption,
  }) = OnCaptionChanged;

  const factory ReelEvent.onCategoryChanged({
    required String category,
  }) = OnCategoryChanged;

  const factory ReelEvent.onSubmitReel() = OnSubmitReel;
}
