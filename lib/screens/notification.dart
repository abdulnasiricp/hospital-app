// import 'dart:developer';

// import 'package:TezHealthCare/utils/My_button.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class Notif extends StatefulWidget {
//   const Notif({Key? key}) : super(key: key);

//   @override
//   State<Notif> createState() => _NotifState();
// }

// class _NotifState extends State<Notif> {
//   late ColorNotifier notifier;

//   // void showNotification() async {
//   //   AndroidNotificationDetails androidDetiles =
//   //       const AndroidNotificationDetails(
//   //     'Notification',
//   //     'Discounter',
//   //     priority: Priority.max,
//   //     importance: Importance.max,
//   //   );

//   //   DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
//   //     presentAlert: true,
//   //     presentBadge: true,
//   //     presentSound: true,
//   //   );
//   //   NotificationDetails notificationDetails = NotificationDetails(
//   //     android: androidDetiles,
//   //     iOS: iosDetiles,
//   //   );
//   //   await notificationsPlugin.show(0, 'pathology',
//   //       'New data are added', notificationDetails);
//   // }

//   // void secheduleNotification() async {
//   //   AndroidNotificationDetails androidDetiles =
//   //       const AndroidNotificationDetails(
//   //     'Notification',
//   //     'Tez Health Care',
//   //     priority: Priority.max,
//   //     importance: Importance.max,
//   //   );

//   //   DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
//   //     presentAlert: true,
//   //     presentBadge: true,
//   //     presentSound: true,
//   //   );
//   //   NotificationDetails notificationDetails = NotificationDetails(
//   //     android: androidDetiles,
//   //     iOS: iosDetiles,
//   //   );
//   //   await notificationsPlugin.periodicallyShow(
//   //     1, 
//   //    'Sechedule Notification',
//   //     'Every minute notification show',
//   //     RepeatInterval.everyMinute,
//   //      notificationDetails,
//   //      );
//   // }

//   // void stopNotification()async{
//   //  await notificationsPlugin.cancel(1);

//   // }

//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     return ScreenUtilInit(
//       builder: (_ , child)  => Scaffold(
//         backgroundColor: notifier.getwihitecolor,
//         appBar:AppBar(title:  Text('notification'.tr),centerTitle: true,backgroundColor: darkYellow,),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [notificationcard(),
//             MyButton(
//               title: const Text('click Notification'),
//               onPressed: () {
//                 log('click Notification start');

//               },
//             ),
//             const SizedBox(height: 10,),
//              MyButton(
//               title: const Text('periodically Notification'),
//               onPressed: () {
//                 log('periodically Notification start');

//               },
//             ),
//              const SizedBox(height: 10,),
//              MyButton(
//               title: const Text('Stop Notification'),
//               onPressed: () {
//                 log('Notification stoped');
//               },
//             )],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget notificationcard() {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             SizedBox(height: height / 15),
//             Center(
//               child: Card(
//                 elevation: 1.5.sp,
//                 color: notifier.getwihitecolor,
//                 child: Container(
//                   color: Colors.transparent,
//                   height: height / 7,
//                   width: width / 1.1,
//                   child: Column(
//                     children: [
//                       SizedBox(height: height / 25),
//                       Text(
//                         'ended'.tr,
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             color: notifier.getblack,
//                             fontFamily: 'Gilroy_Bold'),
//                       ),
//                       SizedBox(height: height / 200),
//                       Text(
                        
//                           'please'.tr,
//                         style: TextStyle(
//                             fontSize: 14.5.sp,
//                             fontFamily: 'Gilroy_Medium',
//                             color: notifier.getgrey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: width / 10, top: height / 27),
//           child: Image.asset("assets/notification.png", height: height / 17),
//         ),
        



           
//       ],
//     );
//   }
// }

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Physiotherapy/Physiotherapy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/HomeTransaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Patient_home.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notif extends StatefulWidget {
  final String payload;
  const Notif({Key? key, required this.payload}) : super(key: key);

  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  List<String> notifications = [];

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
        title: const Text('Notifications'),
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
