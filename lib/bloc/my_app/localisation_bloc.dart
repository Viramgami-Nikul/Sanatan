import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:local_auth/local_auth.dart';

import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

import 'package:santvani_app/translations/app_translations.dart';

import 'package:santvani_app/utils/app_enums.dart';

part 'localisation_bloc.freezed.dart';

part 'localisation_event.dart';

part 'localisation_state.dart';

class LocalisationBloc
    extends Bloc<
        LocalisationEvent,
        LocalisationState
    > {
  final LocalAuthentication
  localAuth =
  LocalAuthentication();

  LocalisationBloc()
      : super(
    LocalisationState
        .initial(),
  ) {
    AppTranslation.changeLocale(state.language);

    on<OnChangeLanguage>(
          (
          final OnChangeLanguage
          event,
          final Emitter<
              LocalisationState
          >
          emit,
          ) async {
        await SharedPreferenceHelper().changeLanguage(
          event.language.languageCode,
        );
        await SharedPreferenceHelper().setLanguageCode(
          event.language.languageCode,
        );
        await SharedPreferenceHelper().setCountryCode(
          event.language.countryCode ?? SupportedLangCode.english.countryCode,
        );

        AppTranslation
            .changeLocale(
          event.language,
        );

        emit(
          state.copyWith(
            language:
            event.language,
          ),
        );
      },
    );
  }
}
