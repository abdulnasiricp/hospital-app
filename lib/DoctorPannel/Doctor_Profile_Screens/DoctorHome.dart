// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Doctor_Home_Page extends StatefulWidget {
  const Doctor_Home_Page({Key? key}) : super(key: key);

  @override
  State<Doctor_Home_Page> createState() => _Doctor_Home_PageState();
}

class _Doctor_Home_PageState extends State<Doctor_Home_Page> {
  String welcomeMessage = 'Welcome to Doctor Home Page';
  String doctorRole = '';
  String employeeId = '';
  String id = '';
  String username = '';
  String mobile = '';
  String email = '';
  String gender = '';
  String localAddress = '';
  String permanentAddress = '';
  String dateFormat = '';
  String timeFormat = '';
  String currencySymbol = '';
  String timezone = '';
  String image = '';
  String token = '';

  getData() async {
    await LoadData();
    await loadDoctorData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> loadDoctorData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      doctorRole = sp.getString('Doctor') ?? '';
      employeeId = sp.getString('employee_id') ?? '';
      id = sp.getString('id') ?? '';
      username = sp.getString('username') ?? '';
      mobile = sp.getString('mobile') ?? '';
      email = sp.getString('email') ?? '';
      gender = sp.getString('gender') ?? '';
      localAddress = sp.getString('local_address') ?? '';
      permanentAddress = sp.getString('permanent_address') ?? '';
      dateFormat = sp.getString('date_format') ?? '';
      timeFormat = sp.getString('time_format') ?? '';
      currencySymbol = sp.getString('currency_symbol') ?? '';
      timezone = sp.getString('timezone') ?? '';
      image = sp.getString('image') ?? '';
      token = sp.getString('token') ?? '';
    });
  }

  bool isLoggingOut = false; // Flag to check if logout process is in progress
  late String patientID = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';

    print(patientID);
    setState(() {});
  }

  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.clear();
    Fluttertoast.showToast(
      msg: 'Logout Successfully!!!.',
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    Get.offAll(() => const MainSiginScreen());
  }

  String apiUrl = ApiLinks.logout; // Replace with your logout API URL

  Future<void> performLogout() async {
    setState(() {
      isLoggingOut = true;
    });
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
        // You may need to pass additional data in the body if required by your API.
        body: jsonEncode({"patient_id": patientID}),
      );
      if (response.statusCode == 200) {
        // Successful logout, clear user data or navigate to the login screen.
        print('Logout successful');
        _logout(context);
        Fluttertoast.showToast(
          msg: 'Logout Successfully!!!.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        // Implement your logout logic here.
        setState(() {
          isLoggingOut = false;
        });
      } else {
        // Handle errors, e.g., display an error message to the user.
        print('Logout failed: ${response.statusCode}');
        setState(() {
          isLoggingOut = false;
        });
      }
    } catch (e) {
      // Handle network errors.
      print('Network error: $e');
      setState(() {
        isLoggingOut = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text(
          'Welcome Mr. $username',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _logout;
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body:SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Aligns children to the start and end of the row
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns text to the start of the column
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    '${'welcome'.tr} $username',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .end, // Aligns text to the end of the column
                                children: [
                                  Text(
                                    '${'DoctorID'.tr} $id'.isEmpty
                                        ? "N/A"
                                        : '${'DoctorID'.tr} $id',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy_Bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                    )
                  ))
      
      
      
      
      
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Text(welcomeMessage),
      //       const SizedBox(height: 20),
      //       Text('Doctor Role: $doctorRole'),
      //       Text('Employee ID: $employeeId'),
      //       Text('ID: $id'),
      //       Text('Username: $username'),
      //       Text('Mobile: $mobile'),
      //       Text('Email: $email'),
      //       Text('Gender: $gender'),
      //       Text('Local Address: $localAddress'),
      //       Text('Permanent Address: $permanentAddress'),
      //       Text('Date Format: $dateFormat'),
      //       Text('Time Format: $timeFormat'),
      //       Text('Currency Symbol: $currencySymbol'),
      //       Text('Timezone: $timezone'),
      //       Text('Image: $image'),
      //       Text('Token: $token'),
      //     ],
      //   ),
      // ),
    );
  }
}


