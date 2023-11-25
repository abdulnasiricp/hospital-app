// ignore_for_file: file_names, camel_case_types, deprecated_member_use, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:TezHealthCare/DoctorPannel/Doctor_Profile_Screens/Doctor_informationProfile.dart';
import 'package:TezHealthCare/DoctorPannel/Doctor_Profile_Screens/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/Profile/help_center.dart';
import 'package:TezHealthCare/bottomscreen/Profile/term_and_condition.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctor_Profile extends StatefulWidget {
  const Doctor_Profile({Key? key}) : super(key: key);

  @override
  State<Doctor_Profile> createState() => _Doctor_ProfileState();
}

class _Doctor_ProfileState extends State<Doctor_Profile> {
  /////////////////////// For App Update
  void _checkForUpdate() async {
    const packageName = 'tez.hospital.siraha';
    const url = 'https://play.google.com/store/apps/details?id=$packageName';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Updated_msg'.tr,
        ),
        backgroundColor: Colors.green,
      ));
    } else {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Update_Available'.tr,
            ),
            content: Text(
              'Update_Available_question'.tr,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Later'.tr,
                ),
              ),
              TextButton(
                onPressed: () {
                  _navigateToPlayStore();
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Update_Now'.tr,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToPlayStore() async {
    const String packageName = 'tez.hospital.siraha';
    const String url =
        'https://play.google.com/store/apps/details?id=$packageName';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }

  ////////////// End App Update
////////////////Rateus
  Future<void> rateUs() async {
    const String packageName =
        'tez.hospital.siraha'; // Replace with your app's package name
    const String url =
        'https://play.google.com/store/apps/details?id=$packageName';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where the app store URL cannot be opened.
      print('Could not launch $url');
    }
  }

  ////////////////////Rateus End
  String role = '';
  String username = '';
  String record = '';
  String image = '';
  String genderrecord = '';
  String mobilerecord = '';
  bool isLoading = false;
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
  bool isLoggingOut = false; // Flag to check if logout process is in progress
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

  String apiUrl = ApiLinks.stafflogout; // Replace with your logout API URL
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
        body: jsonEncode({
          "doctorId": doctorId,
          "app_key": NotificationToken,
        }),
      );
      if (response.statusCode == 200) {
        // Successful logout, clear user data or navigate to the login screen.
        OneSignal.logout();
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

  ////////////////////////////////////////////////////////////////////////////
  ///shared preference data
  var profileData;
  late String doctorId = '';

  late String NotificationToken = '';
  late String doctorName = '';
  late String doctorImage = '';
  late String doctoremail = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    doctorId = sp.getString('id') ?? '';
    doctorName = sp.getString('username') ?? '';
    NotificationToken = sp.getString('NotificationToken') ?? '';
    doctorImage = sp.getString('image') ?? '';
    doctoremail = sp.getString('email') ?? '';
    print('==========$doctorId');
    print('============$doctorName');
    print(
        '===========++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=$NotificationToken');
    setState(() {});
  }
////////////////////////////////////////////

  @override
  void initState() {
    LoadData();
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////

  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();
  // Existing code for LoadData, getAllData, and initState methods

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: darkYellow, // Set the status bar color here
      ),
    );
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: doctorImage != null && doctorImage != ''
                                    ? Image.network(
                                        doctorImage,
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return CircularProgressIndicator(
                                              color: darkYellow,
                                              backgroundColor: yellow,
                                            );
                                          }
                                        },
                                      )
                                    : Center(
                                        child: SvgPicture.asset(
                                            'assets/Noimagedoctor.svg',
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.fill,
                                            color: darkYellow),
                                      ),
                              ),
                              radius: height / 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 5.5),
                          child: Center(
                            child: Text(
                              doctorName.isEmpty ? 'N/A' : doctorName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 4.7),
                          child: Center(
                            child: Text(
                              doctoremail.isEmpty ? 'N/A' : doctoremail,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
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
                                    'assets/Done1.svg',
                                    width: width / 40,
                                    height: height / 40,
                                    // color: darkYellow
                                  ),
                                  SizedBox(
                                    width: width / 50,
                                  ),
                                  const Text(
                                    "Active",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20),
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          const DoctorInformationProfile());
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
                                      subtitle:
                                          Text('myinformationsubtitle'.tr),
                                    ),
                                  ),
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
                                      subtitle: Text('aboutUsSubtitle'.tr),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _checkForUpdate();
                                      setState(() {
                                        isLoading = true;
                                      });
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
                                      rateUs();
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
                                      Get.to(
                                          () => const TermAndConditionsScreen(
                                                url: 'https://www.google.com/',
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
                                      subtitle:
                                          Text('Termsconditionubtitle'.tr),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => const SettingScreen());
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
                                      subtitle: Text('settingSubtitle'.tr),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const HelpCenterPage());
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
                                      subtitle: Text('helpCenterSubtitle'.tr),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      performLogout(); // Call _logout with the 'context'
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
                                      subtitle: Text('LogoutSubtitle'.tr),
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
          ],
        ),
      ),
    );
  }
}
