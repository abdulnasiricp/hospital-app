// ignore_for_file: file_names

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Setting/change_password.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/Toast_dialog.dart';
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
          MaterialPageRoute(builder: (context) => const Bottomhome()),
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
              Get.to(() => const Bottomhome());
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(()=> const Change_Password());
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
                Get.dialog(const ToastDialog());
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
