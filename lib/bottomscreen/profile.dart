// ignore_for_file: sized_box_for_whitespace


import 'package:TezHealthCare/bottomscreen/home/address.dart';
import 'package:TezHealthCare/bottomscreen/home/informationprofile.dart';
import 'package:TezHealthCare/bottomscreen/sehedule.dart';
import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/activityhistory.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('username');
    sharedPreferences.remove('password');

    // Navigate to the login screen
    Get.off(() => MainSiginScreen());
  }

  late ColorNotifier notifier;
  bool selectedindex = false;
  bool selectedindex1 = false;
  bool selectedindex2 = false;
  bool selectedindex3 = false;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
            backgroundColor: Utils.appbarColor,
            foregroundColor: Utils.appbarForgroundColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Utils.bgColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Utils.containerColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1)),
                        child: Row(
                          children: [
                            Container(
                              width: 69,
                              height: 69,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('assets/drtwo.png')),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text(
                                  "Dr.Push Puttical",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("0344-4343-3434"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(()=>const InformationProfile());
                        },
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/person.png'),
                          ),
                        ),
                        title: const Text('Profile'),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(() => const ActivityHistory());
                        },
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/history.png'),
                          ),
                        ),
                        title: const Text('Q & A History'),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(() => const Address());
                        },
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/pin.png'),
                          ),
                        ),
                        title: const Text('Address'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/headset.png'),
                          ),
                        ),
                        title: const Text('Help Center'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/phone.png'),
                          ),
                        ),
                        title: const Text('Hotline'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/help.png'),
                          ),
                        ),
                        title: const Text('About Us'),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(() => const Schedule());
                        },
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/Schedule.png'),
                          ),
                        ),
                        title: const Text('Schedule'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/darkmode.png'),
                          ),
                        ),
                        title: const Text('DarkMode'),
                      ),
                      ListTile(
                        onTap: () {
                          _logout(context);
                        },
                        leading: Container(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/exit.png',
                              color: Colors.red,
                            ),
                          ),
                        ),
                        title: const Text('Logout'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
