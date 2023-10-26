// // ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable

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
//           sharedPreferences.setInt('pathologyLength', newPathologyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your pathology Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               11,
//               'Pathology Bill',
//               'New data are added please check your Pathology Bill',
//               'navigate_to_Pathology_bill');
//         }

//         if (newPharmacyLength > PharmacyLangth) {
//           sharedPreferences.setInt('PharmacyLangth', newPharmacyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Pharmacy Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               12,
//               'Pharmacy Bill',
//               'New data are added please check your Pharmacy Bill',
//               'navigate_to_Pharmacy_bill');
//         }

//         if (newradiologyLength > radiologyLength) {
//           sharedPreferences.setInt('radiologyLength', newradiologyLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Radiology Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               12,
//               'Radiology Bill',
//               'New data are added please check your Radiology Bill',
//               'navigate_to_Radiology_bill');
//         }

//         if (newdirectLangth > directLangth) {
//           sharedPreferences.setInt('directLangth', newdirectLangth);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications.add('New data are added please check your Direct Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               12,
//               'Direct Bill',
//               'New data are added please check your Direct Bill',
//               'navigate_to_direct_bill');
//         }

//         if (newblood_bankLength > blood_bankLength) {
//           sharedPreferences.setInt('blood_bankLength', newblood_bankLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Blood_bank Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               12,
//               'Blood_bank Bill',
//               'New data are added please check your Blood_bank Bill',
//               'navigate_to_Blood_bank_bill');
//         }

//         if (newambulanceLength > ambulanceLength) {
//           sharedPreferences.setInt('ambulanceLength', newambulanceLength);
//           final notifications =
//               sharedPreferences.getStringList('notifications') ?? [];
//           notifications
//               .add('New data are added please check your Ambulance Bill');
//           sharedPreferences.setStringList('notifications', notifications);

//           notificationServies.showNotification(
//               12,
//               'Ambulance Bill',
//               'New data are added please check your Ambulance Bill',
//               'navigate_to_Ambulance Bill');
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
