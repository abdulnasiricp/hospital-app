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

      void initialNotification()async{
         InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,

  );

   bool? initialized =
      await notificationsPlugin.initialize(initializationSettings,);
  log("Notification: $initialized");




      }
        // show notification
  void showNotification() async {
    AndroidNotificationDetails androidDetiles =
        const AndroidNotificationDetails(
      'Notification',
      'Tez health Care',
      priority: Priority.max,
      importance: Importance.max,
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

     // Define the payload when creating the notification
  const String payload = 'your_payload_here';

    await notificationsPlugin.show(
        1000, 'New Data', 'New data are added', notificationDetails,payload:  payload);
  }


 

 
 
  // Workmanager().initialize(callbackDispatcher);
  // Workmanager().registerPeriodicTask(
  //   "1000", // Task ID
  //   "checkForUpdatesTask", // Task name
  //   initialDelay: const Duration(minutes: 1), // Delay before the first execution
  //   frequency: const Duration(minutes: 15), // Periodic check every 15 minutes
  // );

  
}