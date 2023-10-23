import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Physiotherapy/Physiotherapy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/HomeTransaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Patient_home.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class Notif extends StatefulWidget {
 final String payload;
 const Notif({Key? key, required this.payload}) : super(key: key);

 @override
 _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
 List<String> notifications = [];
  int _badgeCount = 0;

 @override
 void initState() {
  super.initState();
  _loadNotifications();
 }

 Future<void> _loadNotifications() async {
  final prefs = await SharedPreferences.getInstance();
  final storedNotifications = prefs.getStringList('notifications') ?? [];
  setState(() {
   notifications = storedNotifications;
   _badgeCount = notifications.length;
  });
 }

 // Function to navigate to the desired screen based on the notification text
 void _navigateToScreen(String notification) {
  if (notification == 'please check your due bill amount') {
   Get.to(() => const PatientHomePage(payload: '',));
  } else if (notification == 'New data are added in Physiotherapy, please check') {
   Get.to(() => const Physiotherapy(payload: 'navigate_to_physiotherapy',));
  } else if (notification == 'New data are added please check your transaction Bill') {
   Get.to(() => const HomeTransactionBill(payload: 'payload'));
  }else if (notification == 'New data are added please check your pathology Bill') {
   Get.to(() => const Pathalogy());
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Badge(
          child: Text(_badgeCount.toString()),
        ),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Card(
              child: ListTile(
                onTap: () {
                  _navigateToScreen(notifications[index]);
                },
                title: Column(
                  children: [
                    Text(index.toString()),
                    const SizedBox(width: 5,),
                    Text(notifications[index]),
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
