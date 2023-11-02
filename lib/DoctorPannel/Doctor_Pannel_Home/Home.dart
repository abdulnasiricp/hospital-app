import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor_Home_Page extends StatefulWidget {
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
  @override
  void initState() {
    super.initState();
    loadDoctorData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Text(
          'Welcome Mr. $username',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(welcomeMessage),
            SizedBox(height: 20),
            Text('Doctor Role: $doctorRole'),
            Text('Employee ID: $employeeId'),
            Text('ID: $id'),
            Text('Username: $username'),
            Text('Mobile: $mobile'),
            Text('Email: $email'),
            Text('Gender: $gender'),
            Text('Local Address: $localAddress'),
            Text('Permanent Address: $permanentAddress'),
            Text('Date Format: $dateFormat'),
            Text('Time Format: $timeFormat'),
            Text('Currency Symbol: $currencySymbol'),
            Text('Timezone: $timezone'),
            Text('Image: $image'),
            Text('Token: $token'),
          ],
        ),
      ),
    );
  }
}
