// ignore_for_file: file_names, sized_box_for_whitespace

import 'dart:async';

import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/Opd_Main_Screen.dart';
import 'package:TezHealthCare/screens/auth/Patient_login.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/No_internet_screen.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

class MainSiginScreen extends StatefulWidget {
  const MainSiginScreen({Key? key}) : super(key: key);
  @override
  State<MainSiginScreen> createState() => _MainSiginScreenState();
}

class _MainSiginScreenState extends State<MainSiginScreen> {

  @override
  void initState() {
    super.initState();
     checkConnectivity(); // Check connectivity when the app starts
    subscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkConnectivity(); // Check connectivity when it changes
  });
  }
   // internet connection checker
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  // Check connectivity function
  Future<void> checkConnectivity() async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (!isDeviceConnected && !isAlertSet) {
      Get.to(() => const NoInternetScreen());
      setState(() => isAlertSet = true);
    } else {
      setState(() => isAlertSet = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkblue,
        body: DefaultTabController(
          length: 1,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ButtonsTabBar(
                  height: 50,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: yellow,
                  unselectedBackgroundColor: whitecolor.withOpacity(0.5),
                  labelStyle: const TextStyle(
                      wordSpacing: 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  borderWidth: 1,
                  tabs: [
                    Tab(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Opd_Main_Screen());
                        },
                        child: Container(
                          width: width / 1.2,
                          child: Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.grey,
                              child: const Text(
                                "OPD Ticket",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PatientLogin(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  '©2023 Tez Health Care. All Right Reserved',
                  style: TextStyle(
                      fontSize: 8, fontWeight: FontWeight.bold, color: yellow),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
