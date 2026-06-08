import 'package:santvani_app/main.dart';

class FlavorConfig {
  static late FlavorConfig instance;

  FlavorConfig() {
    instance = this;
  }

  /// =====================================================
  /// Flavor Check
  /// =====================================================

  static bool get isStaging => currentFlavor == 'staging';

  static bool get isProd => currentFlavor == 'prod';

  /// =====================================================
  /// App Title
  /// =====================================================

  static String get title {
    if (isStaging) {
      return 'Emergency SOS Staging';
    }

    return 'Emergency SOS';
  }

  /// =====================================================
  /// Base URL
  /// =====================================================

  static String get baseUrl {
    if (isStaging) {
      return 'https://staging-api.yourapp.com/';
    }

    return 'https://api.yourapp.com/';
  }

  /// =====================================================
  /// Socket URL
  /// =====================================================

  static String get socketUrl {
    if (isStaging) {
      return 'wss://staging-socket.yourapp.com/';
    }

    return 'wss://socket.yourapp.com/';
  }

  /// =====================================================
  /// Environment Name
  /// =====================================================

  static String get environment {
    if (isStaging) {
      return 'STAGING';
    }

    return 'PRODUCTION';
  }

  /// =====================================================
  /// Debug Mode
  /// =====================================================

  static bool get enableLogs {
    return isStaging;
  }

  /// =====================================================
  /// Firebase Collection
  /// =====================================================

  static String get firebaseCollection {
    if (isStaging) {
      return 'staging_users';
    }

    return 'prod_users';
  }

  /// =====================================================
  /// App Suffix
  /// =====================================================

  static String get packageSuffix {
    if (isStaging) {
      return '.stg';
    }

    return '';
  }
}
