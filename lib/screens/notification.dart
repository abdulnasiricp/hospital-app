import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/PaymentMethod/OpdSuccessPayment.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Ambulance/Ambulance.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Blood_Bank/Blood_Bank.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Directbill/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Radiology.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the NotificationItem class
class NotificationItem {
  String message;
  DateTime timestamp;
  bool isRead;

  NotificationItem(this.message, this.timestamp, this.isRead);
}

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  List<NotificationItem> notifications = [];
  int unreadCount = 0;

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

Future<void> loadNotifications() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final List<String> notificationList = sharedPreferences.getStringList('notifications') ?? [];
  setState(() {
    notifications = notificationList.reversed.map((message) {
      final parts = message.split(": ");
      final timestamp = DateTime.parse(parts[0]);
      final isRead = sharedPreferences.getBool('isRead_${parts[1]}:${timestamp.toString()}') ?? false;
      if (!isRead) {
        unreadCount++; // Increment unread count for each unread notification
      }
      return NotificationItem(parts[1], timestamp, isRead);
    }).toList();
  });
}



void navigateToScreen(int index) async {
  NotificationItem tappedNotification = notifications[index];
  if (!tappedNotification.isRead) {
    // Mark the notification as read
    tappedNotification.isRead = true;
    unreadCount--; // Decrement unread count when marking as read

    // Update the read status in SharedPreferences
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final message = tappedNotification.message;
    final timestamp = tappedNotification.timestamp;
    final isReadKey = 'isRead_$message:${timestamp.toString()}';
    sharedPreferences.setBool(isReadKey, true);
  }

  // Navigate to the corresponding screen based on the notification message
  switch (tappedNotification.message) {
    case 'New data are added please check your Direct Bill':
      Get.to(() => const Direct_bill());
      break;
    case 'New data are added please check your Radiology Bill':
      Get.to(() => const Radiology());
      break;
    case 'New data are added please check your Pharmacy Bill':
      Get.to(() => const Pharmacy());
      break;
    case 'New data are added please check your Pathology Bill':
      Get.to(() => const Pathalogy());
      break;
    case 'New data are added please check your Ambulance Bill':
      Get.to(() => const Ambulance());
      break;
    case 'New data are added please check your Blood_bank Bill':
      Get.to(() => const Blood_Bank());
      break;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Notifications'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
        
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  notification.message,
                  style: TextStyle(
                    fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                    color: notification.isRead ? Colors.black : Colors.black,
                  ),
                ),
                subtitle: Text("Added on: ${notification.timestamp.toLocal().toString()}"),
                onTap: () {
                  // Handle the notification tap
                  navigateToScreen(index);
                },
                
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DottedLineDivider(),
              )
            ],
          );
        },
      ),
    );
  }
}
