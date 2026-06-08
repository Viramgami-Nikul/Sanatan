import 'package:flutter/widgets.dart';

/// =======================================================
/// Padding Extensions
/// Smart Local Service App
/// =======================================================

extension PaddingExtension on Widget {
  /// Add symmetric padding
  Widget paddingSymmetric({
    final double horizontal = 0.0,
    final double vertical = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  /// Add padding only to specific sides
  Widget paddingOnly({
    final double left = 0.0,
    final double top = 0.0,
    final double right = 0.0,
    final double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  /// Add same padding on all sides
  Widget paddingAll(final double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Horizontal padding shortcut
  Widget paddingHorizontal(final double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  /// Vertical padding shortcut
  Widget paddingVertical(final double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  /// Top padding shortcut
  Widget paddingTop(final double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  /// Bottom padding shortcut
  Widget paddingBottom(final double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  /// Left padding shortcut
  Widget paddingLeft(final double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  /// Right padding shortcut
  Widget paddingRight(final double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }
}
