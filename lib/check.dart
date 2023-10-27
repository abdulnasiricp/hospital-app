// // // ignore_for_file: sized_box_for_whitespace

// // import 'package:TezHealthCare/utils/colors.dart';
// // import 'package:TezHealthCare/utils/mediaqury.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:lottie/lottie.dart';

// // class PaymentSuccessfullScreen extends StatelessWidget {
// //   const PaymentSuccessfullScreen({
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(centerTitle: true,backgroundColor: darkYellow),
// //       body: Container(
// //         // height: height / 1.6,
// //         child: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.all(10.0),
// //             child: Column(
// //               children: [
// //                 const Padding(
// //                   padding: EdgeInsets.all(15.0),
// //                   child: Center(
// //                       child: Text(
// //                     'Payment Successfull!',
// //                     style: TextStyle(
// //                         fontSize: 20,
// //                         color: Colors.green,
// //                         fontWeight: FontWeight.bold),
// //                   )),
// //                 ),
// //                 Container(
// //                     width: width / 3,
// //                     height: height / 7,
// //                     child: Lottie.asset('assets/done.json')),
// //                 Column(
// //                   children: [
// //                     const Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Padding(
// //                           padding: EdgeInsets.all(10.0),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text('Payment Mode',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
                              
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Transaction id',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Pathology Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Radiology Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Direct Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Pharmacy Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Ambulance Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('Blood Bank Dues',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                             ],
// //                           ),
// //                         ),
// //                         Padding(
// //                           padding: EdgeInsets.all(10.0),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text('Net Banking',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
                             
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text('12123434',
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                             ],
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Pathology Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text('22',
// //                     //               // "${widget.path_Amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Radiology Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.only(
// //                     //           right: 20, top: 10, left: 10, bottom: 10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text('200',
// //                     //               // "${widget.radio_Amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Direct Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.only(
// //                     //           right: 20, top: 10, left: 10, bottom: 10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text('',
// //                     //               // "${widget.direct_amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Pharmacy Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.only(
// //                     //           right: 20, top: 10, left: 10, bottom: 10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text('',
// //                     //               // "${widget.phrma_Amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Ambulance Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.only(
// //                     //           right: 20, top: 10, left: 10, bottom: 10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text('',
// //                     //               // "${widget.ambulance_Amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     // const Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //   children: [
// //                     //     Padding(
// //                     //       padding: EdgeInsets.all(10.0),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text(
// //                     //             'Blood Bank Dues',
// //                     //             style: TextStyle(fontWeight: FontWeight.bold),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //     Padding(
// //                     //       padding: EdgeInsets.only(
// //                     //           right: 20, top: 10, left: 10, bottom: 10),
// //                     //       child: Column(
// //                     //         crossAxisAlignment: CrossAxisAlignment.start,
// //                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     //         children: [
// //                     //           Text("",
// //                     //               // "${widget.blood_Amount}",
// //                     //               style: TextStyle(fontWeight: FontWeight.bold)),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     const Padding(
// //                       padding: EdgeInsets.only(
// //                         right: 20,
// //                         left: 10,
// //                       ),
// //                       child: Divider(
// //                         color: Colors.black54,
// //                       ),
// //                     ),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 10.0),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Text(
// //                                 'totalhospitalDueAmount'.tr,
// //                                 style: const TextStyle(
// //                                     fontWeight: FontWeight.bold),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         const Padding(
// //                           padding:
// //                               EdgeInsets.only(right: 20, left: 10, bottom: 10),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Text('',
// //                                   // "${widget.totalAmountInRs}",
// //                                   style:
// //                                       TextStyle(fontWeight: FontWeight.bold)),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     )
// //                   ],
// //                 ),
// //                 const SizedBox(
// //                   height: 30,
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Container(
// //                           width: width / 4,
// //                           child: ElevatedButton(
// //                             onPressed: () {},
// //                             child: const Text('Save'),
// //                             style: ButtonStyle(
// //                               backgroundColor:
// //                                   MaterialStateProperty.all(darkYellow),
// //                             ),
// //                           )),
// //                       const SizedBox(
// //                         width: 20,
// //                       ),
// //                       Container(
// //                           width: width / 4,
// //                           child: ElevatedButton(
// //                               onPressed: () {
// //                                 Get.back();
// //                               },
// //                               child: const Text('Close'),
// //                               style: ButtonStyle(
// //                                 backgroundColor:
// //                                     MaterialStateProperty.all(darkYellow),
// //                               ))),
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }












// // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Pathology Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text('22',
//                   //               // "${widget.path_Amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Radiology Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.only(
//                   //           right: 20, top: 10, left: 10, bottom: 10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text('200',
//                   //               // "${widget.radio_Amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Direct Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.only(
//                   //           right: 20, top: 10, left: 10, bottom: 10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text('',
//                   //               // "${widget.direct_amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Pharmacy Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.only(
//                   //           right: 20, top: 10, left: 10, bottom: 10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text('',
//                   //               // "${widget.phrma_Amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Ambulance Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.only(
//                   //           right: 20, top: 10, left: 10, bottom: 10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text('',
//                   //               // "${widget.ambulance_Amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Padding(
//                   //       padding: EdgeInsets.all(10.0),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text(
//                   //             'Blood Bank Dues',
//                   //             style: TextStyle(fontWeight: FontWeight.bold),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: EdgeInsets.only(
//                   //           right: 20, top: 10, left: 10, bottom: 10),
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Text("",
//                   //               // "${widget.blood_Amount}",
//                   //               style: TextStyle(fontWeight: FontWeight.bold)),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),



//                   // ignore_for_file: prefer_collection_literals

// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Ambulance/Ambulance.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Blood_Bank/Blood_Bank.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Directbill/Direct_bill.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacy.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Radiology.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Notif extends StatefulWidget {
//   final String payload;
//   const Notif({Key? key, required this.payload,}) : super(key: key);

//   @override
//   _NotifState createState() => _NotifState();
// }

// class _NotifState extends State<Notif> {
//   List<NotificationItem> notifications = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadNotifications();
//   }

//   Future<void> _loadNotifications() async {
//     final prefs = await SharedPreferences.getInstance();
//     final storedNotifications = prefs.getStringList('notifications') ?? [];
//     final newNotifications = storedNotifications.map((text) {
//       return NotificationItem(text: text, isRead: prefs.getBool(text) ?? false);
//     }).toList();

//     setState(() {
//       notifications = newNotifications.reversed.toList(); // Reverse the order
//     });
//   }

//   // Method to mark a notification as read and persist the `isRead` state in SharedPreferences
//   void markNotificationAsRead(NotificationItem item) async{
//     item.isRead = true;

//     // Save the updated notification to SharedPreferences
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool(item.text, item.isRead);
//   }

//   // Function to navigate to the desired screen based on the notification text
//   void _navigateToScreen(NotificationItem item) async {
//     if (!item.isRead) {
//       markNotificationAsRead(item);
//     }

//     // Navigate to the desired screen
//     if (item.text == 'New data are added please check your Direct Bill') {
//       Get.to(() => const Direct_bill());
//     } else if (item.text == 'New data are added please check your Radiology Bill') {
//       Get.to(() => const Radiology());
//     } else if (item.text == 'New data are added please check your Pharmacy Bill') {
//       Get.to(() => const Pharmacy());
//     } else if (item.text == 'New data are added please check your pathology Bill') {
//       Get.to(() => const Pathalogy());
//     } else if (item.text == 'New data are added please check your Ambulance Bill') {
//       Get.to(() => const Ambulance());
//     } else if (item.text == 'New data are added please check your Blood_bank Bill') {
//       Get.to(() => const Blood_Bank());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue[50],
//       appBar: AppBar(
//         title: Text('Notification'"(${notifications.where((item) => !item.isRead).length.toString()}" 'Unread)',),
//         centerTitle: true,
//         backgroundColor: darkYellow,
         
//       ),
//          body: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           final item = notifications[index];

//           return Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10),
//             child: Card(
//               child: ListTile(
//                 onTap: () {
//                   _navigateToScreen(item);
                  
//                   setState(() {}); // Force the widget to rebuild for UI update
//                 },
//                 title: Column(
//                   children: [
//                     Text(
//                       item.text,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: item.isRead?Colors.grey:Colors.black
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class NotificationItem {
//   final String text;
//  bool isRead;

//   NotificationItem({required this.text,this.isRead = true, });
// }
