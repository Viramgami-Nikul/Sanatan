import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectionUtils {
  /// =====================================================
  /// Check Internet Connection
  /// =====================================================

  static Future<bool> isNetworkConnected() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();

    for (final ConnectivityResult result in connectivityResult) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet ||
          (kDebugMode && result == ConnectivityResult.vpn)) {
        return true;
      }
    }

    return false;
  }

  /// =====================================================
  /// Listen Internet Changes
  /// =====================================================

  static Stream<List<ConnectivityResult>> connectivityStream() {
    return Connectivity().onConnectivityChanged;
  }

  /// =====================================================
  /// Check Only WiFi
  /// =====================================================

  static Future<bool> isWifiConnected() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.wifi);
  }

  /// =====================================================
  /// Check Only Mobile Data
  /// =====================================================

  static Future<bool> isMobileDataConnected() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.mobile);
  }
}
