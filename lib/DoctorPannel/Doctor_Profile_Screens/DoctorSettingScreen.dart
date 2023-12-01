// ignore_for_file: file_names, deprecated_member_use

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_Home_Bottom_bar.dart';
import 'package:TezHealthCare/DoctorPannel/Doctor_Profile_Screens/DoctorChange_Password.dart';
import 'package:TezHealthCare/DoctorPannel/Doctor_Profile_Screens/toast.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const Doctor_Home_Bottom_bar()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: const Text('Setting'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.to(() => const Doctor_Home_Bottom_bar());
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const Doctor_Change_Password());
              },
              child: Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/changepass.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: const Text('Change Password'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.dialog(ToastDialog());
              },
              child: Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/lang.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: const Text('Language change'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
