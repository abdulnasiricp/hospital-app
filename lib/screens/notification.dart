  // ignore_for_file: prefer_collection_literals

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

class Notif extends StatefulWidget {
  final String payload;
  const Notif({Key? key, required this.payload,}) : super(key: key);

  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  List<NotificationItem> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final storedNotifications = prefs.getStringList('notifications') ?? [];
    final newNotifications = storedNotifications.map((text) {
      return NotificationItem(text: text, isRead: prefs.getBool(text) ?? false);
    }).toList();

    setState(() {
      notifications = newNotifications.reversed.toList(); // Reverse the order
    });
  }

 void markNotificationAsRead(NotificationItem item) async {
  if (item.isRead) return; // Do nothing if the notification is already marked as read

  item.isRead = true; // Update the isRead status in the list

  // Save the updated notification to SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(item.text, true);
}


  // Function to navigate to the desired screen based on the notification text
  void _navigateToScreen(NotificationItem item) async {
    if (!item.isRead) {
      markNotificationAsRead(item);
    }

    // Navigate to the desired screen
    if (item.text == 'New data are added please check your Direct Bill') {
      Get.to(() => const Direct_bill());
    } else if (item.text == 'New data are added please check your Radiology Bill') {
      Get.to(() => const Radiology());
    } else if (item.text == 'New data are added please check your Pharmacy Bill') {
      Get.to(() => const Pharmacy());
    } else if (item.text == 'New data are added please check your pathology Bill') {
      Get.to(() => const Pathalogy());
    } else if (item.text == 'New data are added please check your Ambulance Bill') {
      Get.to(() => const Ambulance());
    } else if (item.text == 'New data are added please check your Blood_bank Bill') {
      Get.to(() => const Blood_Bank());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Notification'"(${notifications.where((item) => !item.isRead).length.toString()}" 'Unread)',),
        centerTitle: true,
        backgroundColor: darkYellow,
         
      ),
         body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Card(
              child: ListTile(
                onTap: () {
                  _navigateToScreen(item);
                  
                  setState(() {}); // Force the widget to rebuild for UI update
                },
                title: Column(
                  children: [
                    Text(
                      item.text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: item.isRead?Colors.grey:Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String text;
 bool isRead;

  NotificationItem({required this.text,this.isRead = false, });
}
