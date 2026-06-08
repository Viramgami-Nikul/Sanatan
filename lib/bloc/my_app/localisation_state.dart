part of 'localisation_bloc.dart';

@freezed
abstract class LocalisationState
    with _$LocalisationState {
  const factory
  LocalisationState({
    required Locale language,
  }) = _LocalisationState;

  factory LocalisationState
      .initial() {
    final String languageCode = SharedPreferenceHelper().getLanguageCode;
    final String countryCode = SharedPreferenceHelper().getCountryCode;
    final bool isGujarati = languageCode == SupportedLangCode.gujarati.langCode;

    return LocalisationState(
      language: Locale(
        isGujarati
            ? SupportedLangCode.gujarati.langCode
            : SupportedLangCode.english.langCode,

        isGujarati
            ? SupportedLangCode.gujarati.countryCode
            : countryCode,
      ),
    );
  }
}
