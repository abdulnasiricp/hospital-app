// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/Profile/profile.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Card/Card.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Patient_home.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bottomhome extends StatefulWidget {
  const Bottomhome({Key? key}) : super(key: key);

  @override
  _BottomhomeState createState() => _BottomhomeState();
}

class _BottomhomeState extends State<Bottomhome> {
  String Patient_id = '';

  DateTime? currentBackPressTime; // Track back button press time
  Future<bool> _onBackPressed() {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press back again to exit',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
      );
      return Future.value(false); // Prevent the app from closing
    }
    return Future.value(true); // Allow the app to close
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  @override
  void initState() {
    LoadData();
    super.initState();
  }

  int _selectedIndex = 0;
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return WillPopScope(
      onWillPop: _onBackPressed, // Handle back button press

      child: ScreenUtilInit(
        builder: (_, child) => Scaffold(
          backgroundColor: notifier.getdarkyellow,
          bottomNavigationBar: SalomonBottomBar(
            curve: Curves.easeInOut,
            selectedItemColor: notifier.getwihitecolor,
            currentIndex: _selectedIndex,
            items: [
              SalomonBottomBarItem(
                icon: Image.asset("assets/home.png",
                    height: height / 28, color: notifier.getwihitecolor),
                title: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'home'.tr,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: notifier.getwihitecolor,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset('assets/transaction.svg',
                    height: height / 28, color: notifier.getwihitecolor),
                title: Text(
                  'transcation'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: notifier.getwihitecolor,
                      fontFamily: 'Gilroy_Bold'),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset('assets/card.svg',
                    height: height / 28, color: notifier.getwihitecolor),
                title: Text(
                  'card'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: notifier.getwihitecolor,
                      fontFamily: 'Gilroy_Bold'),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset("assets/profile.png",
                    height: height / 28, color: notifier.getwihitecolor),
                title: Text(
                  'profile'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: notifier.getwihitecolor,
                      fontFamily: 'Gilroy_Bold'),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
            ],
          ),
          drawer: const Drawer(
              width: double.infinity, child: AboutUSScreen()), // Left drawer
          endDrawer: const Notif(),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          PatientHomePage(patientId: Patient_id),
          const TransactionBill(),
          const CardScreen(),
          const Profile(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
