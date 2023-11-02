import 'package:TezHealthCare/DoctorPannel/Doctor_Pannel_Home/Doctor_Profile.dart';
import 'package:TezHealthCare/DoctorPannel/Doctor_Pannel_Home/Home.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor_Home_Bottom_bar extends StatefulWidget {
  @override
  State<Doctor_Home_Bottom_bar> createState() => _Doctor_Home_Bottom_barState();
}

class _Doctor_Home_Bottom_barState extends State<Doctor_Home_Bottom_bar> {
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
                    height: 30, color: notifier.getwihitecolor),
                title: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'home'.tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: notifier.getwihitecolor,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset('assets/transaction.svg',
                    height: 30, color: notifier.getwihitecolor),
                title: Text(
                  'transcation'.tr,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: notifier.getwihitecolor,
                      fontFamily: 'Gilroy_Bold'),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset('assets/card.svg',
                    height: 30, color: notifier.getwihitecolor),
                title: Text(
                  'card'.tr,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: notifier.getwihitecolor,
                      fontFamily: 'Gilroy_Bold'),
                ),
                selectedColor: notifier.getwihitecolor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset("assets/profile.png",
                    height: 30, color: notifier.getwihitecolor),
                title: Text(
                  'profile'.tr,
                  style: TextStyle(
                      fontSize: 10.sp,
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
          Doctor_Home_Page(),
          Doctor_Home_Page(),
          Doctor_Home_Page(),
          Doctor_Profile(),
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
