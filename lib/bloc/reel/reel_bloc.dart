import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';
import 'package:santvani_app/data/repository/reel_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'reel_bloc.freezed.dart';
part 'reel_event.dart';
part 'reel_state.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final ReelRepo reelRepo;

  ReelBloc({required this.reelRepo}) : super(ReelState.initial()) {
    on<FetchReels>((final FetchReels event, final Emitter<ReelState> emit) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, List<ReelModel>> result = await reelRepo.getReels();

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final List<ReelModel> reels) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            reels: reels,
          ));
        },
      );
    });

    on<OnSelectVideo>((
      final OnSelectVideo event,
      final Emitter<ReelState> emit,
    ) {
      emit(state.copyWith(
        localVideoPath: event.videoPath,
        status: CommonScreenState.initial,
      ));
    });

    on<OnCaptionChanged>((
      final OnCaptionChanged event,
      final Emitter<ReelState> emit,
    ) {
      emit(state.copyWith(caption: event.caption));
    });

    on<OnCategoryChanged>((
      final OnCategoryChanged event,
      final Emitter<ReelState> emit,
    ) {
      emit(state.copyWith(category: event.category));
    });

    on<OnSubmitReel>((
      final OnSubmitReel event,
      final Emitter<ReelState> emit,
    ) async {
      if (state.localVideoPath.isEmpty) {
        emit(state.copyWith(
          status: CommonScreenState.error,
          errorMessage: 'Please select a video',
        ));
        return;
      }

      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, ReelModel> result = await reelRepo.createReel(
        localVideoPath: state.localVideoPath,
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
        (final ReelModel reel) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            localVideoPath: '',
            caption: '',
            category: null,
          ));
          add(const ReelEvent.fetchReels());
        },
      );
    });
  }
}
