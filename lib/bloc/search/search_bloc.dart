import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/search_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;

  SearchBloc({required this.searchRepo}) : super(SearchState.initial()) {
    on<OnQueryChanged>((
      final OnQueryChanged event,
      final Emitter<SearchState> emit,
    ) {
      emit(state.copyWith(query: event.query));
      if (event.query.isEmpty) {
        emit(state.copyWith(
          status: CommonScreenState.initial,
          searchResults: <UserDataModel>[],
        ));
      } else {
        add(const OnSearchSubmitted());
      }
    });

    on<OnSearchSubmitted>((
      final OnSearchSubmitted event,
      final Emitter<SearchState> emit,
    ) async {
      if (state.query.isEmpty) return;

      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, List<UserDataModel>> result =
          await searchRepo.searchUsers(state.query);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final List<UserDataModel> users) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            searchResults: users,
          ));
        },
      );
    });
  }
}
