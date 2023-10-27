// ignore_for_file: avoid_print

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Physiotherapy/Physiotherapy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Patient_home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/HomeTransaction_bill.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//
//
//     return Future.value(true);
//   });
// }

void showLocalNotificationWithPayload(String payload) {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'Notification',
    'Tez Health Care',
    priority: Priority.max,
    importance: Importance.max,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  if (payload == 'navigate_to_home_transaction_bill') {
    // Use the Get package to navigate to the HomeTransactionBill screen
    Get.to(() => HomeTransactionBill(
          payload: payload,
        ));
  } else if (payload == 'navigate_to_pathology_bill') {
    Get.to(() => const Pathalogy());
  } else if (payload == 'DueAmount') {
    Get.to(() => PatientHomePage(
          payload: payload,
        ));
  } else if (payload == 'navigate_to_physiotherapy') {
    Get.to(() => Physiotherapy(
          payload: payload,
        ));
  } else {
    // Handle other types of notifications or actions here
    print('error');
  }

  flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'New Data',
    'New data are added',
    notificationDetails,
    payload: payload,
  );
}
