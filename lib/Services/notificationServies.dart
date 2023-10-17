// ignore_for_file: file_names

import 'dart:developer';

// import 'package:TezHealthCare/Services/notification_worker.dart';
import 'package:TezHealthCare/Services/notification_worker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

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
  void showNotification(int id,String message,String payload) async {
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
  // const String payload = 'navigate_to_home_transaction_bill';

    await notificationsPlugin.show(
        id, 'New Data', message, notificationDetails,payload:  payload);
  }


  // Workmanager initialization and registration
  void initializeWorkManager() {
    Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask(
      "100", // Task ID (should be unique)
      "checkForNewDataTask", // Task name
      // initialDelay: const Duration(minutes: 1), // Delay before the first execution
      frequency: const Duration(minutes: 15), // Periodic check every 15 minutes
      inputData: <String, dynamic>{'payload': 'navigate_to_home_transaction_bill'},
    );
  }

 
 
  
}