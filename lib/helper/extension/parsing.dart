import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:santvani_app/helper/extension/string_ext.dart';

class Parsing {
  Parsing._();

  /// =========================
  /// INT PARSING
  /// =========================
  static int intFrom(
      final dynamic data, {
        final int defaultValue = 0,
      }) {
    if (data == null) return defaultValue;

    if (data is int) return data;

    if (data is double) return data.toInt();

    if (data is String) {
      return _intFromString(
        data,
        defaultValue: defaultValue,
      );
    }

    return defaultValue;
  }

  /// =========================
  /// DOUBLE PARSING
  /// =========================
  static double doubleFrom(
      final dynamic data, {
        final double defaultValue = 0.0,
      }) {
    if (data == null) return defaultValue;

    if (data is double) return data;

    if (data is int) return data.toDouble();

    if (data is String) {
      return _doubleFromString(
        data,
        defaultValue: defaultValue,
      );
    }

    return defaultValue;
  }

  /// =========================
  /// STRING PARSING
  /// =========================
  static String stringFrom(
      final dynamic data, {
        final String defaultValue = '',
      }) {
    if (data == null) return defaultValue;

    if (data is String) {
      return data.isNotNullAndEmpty() ? data : defaultValue;
    }

    if (data is int || data is double || data is bool) {
      return data.toString();
    }

    return defaultValue;
  }

  /// =========================
  /// BOOL PARSING
  /// =========================
  static bool boolFrom(
      final dynamic data, {
        final bool defaultValue = false,
      }) {
    if (data == null) return defaultValue;

    if (data is bool) return data;

    if (data is int || data is double) {
      return data == 1;
    }

    if (data is String) {
      final String value = data.toLowerCase();

      return value == '1' ||
          value == 'true' ||
          value == 'yes'
          ? true
          : defaultValue;
    }

    return defaultValue;
  }

  /// =========================
  /// ARRAY PARSING
  /// =========================
  static List<dynamic>? arrayFrom(
      final dynamic data, {
        final bool makeNull = false,
      }) {
    if (data == null) {
      return makeNull ? null : <dynamic>[];
    }

    if (data is List) return data;

    if (data is String) {
      try {
        final dynamic decoded = convert.jsonDecode(data);

        if (decoded is List) {
          return decoded;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return makeNull ? null : <dynamic>[];
  }

  /// =========================
  /// MAP PARSING
  /// =========================
  static Map<String, dynamic>? mapFrom(
      final dynamic data, {
        final bool makeNull = false,
      }) {
    if (data == null) {
      return makeNull ? null : <String, dynamic>{};
    }

    if (data is Map) {
      return data.map(
            (final key, final value) =>
            MapEntry(key.toString(), value),
      );
    }

    if (data is String) {
      try {
        final dynamic decoded = convert.jsonDecode(data);

        if (decoded is Map) {
          return decoded.map(
                (final key, final value) =>
                MapEntry(key.toString(), value),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return makeNull ? null : <String, dynamic>{};
  }

  /// =========================
  /// CLONE MAP
  /// =========================
  static Map<String, dynamic>? cloneMap(
      final Map<String, dynamic> data, {
        final bool makeNull = false,
      }) {
    try {
      final String encoded =
      convert.jsonEncode(data);

      final dynamic decoded =
      convert.jsonDecode(encoded);

      if (decoded is Map) {
        return decoded.map(
              (final key, final value) =>
              MapEntry(key.toString(), value),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return makeNull ? null : <String, dynamic>{};
  }

  /// =========================
  /// PRIVATE METHODS
  /// =========================
  static int _intFromString(
      final String? data, {
        final int defaultValue = 0,
      }) {
    return data.isNotNullAndEmpty()
        ? (int.tryParse(data!) ??
        double.tryParse(data)?.toInt() ??
        defaultValue)
        : defaultValue;
  }

  static double _doubleFromString(
      final String? data, {
        final double defaultValue = 0.0,
      }) {
    return data.isNotNullAndEmpty()
        ? (double.tryParse(data!) ??
        int.tryParse(data)?.toDouble() ??
        defaultValue)
        : defaultValue;
  }

  /// =========================
  /// CHECK VALUES
  /// =========================
  static bool containValues(
      final dynamic data,
      ) {
    if (data == null) return false;

    if (data is String) return data.isNotEmpty;

    if (data is List) return data.isNotEmpty;

    if (data is Map) return data.isNotEmpty;

    if (data is int || data is double || data is bool) {
      return true;
    }

    return false;
  }
}

/// =================================================
/// EXTENSION METHODS
/// =================================================
extension ParsingExtension on dynamic {
  int intFrom({
    final int defaultValue = 0,
  }) {
    return Parsing.intFrom(
      this,
      defaultValue: defaultValue,
    );
  }

  double doubleFrom({
    final double defaultValue = 0.0,
  }) {
    return Parsing.doubleFrom(
      this,
      defaultValue: defaultValue,
    );
  }

  String stringFrom({
    final String defaultValue = '',
  }) {
    return Parsing.stringFrom(
      this,
      defaultValue: defaultValue,
    );
  }

  bool boolFrom({
    final bool defaultValue = false,
  }) {
    return Parsing.boolFrom(
      this,
      defaultValue: defaultValue,
    );
  }

  List<dynamic>? arrayFrom({
    final bool makeNull = false,
  }) {
    return Parsing.arrayFrom(
      this,
      makeNull: makeNull,
    );
  }

  Map<String, dynamic>? mapFrom({
    final bool makeNull = false,
  }) {
    return Parsing.mapFrom(
      this,
      makeNull: makeNull,
    );
  }

  bool containValues() {
    return Parsing.containValues(this);
  }
}
