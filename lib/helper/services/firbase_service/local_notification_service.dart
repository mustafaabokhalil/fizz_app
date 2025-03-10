import 'package:fizz/app_imports.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService._();

  static final instance = LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotificationSettings() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onSelectNotification,
    );
  }

  Future<void> _onSelectNotification(NotificationResponse response) async {
    final String? payload = response.payload;
    if (payload != null) {
      debugPrint("Notification payload: $payload");
      // Handle notification tap event
    }
  }

  Future<void> showInstantNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails(),
      payload: payload,
    );
  }

  NotificationDetails _notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'local_push_notification',
        'Tia Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        color: AppColors.primaryColor,
        playSound: true,
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }
}
