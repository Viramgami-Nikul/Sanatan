import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

/// =====================================================
/// Global Shared Preference Instance
/// =====================================================

SharedPreferenceHelper sharedPreferenceHelper =
SharedPreferenceHelper();

/// =====================================================
/// App Constants
/// =====================================================

class AppConstants {
  // =====================================================
  // App Info
  // =====================================================

  static String appName = 'Emergency SOS';

  static String stagingPackage =
      'com.masterly.flutterbasecodestg';

  static String prodPackage =
      'com.masterly.flutterbasecode';

  // =====================================================
  // API
  // =====================================================

  static const int apiTimeOut = 60;

  // =====================================================
  // Pagination
  // =====================================================

  static const int pageSize = 10;

  // =====================================================
  // Language
  // =====================================================

  static const String defaultLanguageCode = 'en';
  static const String defaultCountryCode = 'US';

  // =====================================================
  // CMS URLs
  // =====================================================

  static String termsConditions =
      'https://masterlysolutions.com/terms-and-conditions/';

  static String privacyPolicy =
      'https://masterlysolutions.com/terms-and-conditions/';

  // =====================================================
  // Image
  // =====================================================

  static const String defaultNetworkImage = '';

  // =====================================================
  // Animation Duration
  // =====================================================

  static const Duration buttonAnimationDuration =
  Duration(milliseconds: 300);

  static const Duration screenTransitionDuration =
  Duration(milliseconds: 400);

  // =====================================================
  // Padding
  // =====================================================

  static const double screenHorizontalPadding = 16.0;
  static const double screenVerticalPadding = 16.0;

  // =====================================================
  // Radius
  // =====================================================

  static const double borderRadius = 12.0;
  static const double buttonRadius = 10.0;

  // =====================================================
  // Storage Keys
  // =====================================================

  static const String tokenKey = 'token';
  static const String userKey = 'user';

  // =====================================================
  // Notification Channel
  // =====================================================

  static const String notificationChannelId =
      'flutter_base_notification_channel';

  static const String notificationChannelName =
      'High Importance Notifications';



  static const String androidStoreUrl = '';
  static const String iosStoreUrl = '';
}
