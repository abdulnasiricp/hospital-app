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




//                   // ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable

// import 'dart:async';
// import 'dart:convert';

// import 'package:TezHealthCare/Services/notificationServies.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class NotificationCount extends StatefulWidget {
//   const NotificationCount({Key? key}) : super(key: key);

//   @override
//   State<NotificationCount> createState() => _NotificationCountState();
// }

// class _NotificationCountState extends State<NotificationCount> {
//   NotificationServies notificationServies = NotificationServies();

//   getdata() async {
//     await LoadData();

//     await notificationListLength();
//   }

//   @override
//   void initState() {
//     // Create a timer to check for an increase in the data length every 30 seconds.
//     Timer timer = Timer.periodic(const Duration(minutes: 1), (_) async {
//       await getdata();
//       print('=============> 0 data call');
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     Timer;
//     super.dispose();
//   }
//   ///////////////////////////////////////////////////////////////////
//   //get Shared preferance data

//   String patientId = '';

//   LoadData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       patientId = sharedPreferences.getString('patientidrecord') ?? '';
//     });
//     print("=========== $patientId");
//   }

//   ///////////////////////////////////////////////////////////////////
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
//       'patient_id': patientId,
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
//           print('=============> 1 data increases');

//           notificationServies.showNotification(
//               112,
//               'Pathology Length Increased',
//               'New length: $newPathologyLength',
//               '');
//           sharedPreferences.setInt('pathologyLength', newPathologyLength);
//         }

//           if (newPharmacyLength > PharmacyLangth){
//           print('=============> 1 data increases');

//           notificationServies.showNotification(111, 'Pharmacy Length Increased',
//               'New length: $newPharmacyLength', '');
//           PharmacyLangth = newPharmacyLength;
//         }

//         // Set the state to rebuild the widget
//         setState(() {});
//       } else {
//         // Handle the error
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(""),
//       ),
//       body: Column(
//         children: [
//           Text('$PharmacyLangth'),
//           Text('$pathologyLength'),
//           Text('$PharmacyLangth'),
//           Text('$directLangth'),
//           Text('$PharmacyLangth'),
//           Text('$PharmacyLangth'),
//         ],
//       ),
//     );
//   }
// }
