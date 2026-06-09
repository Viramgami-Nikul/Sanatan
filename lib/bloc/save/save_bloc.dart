import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/save_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/repository/save_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'save_bloc.freezed.dart';
part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final SaveRepo saveRepo;

  SaveBloc({required this.saveRepo}) : super(SaveState.initial()) {
    on<OnCheckSaveStatus>((
      final OnCheckSaveStatus event,
      final Emitter<SaveState> emit,
    ) async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'User is not logged in',
        ));
        return;
      }
      final String userId = currentUser.uid;

      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, bool> result = await saveRepo.isPostSavedByUser(
        postId: event.postId,
        userId: userId,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final bool isSaved) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            isSaved: isSaved,
          ));
        },
      );
    });

    on<OnToggleSave>((
      final OnToggleSave event,
      final Emitter<SaveState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, SaveModel> result = await saveRepo.toggleSave(
        postId: event.postId,
        isSaved: event.isSaved,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SaveModel save) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            isSaved: event.isSaved,
          ));
        },
      );
    });

    on<OnLoadSavedPosts>((
      final OnLoadSavedPosts event,
      final Emitter<SaveState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, List<PostModel>> result = await saveRepo.getSavedPosts(
        userId: event.userId,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final List<PostModel> posts) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            savedPosts: posts,
          ));
        },
      );
    });
  }
}
