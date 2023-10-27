import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('1', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}




//   FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

      

//   // Notification
//   AndroidInitializationSettings androidSettings =
//       const AndroidInitializationSettings("ic_launcher");
//   DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestCriticalPermission: true,
//       requestSoundPermission: true);

//   void initialNotification() async {
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );

//     bool? initialized = await notificationsPlugin.initialize(
//       initializationSettings,
//     );
//     log("Notification: $initialized");
//   }

//   // show notification
//   void showNotification(
//       int id, String title, String message, String payload) async {
//     AndroidNotificationDetails androidDetiles =
//         const AndroidNotificationDetails(
//       'Notification',
//       'Tez health Care',
//       priority: Priority.high,
//       importance: Importance.high,
//     );

//     DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetiles,
//       iOS: iosDetiles,
//     );


//     await notificationsPlugin.show(id, title, message, notificationDetails,
//         payload: payload);
//   }

  
// }


