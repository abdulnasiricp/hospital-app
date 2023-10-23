// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_typing_uninitialized_variables, avoid_print, unnecessary_string_interpolations, unnecessary_const, deprecated_member_use, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/Profile/Information_profile.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Setting/Setting_screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/help_center.dart';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/bottomscreen/Profile/term_and_condition.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //////////////////////////////////////////
  // Future<String> getCurrentAppVersion() async {
  //   // Replace 'your_package_name' with your app's package name
  //   const packageInfo = 'com.tezash.msmenepal';
  //   final String url =
  //       'https://play.google.com/store/apps/details?id=$packageInfo';
  //   final Uri uri = Uri.parse(url);
  //
  //   final response = await http.get(uri);
  //
  //   if (response.statusCode == 200) {
  //     final playStoreVersion = getPlayStoreVersion(response.body);
  //     if (playStoreVersion.isNotEmpty) {
  //       return playStoreVersion;
  //     }
  //   }
  //
  //   return '';
  // }
  //
  // Future<void> checkForUpdate(BuildContext context) async {
  //   final currentVersion = await getCurrentAppVersion();
  //   if (currentVersion.isNotEmpty) {
  //     final latestVersion = await fetchLatestPlayStoreVersion();
  //
  //     if (latestVersion.isNotEmpty && currentVersion != latestVersion) {
  //       // An update is available
  //       showUpdateDialog(context);
  //     } else {
  //       // No updates are available
  //       showSnackbar(context, 'You have the latest version.');
  //     }
  //   } else {
  //     // Failed to get the app version from the Play Store
  //     showSnackbar(context, 'Failed to check for updates.');
  //   }
  // }
  //
  // String getPlayStoreVersion(String responseBody) {
  //   final startDelimiter = 'Current Version">';
  //   final endDelimiter = '<';
  //   final startIndex = responseBody.indexOf(startDelimiter);
  //   final endIndex = responseBody.indexOf(endDelimiter, startIndex);
  //
  //   if (startIndex != -1 && endIndex != -1) {
  //     return responseBody.substring(
  //         startIndex + startDelimiter.length, endIndex);
  //   }
  //
  //   return '';
  // }
  //
  // Future<String> fetchLatestPlayStoreVersion() async {
  //   // Replace 'your_package_name' with your app's package name
  //   const packageInfo = 'com.tezash.msmenepal';
  //   final String url =
  //       'https://play.google.com/store/apps/details?id=$packageInfo';
  //   final Uri uri = Uri.parse(url);
  //
  //   final response = await http.get(uri);
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     return getPlayStoreVersion(response.body);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  //   return '';
  // }
  //
  // void showUpdateDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Update Available'),
  //         content: Text(
  //             'An update is available for your app. Would you like to update now?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Later'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Redirect to the Play Store for the update
  //               redirectToPlayStore();
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Update Now'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  //
  // void showSnackbar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 3),
  //     ),
  //   );
  // }
  //
  // void redirectToPlayStore() async {
  //   // Replace 'your_package_name' with your app's package name
  //   const packageInfo = 'com.tezash.msmenepal';
  //   final url = 'https://play.google.com/store/apps/details?id=$packageInfo';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  // }

  //////////////////////////////

  /////////////////////// For App Update
  void _checkForUpdate() async {
    final packageName = 'tez.hospital.siraha';
    final url = 'https://play.google.com/store/apps/details?id=$packageName';

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
    final String url =
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

    // Navigate to the login screen
    Get.offAll(() => const MainSiginScreen());
  }

  String apiUrl =
      'https://uat.tez.hospital/xzy/auth/patient_logout'; // Replace with your logout API URL

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
          msg: 'Logot Successfully!!!.',
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
  // Existing code for LoadData, getAllData, and initState methods

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);

    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        
        appBar: AppBar(
          title: Text('profile'.tr),
          centerTitle: true,
          backgroundColor: notifier.getdarkyellow,
        ),
                backgroundColor: Colors.lightBlue[50],

        body: Stack(
          children: [
            // Background content (Profile information, etc.)
            profileData != null
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
                                  radius: height / 15,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/done.svg',
                                          width: width / 40,
                                          height: height / 40,
                                          // color: darkYellow
                                        ),
                                        SizedBox(
                                          width: width / 50,
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
                                            Get.to(
                                                () => const HelpCenterPage());
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
                : Container(), // Use an empty container if profileData is null
            if (isLoggingOut)
              Container(
                color:
                    Colors.black.withOpacity(0.3), // Adjust opacity as needed
              ),

            // Loading indicator
            if (isLoggingOut)
              Center(
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoadingIndicatorWidget(),
                  ),
                ),
              ),

            Container(), // Use an empty container if profileData is null
            if (isLoading)
              Container(
                color:
                    Colors.black.withOpacity(0.3), // Adjust opacity as needed
              ),

            // Loading indicator
            if (isLoading)
              Center(
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoadingIndicatorWidget(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
