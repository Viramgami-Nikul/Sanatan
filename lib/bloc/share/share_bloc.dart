import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/share_model.dart';
import 'package:santvani_app/data/repository/share_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'share_bloc.freezed.dart';
part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  final ShareRepo shareRepo;

  ShareBloc({required this.shareRepo}) : super(ShareState.initial()) {
    on<OnSharePost>((
      final OnSharePost event,
      final Emitter<ShareState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, ShareModel> result = await shareRepo.sharePost(
        postId: event.postId,
      );

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final ShareModel share) {
          emit(state.copyWith(
            status: CommonScreenState.success,
          ));
        },
      );
    });
  }
}
