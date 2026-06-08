import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo;

  PostBloc({required this.postRepo}) : super(PostState.initial()) {
    on<OnSelectImage>((
      final OnSelectImage event,
      final Emitter<PostState> emit,
    ) {
      emit(state.copyWith(imagePath: event.imagePath));
    });

    on<OnCaptionChanged>((
      final OnCaptionChanged event,
      final Emitter<PostState> emit,
    ) {
      emit(state.copyWith(caption: event.caption));
    });

    on<OnCategoryChanged>((
      final OnCategoryChanged event,
      final Emitter<PostState> emit,
    ) {
      emit(state.copyWith(category: event.category));
    });

    on<OnSubmitPost>((
      final OnSubmitPost event,
      final Emitter<PostState> emit,
    ) async {
      if (state.imagePath.isEmpty) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'Please select an image',
        ));
        return;
      }

      if (state.category == null || state.category!.isEmpty) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'Please select a category',
        ));
        return;
      }

      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, PostModel> result = await postRepo.createPost(
        localImagePath: state.imagePath,
        caption: state.caption,
        category: state.category,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final PostModel post) {
          emit(state.copyWith(
            status: CommonScreenState.success,
          ));
        },
      );
    });
  }
}
