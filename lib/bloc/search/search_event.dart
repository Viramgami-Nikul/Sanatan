part of 'search_bloc.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.onQueryChanged({
    required String query,
  }) = OnQueryChanged;

  const factory SearchEvent.onSearchSubmitted() = OnSearchSubmitted;
}
