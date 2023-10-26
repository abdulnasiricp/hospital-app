// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServies {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

      

  // Notification
  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings("ic_launcher");
  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);

  void initialNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    bool? initialized = await notificationsPlugin.initialize(
      initializationSettings,
    );
    log("Notification: $initialized");
  }

  // show notification
  void showNotification(
      int id, String title, String message, String payload) async {
    AndroidNotificationDetails androidDetiles =
        const AndroidNotificationDetails(
      'Notification',
      'Tez health Care',
      priority: Priority.high,
      importance: Importance.high,
    );

    DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetiles,
      iOS: iosDetiles,
    );


    await notificationsPlugin.show(id, title, message, notificationDetails,
        payload: payload);
  }

  
}


