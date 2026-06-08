import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:santvani_app/helper/push_notification/notification_service.dart';
import 'package:santvani_app/routes/routes_name.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _scaleAnim = Tween<double>(begin: 0.80, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutBack),
    );
    _animController.forward();
    _openInitialRoute();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _openInitialRoute() async {
    // Wait for animations + minimum splash time
    await Future<void>.delayed(const Duration(milliseconds: 1800));

    try {
      final RemoteMessage? remoteMessage =
          Firebase.apps.isEmpty
              ? null
              : await FirebaseMessaging.instance.getInitialMessage().timeout(
                    const Duration(seconds: 3),
                    onTimeout: () => null,
                  );

      if (remoteMessage != null) {
        NotificationService.handleNotificationRedirection(
          payload: remoteMessage.data,
        );
      }
    } catch (e) {
      debugPrint('Initial notification message error: $e');
    }

    if (!mounted) return;

    _navigateToInitialRoute();
  }

  void _navigateToInitialRoute() {
    Navigator.of(context).pushReplacementNamed(
      sharedPreferenceHelper.isLoggedIn
          ? RouteName.bottomNavigationScreen
          : RouteName.loginScreen,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightStatusBarTransparent,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF3A8DDD),
                Color(0xFF2672C0),
                Color(0xFF1A5FAA),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: const _SplashContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // santvani_app Circle Logo
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFB8D8F0),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 30,
                spreadRadius: 4,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'santvani_app',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E5FA8),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 36),

        // App Name
        const Text(
          'Vepar4u',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),

        const SizedBox(height: 10),

        // Subtitle
        Text(
          'Grow your distribution business',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.75),
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
