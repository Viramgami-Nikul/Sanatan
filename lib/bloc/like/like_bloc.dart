import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/like_model.dart';
import 'package:santvani_app/data/repository/like_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'like_bloc.freezed.dart';
part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final LikeRepo likeRepo;

  LikeBloc({required this.likeRepo}) : super(LikeState.initial()) {
    on<OnCheckLikeStatus>((
      final OnCheckLikeStatus event,
      final Emitter<LikeState> emit,
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

      final Either<Failure, bool> result = await likeRepo.isPostLikedByUser(
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
        (final bool isLiked) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            isLiked: isLiked,
          ));
        },
      );
    });

    on<OnToggleLike>((
      final OnToggleLike event,
      final Emitter<LikeState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, LikeModel> result = await likeRepo.toggleLike(
        postId: event.postId,
        isLiked: event.isLiked,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final LikeModel like) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            isLiked: event.isLiked,
            likesCount: event.isLiked ? state.likesCount + 1 : (state.likesCount > 0 ? state.likesCount - 1 : 0),
          ));
        },
      );
    });
  }
}
