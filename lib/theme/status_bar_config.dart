import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// =====================
/// Transparent Status Bar
/// =====================

const SystemUiOverlayStyle lightStatusBarTransparent =
SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light, // Android
  statusBarBrightness: Brightness.dark, // iOS
);

const SystemUiOverlayStyle darkStatusBarTransparent =
SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark, // Android
  statusBarBrightness: Brightness.light, // iOS
);

/// =====================
/// Solid White Status Bar
/// =====================

const SystemUiOverlayStyle lightStatusBar =
SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);

/// =====================
/// Solid Dark Status Bar
/// =====================

const SystemUiOverlayStyle darkStatusBar =
SystemUiOverlayStyle(
  statusBarColor: Colors.black,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

/// =====================
/// Primary Color Status Bar
/// =====================

const SystemUiOverlayStyle primaryStatusBar =
SystemUiOverlayStyle(
  statusBarColor: Color(0xFF5E87EB),
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

/// =====================
/// Bottom Navigation Style
/// =====================

const SystemUiOverlayStyle bottomNavigationBarStyle =
SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.dark,
);
