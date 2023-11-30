// ignore_for_file: file_names, sized_box_for_whitespace

import 'dart:async';

import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/Opd_Main_Screen.dart';
import 'package:TezHealthCare/screens/auth/Patient_login.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/No_internet_screen.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    getConnectivity();
  }
   // internet connection checker
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            // showDialogBox();
           Get.to(()=> NoInternetScreen());
            setState(() => isAlertSet = true);
          }
        },
      );

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: Column(
  //           children: [
  //             SvgPicture.asset(
  //               'assets/nointernet.svg',
  //               width: 30,
  //               height: 30,
  //             ),
  //             const Text('No Connection'),
  //           ],
  //         ),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
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
