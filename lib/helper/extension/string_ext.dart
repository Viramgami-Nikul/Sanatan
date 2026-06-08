import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:santvani_app/helper/regex_helper.dart';

extension StringExt on String? {
  /// Check String is not null and not empty
  bool isNotNullAndEmpty() {
    if (this == null) {
      return false;
    }
    return this!.trim().isNotEmpty;
  }

  /// Count words
  int countWord() {
    if (this == null) {
      return 0;
    }

    final Iterable<RegExpMatch> matches =
    RegexHelper.regexCountWord.allMatches(this ?? '');

    return matches.length;
  }

  /// HH:mm:ss
  DateTime formatHHMMSS() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat = DateFormat('HH:mm:ss');

    return dateFormat.parse(this!);
  }

  /// MM/dd/yyyy
  DateTime formatMMDDYYYY() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat = DateFormat('MM/dd/yyyy');

    return dateFormat.parse(this!);
  }

  /// dd/MM/yyyy
  DateTime formatDDMMYYYY() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    return dateFormat.parse(this!);
  }

  /// yyyy-MM-dd
  DateTime formatYYYYMMDD() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    return dateFormat.parse(this!);
  }

  /// dd MMM, yyyy
  DateTime formatDDMMMYYYY() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat = DateFormat('dd MMM, yyyy');

    return dateFormat.parse(this!);
  }

  /// dd/MM/yyyy hh:mm:ss
  DateTime formatDDMMYYYYhhmmss() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    }

    final DateFormat dateFormat =
    DateFormat('dd/MM/yyyy hh:mm:ss');

    return dateFormat.parse(this!);
  }

  /// Remove last character
  String removeLastCharacter() {
    if (this == null || this!.isEmpty) {
      return '';
    }

    return this!.substring(0, this!.length - 1);
  }

  /// Check numeric value
  bool isNumeric() {
    if (this == null) {
      return false;
    }

    return this!.isNotEmpty &&
        double.tryParse(this!) != null;
  }

  /// Check network image/url
  bool isNetworkUrl() {
    if (this == null) {
      return false;
    }

    return this!.startsWith('http://') ||
        this!.startsWith('https://');
  }

  /// Check email
  bool isValidEmail() {
    if (this == null || this!.trim().isEmpty) {
      return false;
    }

    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(this!.trim());
  }

  /// Check phone number
  bool isValidPhone() {
    if (this == null || this!.trim().isEmpty) {
      return false;
    }

    return RegExp(
      r'^[0-9]{10}$',
    ).hasMatch(this!.trim());
  }

  /// Capitalize first letter
  String capitalizeFirst() {
    if (this == null || this!.isEmpty) {
      return '';
    }

    return '${this![0].toUpperCase()}'
        '${this!.substring(1).toLowerCase()}';
  }

  /// Capitalize every word
  String capitalize() {
    if (this == null || this!.isEmpty) {
      return '';
    }

    final List<String> str = this!.split(' ');

    return str
        .map(
          (final String e) => e.capitalizeFirst(),
    )
        .join(' ');
  }

  /// Convert String to TimeOfDay
  TimeOfDay? stringToTimeOfDay() {
    if (this == null || this!.isEmpty) {
      return null;
    }

    final List<String> format = this!.split(':');

    if (format.length < 2) {
      return null;
    }

    final int hour = int.parse(format[0]);
    final int minute = int.parse(format[1]);

    return TimeOfDay(
      hour: hour,
      minute: minute,
    );
  }

  /// Hide phone number
  String hidePhoneNumber() {
    if (this == null || this!.length < 4) {
      return '';
    }

    return '******${this!.substring(this!.length - 4)}';
  }

  /// Hide email
  String hideEmail() {
    if (this == null || !this!.contains('@')) {
      return '';
    }

    final List<String> split = this!.split('@');

    if (split[0].length <= 2) {
      return this!;
    }

    return '${split[0].substring(0, 2)}****@${split[1]}';
  }
}
