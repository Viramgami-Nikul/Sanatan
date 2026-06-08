import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/comment_model.dart';
import 'package:santvani_app/data/repository/comment_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'comment_bloc.freezed.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepo commentRepo;

  CommentBloc({required this.commentRepo}) : super(CommentState.initial()) {
    on<OnLoadComments>((
      final OnLoadComments event,
      final Emitter<CommentState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, List<CommentModel>> result = await commentRepo.getComments(
        postId: event.postId,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final List<CommentModel> comments) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            comments: comments,
          ));
        },
      );
    });

    on<OnAddComment>((
      final OnAddComment event,
      final Emitter<CommentState> emit,
    ) async {
      if (event.commentText.trim().isEmpty) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'Comment text cannot be empty',
        ));
        return;
      }

      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, CommentModel> result = await commentRepo.addComment(
        postId: event.postId,
        commentText: event.commentText,
        username: event.username,
        userAvatarUrl: event.userAvatarUrl,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final CommentModel comment) {
          final List<CommentModel> updatedComments = List<CommentModel>.from(state.comments)
            ..insert(0, comment); // Insert new comment at the top
          emit(state.copyWith(
            status: CommonScreenState.success,
            comments: updatedComments,
          ));
        },
      );
    });
  }
}
