// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Devices_credentials.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Information_profile.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Setting/Setting_screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/help_center.dart';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String role = '';
  String username = '';
  String record = '';  String image = '';
  String genderrecord = '';
  String mobilerecord = '';
  bool isLoading = true;
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      role = sharedPreferences.getString('role') ?? '';
      username = sharedPreferences.getString('usernamerecord') ?? '';
      record = sharedPreferences.getString('record') ?? '';
      genderrecord = sharedPreferences.getString('genderrecord') ?? '';
      mobilerecord = sharedPreferences.getString('mobilerecord') ?? '';
      image = sharedPreferences.getString('imagerecord') ?? '';
    });
  }

  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('username');
    sharedPreferences.remove('password');

    // Navigate to the login screen
    Get.off(() => const Splash_Screen());
  }

  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
            backgroundColor: darkYellow,
            // elevation: 0,
          ),
          backgroundColor: Colors.grey.shade300,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                      width: width,
                      height: height / 3,
                      decoration: BoxDecoration(
                          color: darkYellow,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60)))),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircleAvatar(
                          backgroundImage:
                          NetworkImage("$image"),
                          radius: 50,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 5.5),
                    child: Center(
                        child: Text(
                      '$username',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 4.7),
                    child: Center(
                        child: Text(
                         " $mobilerecord 9821880761",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 4),
                    child: Center(
                        child: Container(
                      width: width / 3.5,
                      height: height / 18,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/done.svg',
                                width: 15,
                                height: 15,
                                // color: darkYellow
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Active",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => const InformationProfile());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/info.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'My Information',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    const Text('view your personal details'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const DevicesAndCredentials());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/dev.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'Device & Credentials',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                    'manage your Devices,cridentials and notification ID'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const HelpCenter());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                    'assets/helpcenter.svg',
                                    width: 30,
                                    height: 30,
                                    color: darkYellow),
                                title: const Text(
                                  'Help Center',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                    'Ask a Quastion from help center'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const AboutUSScreen());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/aboutus.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'About Us',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text('view About App'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.isDarkMode
                                    ? Get.changeTheme(ThemeData.light())
                                    : Get.changeTheme(ThemeData.dark());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/darkmode.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'Dark Mode',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text('Change Mode'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const SettingScreen());
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/setting.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'Setting',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text('Change your setting'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _logout(context);
                              },
                              child: ListTile(
                                leading: SvgPicture.asset('assets/logout.svg',
                                    width: 30, height: 30, color: darkYellow),
                                title: const Text(
                                  'Log Out',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
