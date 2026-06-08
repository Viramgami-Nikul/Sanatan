import 'package:flutter/material.dart';

import 'package:santvani_app/translations/en_US/en_us_translation.dart';
import 'package:santvani_app/translations/gu_IN/gu_in_translation.dart';

class AppTranslation {
  static Locale currentLocale = const Locale('en', 'US');

  static final Map<String, Map<String, String>> _translations =
      <String, Map<String, String>>{
    'en_US': enUs,
    'gu_IN': guIN,
  };

  static void changeLocale(final Locale locale) {
    currentLocale = locale;
  }

  static String translate(
    final String key,
    final Locale locale, {
    final Map<String, String>? namedArgs,
    final List<String>? args,
  }) {
    final String localeKey = '${locale.languageCode}_${locale.countryCode}';
    final Map<String, String> localeMap =
        _translations[localeKey] ?? _translations['en_US'] ?? <String, String>{};
    final Map<String, String> fallbackMap =
        _translations['en_US'] ?? <String, String>{};
    String value = localeMap[key] ?? fallbackMap[key] ?? key;

    namedArgs?.forEach((final String name, final String replacement) {
      value = value.replaceAll('{$name}', replacement);
    });

    if (args != null) {
      for (int index = 0; index < args.length; index++) {
        value = value.replaceAll('{$index}', args[index]);
      }
    }

    return value;
  }
}
