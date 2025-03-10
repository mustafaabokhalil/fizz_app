import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fizz/app_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final instance = FirebaseMessagingService._();

  bool _isInitialized = false;
  String? fcmToken;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'firebase_push_notification',
    'Deliverzler Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
  );

  Future<void> initFirebaseMessaging() async {
    if (_isInitialized) return;

    // Request notification permissions for iOS & macOS
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false, // Ensure full permissions
    );

    debugPrint('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    // Create Android notification channel
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Set iOS foreground notification presentation options
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('FCM Message received: ${message.notification?.title}');
      _showNotification(message);
    });

    // Handle when the app is opened via notification (background state)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('App opened from notification: ${message.data}');
      // Handle navigation or actions based on message data
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _isInitialized = true;
  }

  Future<void> _showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    if (notification == null || kIsWeb) return;

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'firebase_push_notification',
      'Deliverzler Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails details = const NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
      payload: jsonEncode(message.data),
    );
  }

  Future<String?> getDeviceFCMToken() async {
    fcmToken = await firebaseMessaging.getToken();
    log('FCM Token $fcmToken');
    return fcmToken;
  }

  Future<void> deleteDeviceFCMToken() async {
    await firebaseMessaging.deleteToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling background message: ${message.messageId}');
}
