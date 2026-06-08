import 'dart:async';
import 'dart:ui';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:santvani_app/app/my_app.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/helper/push_notification/notification_service.dart';
import 'package:santvani_app/routes/app_providers.dart';
import 'package:santvani_app/utils/flavors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String currentFlavor = String.fromEnvironment(
  'FLAVOR',
  defaultValue: 'staging',
);

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      debugPrint('Current Flavor: $currentFlavor');

      FlavorConfig();

      await SharedPreferenceHelper().init();

      try {
        if (Firebase.apps.isEmpty) {
          await Firebase.initializeApp().timeout(const Duration(seconds: 10));
        }

        await _configureCrashlytics();

        await _syncCrashlyticsUser();
      } catch (e, stackTrace) {
        debugPrint('Firebase initialization error: $e');

        await _recordCrashlyticsError(e, stackTrace);
      }

      runApp(
        MultiRepositoryProvider(
          providers: getRepoProviders(),
          child: MultiBlocProvider(
            providers: getAppProviders(),
            child: const MyApp(),
          ),
        ),
      );

      unawaited(
        _initializeStartupServices().catchError((
          final Object e,
          final StackTrace stackTrace,
        ) {
          debugPrint('Startup service error: $e');

          unawaited(_recordCrashlyticsError(e, stackTrace));
        }),
      );
    },
    (final Object error, final StackTrace stackTrace) async {
      await _recordCrashlyticsError(error, stackTrace, fatal: true);
    },
  );
}

Future<void> _configureCrashlytics() async {
  if (Firebase.apps.isEmpty) {
    return;
  }

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = (final FlutterErrorDetails details) {
    FlutterError.presentError(details);

    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  };

  PlatformDispatcher.instance.onError =
      (final Object error, final StackTrace stackTrace) {
        unawaited(_recordCrashlyticsError(error, stackTrace, fatal: true));

        return true;
      };
}

Future<void> _recordCrashlyticsError(
  final Object error,
  final StackTrace stackTrace, {
  final bool fatal = false,
}) async {
  if (Firebase.apps.isEmpty) {
    return;
  }

  await FirebaseCrashlytics.instance.recordError(
    error,
    stackTrace,
    fatal: fatal,
  );
}

Future<void> _syncCrashlyticsUser() async {
  if (Firebase.apps.isEmpty) {
    return;
  }

  final user = SharedPreferenceHelper().user;

  if (user == null) {
    return;
  }

  await FirebaseCrashlytics.instance.setUserIdentifier(user.emailId ?? '');

  await FirebaseCrashlytics.instance.setCustomKey('user_name', user.fullName);

  await FirebaseCrashlytics.instance.setCustomKey(
    'registration_id',
    user.userRegistrationId ?? 'Not Found',
  );
}

Future<void> _initializeStartupServices() async {
  if (Firebase.apps.isEmpty) {
    return;
  }

  try {
    await FirebaseAppCheck.instance
        .activate(androidProvider: AndroidProvider.playIntegrity)
        .timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            debugPrint('App Check initialization timed out');
          },
        );

    debugPrint('App Check initialized successfully');
  } catch (e) {
    debugPrint('Error initializing App Check: $e');
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  try {
    await NotificationService.shared.initNotification().timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        debugPrint('Notification initialization timed out');
      },
    );
  } catch (e) {
    debugPrint('Notification initialization error: $e');
  }

  if (kReleaseMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
}
