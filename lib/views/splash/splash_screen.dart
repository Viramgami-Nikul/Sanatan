import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:santvani_app/helper/push_notification/notification_service.dart';
import 'package:santvani_app/routes/routes_name.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _openInitialRoute();
  }

  @override
  void dispose() {
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
                Color(0xFFFF5722), // Deep saffron orange
                Color(0xFFFF8F00), // Radiant amber
                Color(0xFFFFC107), // Gold glow
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(
            child: _SplashContent(),
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
        // Glowing card container for the Sanatan Logo image
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 25,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: const Color(0xFFFFD54F).withValues(alpha: 0.4),
                blurRadius: 40,
                spreadRadius: 8,
              ),
            ],
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/png/sanatan.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms, curve: Curves.easeOut)
            .scale(
              begin: const Offset(0.6, 0.6),
              end: const Offset(1.0, 1.0),
              duration: 800.ms,
              curve: Curves.easeOutBack,
            )
            .then(delay: 200.ms)
            .shimmer(
              duration: 1200.ms,
              color: Colors.white.withValues(alpha: 0.5),
            ),

        const SizedBox(height: 36),

        // Brand App Name
        const Text(
          'Santvani',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.5,
            shadows: <Shadow>[
              Shadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
        )
            .animate(delay: 500.ms)
            .fadeIn(duration: 600.ms)
            .slideY(
              begin: 0.3,
              end: 0.0,
              curve: Curves.easeOutQuad,
            ),

        const SizedBox(height: 10),

        // Subtitle / Tagline
        Text(
          'Sanatan Devotional & Bhajans',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white.withValues(alpha: 0.9),
            letterSpacing: 0.4,
            shadows: const <Shadow>[
              Shadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        )
            .animate(delay: 750.ms)
            .fadeIn(duration: 600.ms)
            .slideY(
              begin: 0.3,
              end: 0.0,
              curve: Curves.easeOutQuad,
            ),
      ],
    );
  }
}
