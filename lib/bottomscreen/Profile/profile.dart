// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_typing_uninitialized_variables, avoid_print, unnecessary_string_interpolations, unnecessary_const, deprecated_member_use, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';

import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Information_profile.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Setting/Setting_screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/help_center.dart';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/bottomscreen/Profile/term_and_condition.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String role = '';
  String username = '';
  String record = '';
  String image = '';
  String genderrecord = '';
  String mobilerecord = '';
  bool isLoading = true;
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.clear();

    // Navigate to the login screen
    Get.off(() => const Splash_Screen());
  }

  ////////////////////////////////////////////////////////////////////////////
  ///
  ///////////////////////////////////////////////////////////////////////////////
  String apiUrl =
      'https://uat.tez.hospital/xzy/auth/patient_logout'; // Replace with your logout API URL

  Future<void> performLogout() async {
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

        // Implement your logout logic here.
      } else {
        // Handle errors, e.g., display an error message to the user.
        print('Logout failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors.
      print('Network error: $e');
    }
  }

////////////////////////////////////////////////////////////////////////////
  ///shared preference data
  var profileData;
  late String patientID = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';

    print(patientID);
    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
// get patient profile

  Future<void> ProfileApi() async {
    const apiUrl = ApiLinks.getPatientprofile;
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final requestBody = jsonEncode({"patientId": patientID});

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profileJson =
            responseBody[0]; // Assuming your API returns a list with one item
        setState(() {
          profileData = ProfileData.fromJson(profileJson);
        });
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Request error: $e');
    }
  }
////////////////////////////////////////////////////////////////////////////

  getAllData() async {
    await LoadData();

    await ProfileApi();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }
////////////////////////////////////////////////////////////////////////////

  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();

// InAppWebViewController? webView;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
        builder: (_, child) => Scaffold(
            appBar: AppBar(
                title: Text('profile'.tr),
                centerTitle: true,
                backgroundColor: notifier.getdarkyellow
                // elevation: 0,
                ),
            backgroundColor: Colors.grey.shade300,
            body: profileData != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
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
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                    child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(profileData!.image ?? ""),
                                  radius: height/15,
                                )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height / 5.5),
                                child: Center(
                                    child: Text(
                                  profileData.patientName ?? "",
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
                                  profileData.mobileNo ?? "",
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
                                  height: height / 17,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/done.svg',
                                          width: width/40,
                                          height: height/40,
                                          // color: darkYellow
                                        ),
                                         SizedBox(
                                          width: width/50,
                                        ),
                                        Text(
                                          profileData.isActive == "yes"
                                              ? "Active"
                                              : "Offine",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 20),
                                        ),
                                      ],
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                const InformationProfile());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/info.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'myinformation'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                                'myinformationsubtitle'.tr),
                                          ),
                                        ),
                                        // InkWell(
                                        //   onTap: () {
                                        //     Get.to(() =>
                                        //         const DevicesAndCredentials());
                                        //   },
                                        //   child: ListTile(
                                        //     leading: SvgPicture.asset(
                                        //         'assets/dev.svg',
                                        //         width: 30,
                                        //         height: 30,
                                        //         color: darkYellow),
                                        //     title: Text(
                                        //       'deviceAndCredential'.tr,
                                        //       style: const TextStyle(
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     subtitle: Text(
                                        //         'deviceAndCredentialSubtitle'
                                        //             .tr),
                                        //   ),
                                        // ),

                                        InkWell(
                                          onTap: () {
                                            Get.to(() => const AboutUSScreen());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/aboutus.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'aboutUs'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle:
                                                Text('aboutUsSubtitle'.tr),
                                          ),
                                        ),
                                        // InkWell(
                                        //   onTap: () {
                                        //     Get.changeThemeMode(Get.isDarkMode
                                        //         ? ThemeMode.light
                                        //         : ThemeMode.dark);
                                        //   },
                                        //   child: ListTile(
                                        //     leading: SvgPicture.asset(
                                        //         'assets/darkmode.svg',
                                        //         width: 30,
                                        //         height: 30,
                                        //         color: darkYellow),
                                        //     title: Text(
                                        //       'darkmode'.tr,
                                        //       style: const TextStyle(
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     subtitle:
                                        //         Text('darkmodeSubtitle'.tr),
                                        //   ),
                                        // ),
                                        InkWell(
                                          onTap: () {
                                            // Get.to(() => const SettingScreen());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/updatecheck.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'checkUpdate'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text('Updatesubtitle'.tr),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Get.to(() => const SettingScreen());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/rateUs.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'rateUs'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text('Ratussubtitle'.tr),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            // Get.to(() => const TermAndConditionsScreen());

                                            //  launchUrl(Uri.parse('https://www.google.com/'),mode: LaunchMode.inAppWebView);

                                            Get.to(() =>
                                                const TermAndConditionsScreen(
                                                  url:
                                                      'https://www.google.com/',
                                                ));
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/termcondition.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'termsAndCondition'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                                'Termsconditionubtitle'.tr),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.offAll(
                                                () => const SettingScreen());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/setting.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'setting'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle:
                                                Text('settingSubtitle'.tr),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() =>  const HelpCenterPage());
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/helpcenter.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'helpCenter'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle:
                                                Text('helpCenterSubtitle'.tr),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            performLogout();
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                                'assets/logout.svg',
                                                width: 30,
                                                height: 30,
                                                color: darkYellow),
                                            title: Text(
                                              'logout'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
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
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: const LoadingIndicatorWidget()),
                  )));
  }
}
