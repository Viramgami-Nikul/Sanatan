import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/utils/flavors.dart';

/// Firebase Background Handler
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
    final RemoteMessage message,
    ) async {
  debugPrint(
    'Handling Firebase Background Message: ${message.messageId}',
  );

  debugPrint('Title : ${message.notification?.title}');
  debugPrint('Body : ${message.notification?.body}');
}

/// Local Notification Background Handler
@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(
    final NotificationResponse details,
    ) {
  final String? payload = details.payload;

  if (payload != null && payload.isNotEmpty) {
    debugPrint(
      'Background Notification Payload : $payload',
    );

    final Map<String, dynamic> messagePayload =
    json.decode(payload);

    NotificationService.handleNotificationRedirection(
      payload: messagePayload,
    );
  }
}

class NotificationService {
  static NotificationService shared =
  NotificationService();

  final SharedPreferenceHelper sharedPref =
  SharedPreferenceHelper();

  late AndroidNotificationChannel androidChannel;

  final FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // ---------------------------------------------------------------------------
  // INIT NOTIFICATION
  // ---------------------------------------------------------------------------

  Future<void> initNotification() async {
    try {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      /// Background Message Handler
      FirebaseMessaging.onBackgroundMessage(
        firebaseMessagingBackgroundHandler,
      );

      /// iOS Permission
      await apnsPermission();

      /// Get Token
      getFCMToken();

      /// Enable iOS Foreground Notification
      await enableIOSNotifications();

      /// Android Channel
      androidChannel = androidNotificationChannel();

      /// Register Listeners
      await registerNotificationListeners();
    } catch (e) {
      debugPrint('Notification initialization error : $e');
    }
  }

  // ---------------------------------------------------------------------------
  // FCM TOKEN
  // ---------------------------------------------------------------------------

  void getFCMToken() {
    FirebaseMessaging.instance.onTokenRefresh.listen((
        final String newToken,
        ) {
      debugPrint('New FCM Token : $newToken');

      if (sharedPref.fcmToken != newToken) {
        sharedPref.saveFcmToken(newToken);
      }
      saveFcmTokenForCurrentUser(newToken);
    });

    FirebaseMessaging.instance.getToken().then((
        final String? value,
        ) {
      debugPrint('FCM Token : $value');

      if (sharedPref.fcmToken != (value ?? '')) {
        sharedPref.saveFcmToken(value ?? '');
      }
      if (value != null && value.isNotEmpty) {
        saveFcmTokenForCurrentUser(value);
      }
    }).catchError((final Object e) {
      debugPrint('FCM Token Error : $e');
    });
  }

  Future<void> saveFcmTokenForCurrentUser(final String token) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null || Firebase.apps.isEmpty || token.isEmpty) {
        return;
      }

      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firestore.collection('users').doc(user.uid).get();
      final Map<String, dynamic> userData =
          userDoc.data() ?? <String, dynamic>{};
      final String phone =
          userData['mobile_number']?.toString() ?? user.phoneNumber ?? '';
      final String sanitizedPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');

      await firestore.collection('users').doc(user.uid).set(
        <String, dynamic>{
          'fcm_token': token,
          'updated_at': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );

      if (sanitizedPhone.isNotEmpty) {
        final FirebaseDatabase database = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://emergency-sos-e8284-default-rtdb.firebaseio.com/',
        );
        await database.ref('phone_users/$sanitizedPhone').update(
          <String, dynamic>{
            'uid': user.uid,
            'name': userData['full_name']?.toString() ??
                user.displayName ??
                'Emergency Contact',
            'phone': phone,
            'fcm_token': token,
            'updated_at': ServerValue.timestamp,
          },
        );
      }
    } catch (e) {
      debugPrint('Save FCM token error : $e');
    }
  }

  // ---------------------------------------------------------------------------
  // LOCAL NOTIFICATION
  // ---------------------------------------------------------------------------

  Future<void> registerLocalNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
    >()
        ?.createNotificationChannel(
      androidChannel,
    );

    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const DarwinInitializationSettings iosSettings =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings =
    InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,

      /// Foreground Notification Click
      onDidReceiveNotificationResponse: (
          final NotificationResponse details,
          ) {
        final String? payload = details.payload;

        if (payload != null && payload.isNotEmpty) {
          final Map<String, dynamic> messagePayload =
          json.decode(payload);

          debugPrint(
            'Foreground Notification Payload : $messagePayload',
          );

          handleNotificationRedirection(
            payload: messagePayload,
          );
        }
      },

      /// Background Notification Click
      onDidReceiveBackgroundNotificationResponse:
      onDidReceiveBackgroundNotificationResponse,
    );
  }

  // ---------------------------------------------------------------------------
  // REGISTER LISTENERS
  // ---------------------------------------------------------------------------

  Future<void> registerNotificationListeners() async {
    await registerLocalNotification();

    /// Foreground Message
    FirebaseMessaging.onMessage.listen((
        final RemoteMessage message,
        ) async {
      debugPrint(
        'Foreground Message Data : ${message.data}',
      );

      debugPrint(
        'Title : ${message.notification?.title}',
      );

      debugPrint(
        'Body : ${message.notification?.body}',
      );

      await displayNotification(message);
    });

    /// App Open From Notification
    FirebaseMessaging.onMessageOpenedApp.listen((
        final RemoteMessage message,
        ) async {
      debugPrint(
        'Notification Opened App : ${message.data}',
      );

      handleNotificationRedirection(
        payload: message.data,
      );
    });
  }

  // ---------------------------------------------------------------------------
  // DISPLAY NOTIFICATION
  // ---------------------------------------------------------------------------

  Future<void> displayNotification(
      final RemoteMessage message,
      ) async {
    if (message.notification != null) {
      await flutterLocalNotificationsPlugin.show(
        message.notification.hashCode,

        message.notification?.title ??
            FlavorConfig.title,

        message.notification?.body,

        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            channelDescription:
            androidChannel.description,
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),

          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),

        payload: jsonEncode(message.data),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // IOS NOTIFICATION
  // ---------------------------------------------------------------------------

  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // ---------------------------------------------------------------------------
  // APNS PERMISSION
  // ---------------------------------------------------------------------------

  static Future<void> apnsPermission() async {
    try {
      final NotificationSettings settings =
      await FirebaseMessaging.instance
          .requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      debugPrint(
        'Notification Permission : ${settings.authorizationStatus}',
      );
    } catch (e) {
      debugPrint(
        'APNS Permission Error : $e',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // ANDROID CHANNEL
  // ---------------------------------------------------------------------------

  AndroidNotificationChannel
  androidNotificationChannel() {
    return const AndroidNotificationChannel(
      'flutter_base_notification_channel',
      'High Importance Notifications',
      description:
      'This channel is used for important notifications.',
      importance: Importance.max,
    );
  }

  // ---------------------------------------------------------------------------
  // NOTIFICATION REDIRECTION
  // ---------------------------------------------------------------------------

  static void handleNotificationRedirection({
    required final Map<String, dynamic> payload,
  }) {
    debugPrint(
      'Notification Redirection Payload : $payload',
    );

    /// TODO : Add Navigation Logic
  }
}
