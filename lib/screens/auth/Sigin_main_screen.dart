// ignore_for_file: file_names

import 'package:TezHealthCare/screens/auth/Doctor_Login.dart';
import 'package:TezHealthCare/screens/auth/Patient_login.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainSiginScreen extends StatefulWidget {
  const MainSiginScreen({Key? key}) : super(key: key);

  @override
  State<MainSiginScreen> createState() => _MainSiginScreenState();
}

class _MainSiginScreenState extends State<MainSiginScreen> {
   late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
         appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Utils.appbarColor,
          foregroundColor: Utils.appbarForgroundColor,
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
                  color: Utils.bgColor,

                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                  
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ButtonsTabBar(
                        
                            unselectedLabelStyle:
                                const TextStyle(color: Colors.white),
                            backgroundColor: Colors.white,
                            unselectedBackgroundColor: Colors.transparent,
                            labelStyle: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            //  borderWidth: 1,
                            //  elevation: 30,
                            radius: 5.sp,
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    
                                  ),
                                  height: height / 19,
                                  width: width / 2.5,
                                  child: Center(
                                    child: Text(
                                      'Patient Login',
                                      style: TextStyle(
                                          color: notifier.isDark
                                              ? Colors.white
                                              : const Color(0xff2AD3E7),
                                          fontFamily: 'Gilroy Medium',
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    
                                  ),
                                  height: height / 19,
                                  width: width / 2.5,
                                  child: Center(
                                    child: Text(
                                      'Doctor Login',
                                      style: TextStyle(
                                          color: notifier.isDark
                                              ? Colors.white
                                              : const Color(0xff2AD3E7),
                                          fontFamily: 'Gilroy Medium',
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: <Widget>[PatientLoginScreen(), DoctorLoginScreen()],
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