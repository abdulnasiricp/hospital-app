// ignore_for_file: file_names
// import 'package:TezHealthCare/bottomscreen/home/informationprofile.dart';
// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import your API service

// class UserProfileScreen extends StatefulWidget {
//   final String patientId;

//   UserProfileScreen({required this.patientId});

//   @override
//   _UserProfileScreenState createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   final ApiService apiService = ApiService();
//   Map<String, dynamic>? userData;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final user = await apiService.getUserData(widget.patientId);
//       setState(() {
//         userData = user;
//       });
//     } catch (e) {
//       // Handle error
//       print('Error fetching user data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: userData == null
//           ? Center(child: CircularProgressIndicator())
//           : InformationProfile(userData: {},),
//     );
//   }
// }
