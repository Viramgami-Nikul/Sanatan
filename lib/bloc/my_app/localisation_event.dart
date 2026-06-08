part of 'localisation_bloc.dart';

@freezed
abstract class LocalisationEvent
    with _$LocalisationEvent {
  const factory
  LocalisationEvent.onChangeLanguage(
      Locale language,
      ) = OnChangeLanguage;
}
