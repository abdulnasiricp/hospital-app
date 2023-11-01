// //   // ignore_for_file: prefer_collection_literals

// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Ambulance/Ambulance.dart';
// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Blood_Bank/Blood_Bank.dart';
// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Directbill/Direct_bill.dart';
// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacy.dart';
// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Radiology.dart';
// // import 'package:TezHealthCare/utils/colors.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class Notif extends StatefulWidget {
// //   final String payload;
// //   const Notif({Key? key, required this.payload,}) : super(key: key);

// //   @override
// //   _NotifState createState() => _NotifState();
// // }

// // class _NotifState extends State<Notif> {
// //   List<NotificationItem> notifications = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadNotifications();
// //   }

// //  Future<void> _loadNotifications() async {
// //   final prefs = await SharedPreferences.getInstance();
// //   final storedNotifications = prefs.getStringList('notifications') ?? [];
// //   final newNotifications = storedNotifications.map((text) {
// //     final key = 'notification_${text.hashCode}';
// //     return NotificationItem(text: text, isRead: prefs.getBool(key) ?? false);
// //   }).toList();

// //   setState(() {
// //     notifications = newNotifications.reversed.toList(); // Reverse the order
// //   });
// // }


// // void markNotificationAsRead(NotificationItem item) async {
// //   if (item.isRead) return; // Do nothing if the notification is already marked as read

// //   item.isRead = true; // Update the isRead status in the list

// //   // Use the unique key to save the updated notification to SharedPreferences
// //   final prefs = await SharedPreferences.getInstance();
// //   prefs.setBool('notification_${item.text.hashCode}', true);
// // }



// //   // Function to navigate to the desired screen based on the notification text
// //   void _navigateToScreen(NotificationItem item) async {
// //     if (!item.isRead) {
// //       markNotificationAsRead(item);
// //     }

// //     // Navigate to the desired screen
// //     if (item.text == 'New data are added please check your Direct Bill') {
// //       Get.to(() => const Direct_bill());
// //     } else if (item.text == 'New data are added please check your Radiology Bill') {
// //       Get.to(() => const Radiology());
// //     } else if (item.text == 'New data are added please check your Pharmacy Bill') {
// //       Get.to(() => const Pharmacy());
// //     } else if (item.text == 'New data are added please check your pathology Bill') {
// //       Get.to(() => const Pathalogy());
// //     } else if (item.text == 'New data are added please check your Ambulance Bill') {
// //       Get.to(() => const Ambulance());
// //     } else if (item.text == 'New data are added please check your Blood_bank Bill') {
// //       Get.to(() => const Blood_Bank());
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.lightBlue[50],
// //       appBar: AppBar(
// //         title: Text('Notification'"(${notifications.where((item) => !item.isRead).length.toString()}" 'Unread)',),
// //         centerTitle: true,
// //         backgroundColor: darkYellow,
         
// //       ),
// //          body: ListView.builder(
// //         itemCount: notifications.length,
// //         itemBuilder: (context, index) {
// //           final item = notifications[index];

// //           return Padding(
// //             padding: const EdgeInsets.only(left: 10.0, right: 10),
// //             child: Card(
// //               child: ListTile(
// //                 onTap: () {
// //                   _navigateToScreen(item);
                  
// //                   setState(() {}); // Force the widget to rebuild for UI update
// //                 },
// //                 title: Column(
// //                   children: [
// //                     Text(
// //                       item.text,
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         color: item.isRead?Colors.grey:Colors.black
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 // subtitle: Text('click to navigate'),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class NotificationItem {
// //   final String text;
// //  bool isRead;

// //   NotificationItem({required this.text,this.isRead = false, });
// // }
// // // 






// // get Due amount
//   late int pathologyLength = 0;
//   late int radiologyLength = 0;
//   late int PharmacyLangth = 0;
//   late int directLangth = 0;
//   late int ambulanceLength = 0;
//   late int blood_bankLength = 0;

//   Future<void> notificationListLength() async {
//     // Set the headers
//     final headers = {
//       'Soft-service': 'TezHealthCare',
//       'Auth-key': 'zbuks_ram859553467',
//     };

//     // Set the body
//     final body = {
//       'patient_id': Patient_id,
//     };
//     try {
//       // Make the POST request
//       final response = await http.post(
//         Uri.parse(
//             'https://uat.tez.hospital/xzy/webservice/getNotificationlistcount'),
//         headers: headers,
//         body: jsonEncode(body),
//       );

//       // Check if the response was successful
//       if (response.statusCode == 200) {
//         // Decode the JSON response
//         final data = jsonDecode(response.body);
//         SharedPreferences sharedPreferences =
//             await SharedPreferences.getInstance();

//         // Get the total_dues and patho_dues values
//         pathologyLength = sharedPreferences.getInt('pathologyLength') ?? 0;
//         directLangth = sharedPreferences.getInt('directLangth') ?? 0;
//         ambulanceLength = sharedPreferences.getInt('ambulanceLength') ?? 0;
//         PharmacyLangth = sharedPreferences.getInt('PharmacyLangth') ?? 0;
//         blood_bankLength = sharedPreferences.getInt('blood_bankLength') ?? 0;
//         radiologyLength = sharedPreferences.getInt('radiologyLength') ?? 0;

//         int newPathologyLength = data['pathology']['length'];
//         int newPharmacyLength = data['pharmacy']['length'];
//         int newdirectLangth = data['direct']['length'];
//         int newambulanceLength = data['ambulance']['length'];
//         int newblood_bankLength = data['blood_bank']['length'];
//         int newradiologyLength = data['radiology']['length'];

//         if (newPathologyLength > pathologyLength) {
//           sharedPreferences.setInt('pathologyLength', newPathologyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your pathology Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Pathology Bill',
//               body: 'New data are added please check your Pathology Bill',
//               payLoad: 'navigate_to_Pathology_bill');
//         }
       
//         if (newPharmacyLength > PharmacyLangth) {
//           sharedPreferences.setInt('PharmacyLangth', newPharmacyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Pharmacy Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Pharmacy Bill',
//               body: 'New data are added please check your Pharmacy Bill',
//               payLoad: 'navigate_to_Pharmacy_bill');
//         }

//         if (newradiologyLength > radiologyLength) {
//           sharedPreferences.setInt('radiologyLength', newradiologyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Radiology Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Radiology Bill',
//               body: 'New data are added please check your Radiology Bill',
//               payLoad: 'navigate_to_Radiology_bill');
//         }

//         if (newdirectLangth > directLangth) {
//           sharedPreferences.setInt('directLangth', newdirectLangth);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications.add('New data are added please check your Direct Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Direct Bill',
//               body: 'New data are added please check your Direct Bill',
//               payLoad: 'navigate_to_direct_bill');
//         }

//         if (newblood_bankLength > blood_bankLength) {
//           sharedPreferences.setInt('blood_bankLength', newblood_bankLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Blood_bank Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Blood_bank Bill',
//               body: 'New data are added please check your Blood_bank Bill',
//               payLoad: 'navigate_to_Blood_bank_bill');
//         }

//         if (newambulanceLength > ambulanceLength) {
//           sharedPreferences.setInt('ambulanceLength', newambulanceLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Ambulance Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           NotificationService().showNotification(
//               id: 1,
//               title: 'Ambulance Bill',
//               body: 'New data are added please check your Ambulance Bill',
//               payLoad: 'navigate_to_Ambulance Bill');
//         }

//         // Set the state to rebuild the widget
//         setState(() {});
//       } else {
//         // Handle the error
//       }
//     } catch (error) {
//       print(error);
//     }
//   // }