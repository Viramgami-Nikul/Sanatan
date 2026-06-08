import 'dart:convert';

import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/helper/pref_helper/pref_keys.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static final SharedPreferenceHelper _instance =
  SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() => _instance;

  late SharedPreferences _sharedPreference;

  SharedPreferenceHelper._internal();

  /// Initialize SharedPreferences
  Future<void> init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  // ---------------------------------------------------------------------------
  // Remember Me
  // ---------------------------------------------------------------------------

  Future<void> saveIsRememberMe(final bool isRememberMe) async {
    await _sharedPreference.setBool(
      PrefKeys.isRememberMe,
      isRememberMe,
    );
  }

  bool? get isRememberMe {
    return _sharedPreference.getBool(PrefKeys.isRememberMe);
  }

  Future<void> setRememberEmail(final String value) async {
    await _sharedPreference.setString(
      PrefKeys.rememberEmail,
      value,
    );
  }

  String get getRememberEmail {
    return _sharedPreference.getString(
      PrefKeys.rememberEmail,
    ) ??
        '';
  }

  Future<void> setUserPassword(final String value) async {
    await _sharedPreference.setString(
      PrefKeys.rememberPassword,
      value,
    );
  }

  String get getSavedPassword {
    return _sharedPreference.getString(
      PrefKeys.rememberPassword,
    ) ??
        '';
  }

  // ---------------------------------------------------------------------------
  // User Data
  // ---------------------------------------------------------------------------

  Future<void> saveUser(final UserDataModel user) async {
    await _sharedPreference.setString(
      PrefKeys.user,
      jsonEncode(user.toJson()),
    );
  }

  UserDataModel? get user {
    final String? userPref = _sharedPreference.getString(PrefKeys.user);

    if (userPref != null && userPref.isNotEmpty) {
      return UserDataModel.fromJson(
        jsonDecode(userPref),
      );
    }

    return null;
  }

  Future<void> saveIsLoggedIn(final bool value) async {
    await _sharedPreference.setBool(
      PrefKeys.isLoggedIn,
      value,
    );
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(
      PrefKeys.isLoggedIn,
    ) ??
        false;
  }

  // ---------------------------------------------------------------------------
  // FCM Token
  // ---------------------------------------------------------------------------

  Future<void> saveFcmToken(final String fcmToken) async {
    await _sharedPreference.setString(
      PrefKeys.fcmToken,
      fcmToken,
    );
  }

  String? get fcmToken {
    return _sharedPreference.getString(
      PrefKeys.fcmToken,
    );
  }

  // ---------------------------------------------------------------------------
  // Language
  // ---------------------------------------------------------------------------

  Future<void> changeLanguage(final String language) async {
    await _sharedPreference.setString(
      PrefKeys.currentLanguage,
      language,
    );
  }

  String? get currentLanguage {
    return _sharedPreference.getString(
      PrefKeys.currentLanguage,
    ) ??
        SupportedLangCode.english.langCode;
  }

  Future<void> setLanguageCode(final String value) async {
    await _sharedPreference.setString(
      PrefKeys.languageCode,
      value,
    );
  }

  String get getLanguageCode {
    return _sharedPreference.getString(
      PrefKeys.languageCode,
    ) ??
        'en';
  }

  // ---------------------------------------------------------------------------
  // Country
  // ---------------------------------------------------------------------------

  Future<void> setCountryCode(final String code) async {
    await _sharedPreference.setString(
      PrefKeys.countryCode,
      code,
    );
  }

  String get getCountryCode {
    return _sharedPreference.getString(
      PrefKeys.countryCode,
    ) ??
        SupportedLangCode.english.countryCode;
  }

  // ---------------------------------------------------------------------------
  // Generic Methods
  // ---------------------------------------------------------------------------

  Future<void> putString(
      final String key,
      final String value,
      ) async {
    await _sharedPreference.setString(key, value);
  }

  Future<void> putInt(
      final String key,
      final int value,
      ) async {
    await _sharedPreference.setInt(key, value);
  }

  Future<void> setInt(
    final String key,
    final int value,
  ) async {
    await putInt(key, value);
  }

  Future<void> putBoolean(
      final String key,
      final bool value,
      ) async {
    await _sharedPreference.setBool(key, value);
  }

  Future<String> getString(final String key) async {
    return _sharedPreference.getString(key) ?? '';
  }

  Future<int> getInt(final String key) async {
    return _sharedPreference.getInt(key) ?? 0;
  }

  Future<bool> getBoolean(final String key) async {
    return _sharedPreference.getBool(key) ?? false;
  }

  Future<bool> removeString(final String key) async {
    return _sharedPreference.remove(key);
  }

  // ---------------------------------------------------------------------------
  // Clear Preferences
  // ---------------------------------------------------------------------------

  Future<void> clear() async {
    final List<String> arrKeysToKeep = <String>[
      PrefKeys.isRememberMe,
      PrefKeys.rememberEmail,
      PrefKeys.rememberPassword,
      PrefKeys.languageCode,
      PrefKeys.currentLanguage,
      PrefKeys.isBiometricEnabled,
    ];

    final Set<String> keys = _sharedPreference.getKeys();

    for (final String key in keys) {
      if (!arrKeysToKeep.contains(key)) {
        await _sharedPreference.remove(key);
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Biometric Settings
  // ---------------------------------------------------------------------------

  Future<void> saveIsBiometricEnabled(final bool value) async {
    await _sharedPreference.setBool(
      PrefKeys.isBiometricEnabled,
      value,
    );
  }

  bool? get isBiometricEnabled {
    return _sharedPreference.getBool(
      PrefKeys.isBiometricEnabled,
    );
  }
}
