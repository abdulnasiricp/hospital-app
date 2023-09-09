// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:TezHealthCare/bottomscreen/home/appoinmenttabs/upcoming.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottomscreen/home/appoinmenttabs/past.dart';

class Doctorlist extends StatefulWidget {
  final String? image;
  final Color? bordercolor;
  final String? drname;
  final String? subname;
  final String? kmr;
  final double? kmrw;

  const Doctorlist(this.image, this.bordercolor, this.drname, this.subname,
      this.kmr, this.kmrw,
      {Key? key})
      : super(key: key);

  @override
  State<Doctorlist> createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  Future<void> Doctorlist() async {
    // Perform API call to authenticate the user
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/getDoctorfron'),
      body: json.encode({
        "username": "myrama@gmail.com",
        "password": "UserChat#@089",
        "DeviceId": "dummy"
      }),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467'
      },
    );

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body.toString());
      print(json);

      // Successful login, store user credentials
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('role', json['role']);
      sharedPreferences.setString('doctors', json['doctors']['name']);
      sharedPreferences.setString('genderrecord', json['record']['gender']);
      sharedPreferences.setString(
          'patientidrecord', json['record']['patient_id']);
      sharedPreferences.setString('usernamerecord', json['record']['username']);

      // Navigate to the home screen or any other screen you need
      // Get.off(() => const Bottomhome());
    } else {
      // Handle login failure
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please try again.'),
      ));
    }
  }

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          "Doctor List",
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: height / 1.125,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.sp),
                    ),
                  ),
                  child: DefaultTabController(
                    length: 5,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          // unselectedLabelStyle:
                          //     TextStyle(color: notifier.getperple),
                          backgroundColor: notifier.getperple,
                          unselectedBackgroundColor: Colors.transparent,
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          //  borderWidth: 1,
                          //  elevation: 30,
                          radius: 10.sp,
                          tabs: [
                            Tab(
                              child: Center(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: notifier.isDark
                                          ? Colors.white
                                          : const Color(0xff2AD3E7),
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  "Endoc",
                                  style: TextStyle(
                                      color: notifier.isDark
                                          ? Colors.white
                                          : const Color(0xff2AD3E7),
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  "Surgerical",
                                  style: TextStyle(
                                      color: notifier.isDark
                                          ? Colors.white
                                          : const Color(0xff2AD3E7),
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  "Orthopotic",
                                  style: TextStyle(
                                      color: notifier.isDark
                                          ? Colors.white
                                          : const Color(0xff2AD3E7),
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  "Dentist",
                                  style: TextStyle(
                                      color: notifier.isDark
                                          ? Colors.white
                                          : const Color(0xff2AD3E7),
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Upcoming(),
                              Past(),
                              Past(),
                              Past(),
                              Past()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
