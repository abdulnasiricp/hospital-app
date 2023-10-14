import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/HomeTransaction_bill.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    showLocalNotificationWithPayload(inputData?['payload']);
    return Future.value(true);
  });
}

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
    Get.to(() =>  HomeTransactionBill(payload: payload,));
  } else {
    // Handle other types of notifications or actions here
  }

  flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'New Data',
    'New data are added',
    notificationDetails,
    payload: payload,
  );
}
