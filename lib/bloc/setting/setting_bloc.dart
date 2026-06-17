import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/others/setting_model.dart';
import 'package:santvani_app/data/repository/setting_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SettingRepo settingRepo;

  SettingBloc({required this.settingRepo}) : super(SettingState.initial()) {
    on<OnLoadSettings>((
      final OnLoadSettings event,
      final Emitter<SettingState> emit,
    ) async {
      emit(state.copyWith(status: CommonScreenState.loading));

      final Either<Failure, SettingModel> result = await settingRepo.getSettings(userId: event.userId);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnToggleNotifications>((
      final OnToggleNotifications event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(isNotificationsEnabled: event.isEnabled);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnToggleDarkMode>((
      final OnToggleDarkMode event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(isDarkMode: event.isEnabled);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnChangeLanguage>((
      final OnChangeLanguage event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(language: event.language);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnUpdateFollowerRequests>((
      final OnUpdateFollowerRequests event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(followerRequests: event.value);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnUpdateAcceptedFollowRequests>((
      final OnUpdateAcceptedFollowRequests event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(acceptedFollowRequests: event.value);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnUpdateAccountSuggestions>((
      final OnUpdateAccountSuggestions event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(accountSuggestions: event.value);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });

    on<OnUpdateMentionsInBio>((
      final OnUpdateMentionsInBio event,
      final Emitter<SettingState> emit,
    ) async {
      if (state.settings == null) return;
      final SettingModel updated = state.settings!.copyWith(mentionsInBio: event.value);
      emit(state.copyWith(status: CommonScreenState.loading, settings: updated));

      final Either<Failure, SettingModel> result = await settingRepo.updateSettings(setting: updated);

      result.fold(
        (final Failure failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final SettingModel settings) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            settings: settings,
          ));
        },
      );
    });
  }
}
