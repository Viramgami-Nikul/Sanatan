part of 'save_bloc.dart';

@freezed
abstract class SaveEvent with _$SaveEvent {
  const factory SaveEvent.onCheckSaveStatus({
    required String postId,
  }) = OnCheckSaveStatus;

  const factory SaveEvent.onToggleSave({
    required String postId,
    required bool isSaved,
  }) = OnToggleSave;

  const factory SaveEvent.onLoadSavedPosts({
    required String userId,
  }) = OnLoadSavedPosts;
}
