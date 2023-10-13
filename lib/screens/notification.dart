// import 'dart:developer';

// import 'package:TezHealthCare/main.dart';
// import 'package:TezHealthCare/utils/My_button.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

//   void showNotification() async {
//     AndroidNotificationDetails androidDetiles =
//         const AndroidNotificationDetails(
//       'Notification',
//       'Discounter',
//       priority: Priority.max,
//       importance: Importance.max,
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
//     await notificationsPlugin.show(0, 'pathology',
//         'New data are added', notificationDetails);
//   }

//   void secheduleNotification() async {
//     AndroidNotificationDetails androidDetiles =
//         const AndroidNotificationDetails(
//       'Notification',
//       'Tez Health Care',
//       priority: Priority.max,
//       importance: Importance.max,
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
//     await notificationsPlugin.periodicallyShow(
//       1, 
//      'Sechedule Notification',
//       'Every minute notification show',
//       RepeatInterval.everyMinute,
//        notificationDetails,
//        );
//   }

//   void stopNotification()async{
//    await notificationsPlugin.cancel(1);

//   }

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
//                 showNotification();
//                 log('click Notification start');

//               },
//             ),
//             const SizedBox(height: 10,),
//              MyButton(
//               title: const Text('periodically Notification'),
//               onPressed: () {
//                 secheduleNotification();
//                 log('periodically Notification start');

//               },
//             ),
//              const SizedBox(height: 10,),
//              MyButton(
//               title: const Text('Stop Notification'),
//               onPressed: () {
//                 stopNotification();
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
        



           // ignore_for_file: non_constant_identifier_names, unused_local_variable
           
//       ],
//     );
//   }
// }
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
   final String messages='';
    LoadData()async{
       // Fetch stored notification messages from SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    final messages = sharedPreferences.getStringList('notificationMessages') ?? [];
 
    }
     @override
  void initState() {
    super.initState();
    LoadData();
  }
    
  @override
  Widget build(BuildContext context) {
   
   

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkYellow,
        title: const Text('Notification Screen'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(messages[index]),
          );
        },
      ),
    );
  }
}
