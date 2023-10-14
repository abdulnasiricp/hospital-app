// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToastDialog extends StatelessWidget {
  const ToastDialog({
    Key? key,
  }) : super(key: key);
/////////////////////////////////////////////////////////////////////
   // Define a key to store the selected language
  static const String selectedLanguageKey = 'selectedLanguage';

  // Function to save the selected language
  Future<void> saveSelectedLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedLanguageKey, languageCode,);
  }

  // Function to retrieve the selected language
  Future<String?> getSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedLanguageKey);
  }
///////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          margin: const EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Select Language'),
              const SizedBox(height: 20),
              Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkYellow),
                  child: ListTile(
                    onTap: () {
                      // Save the selected language when tapped
                    saveSelectedLanguage('en');
                      Get.updateLocale(const Locale('en', 'US'));
                      Get.offAll(() => const Bottomhome());
                    },
                    leading: SvgPicture.asset(
                      'assets/usflag.svg',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              const SizedBox(height: 10),
              Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkYellow),
                  child: ListTile(
                    hoverColor: whitecolor,
                    onTap: () {
                      // Save the selected language when tapped
                    saveSelectedLanguage('ne');
                      Get.updateLocale(const Locale('ne', 'NP'));
                      Get.offAll(() => const Bottomhome());
                    },
                    leading: SvgPicture.asset(
                      'assets/nepflag.svg',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'नेपाली',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
