part of 'search_bloc.dart';

@freezed
abstract class SearchState with _$SearchState {
  factory SearchState({
    required CommonScreenState status,
    required String query,
    required List<UserDataModel> searchResults,
    String? errorMessage,
  }) = _SearchState;

  factory SearchState.initial() {
    return SearchState(
      status: CommonScreenState.initial,
      query: '',
      searchResults: <UserDataModel>[],
      errorMessage: null,
    );
  }
}
