import 'package:flutter/material.dart';

import 'package:santvani_app/app/my_app.dart';

extension NavigationHelper on BuildContext {
  /// Push screen
  Future<T?> push<T>(
      final Widget page,
      ) =>
      Navigator.of(this).push(
        MaterialPageRoute<T>(
          builder: (_) => page,
        ),
      );

  /// Push named route
  void pushNamed(
      final String routeName, {
        final Object? arguments,
      }) =>
      Navigator.of(this).pushNamed(
        routeName,
        arguments: arguments,
      );

  /// Pop screen
  void pop<T>([
    final T? result,
  ]) =>
      Navigator.of(this).pop(result);

  /// Screen width
  double get screenWidth =>
      MediaQuery.of(this).size.width;

  /// Screen height
  double get screenHeight =>
      MediaQuery.of(this).size.height;

  /// Status bar padding
  double get topPadding =>
      MediaQuery.of(this).padding.top;

  /// Bottom safe area padding
  double get bottomPadding =>
      MediaQuery.of(this).padding.bottom;
}

/// Global navigation helper
void navigateTo(
    final Widget page,
    ) {
  navigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

/// Global named navigation helper
void navigateToNamed(
    final String route, {
      final Object? arguments,
    }) {
  navigatorKey.currentState?.pushNamed(
    route,
    arguments: arguments,
  );
}

/// Global back helper
void goBack() {
  navigatorKey.currentState?.pop();
}
