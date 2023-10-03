// ignore_for_file: file_names

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/changepass.svg',
                width: 30,
                height: 30,
              ),
              title: const Text('Change Password'),
            ),
          ),
          InkWell(
            onTap: (){
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
    );
  }
}
