// ignore_for_file: file_names, sized_box_for_whitespace, must_be_immutable

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToastDialog extends StatelessWidget {
  String selectedLanguage = '';

  ToastDialog({Key? key}) : super(key: key) {
    getSelectedLanguage().then((languageCode) {
      if (languageCode != null) {
        selectedLanguage = languageCode;
      }
    });
  }

  // Define a key to store the selected language
  static const String selectedLanguageKey = 'selectedLanguage';

  // Function to save the selected language
  Future<void> saveSelectedLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedLanguageKey, languageCode);
  }

  // Function to retrieve the selected language
  Future<String?> getSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedLanguageKey);
  }

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
              // English Language Option
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: darkYellow,
                ),
                child: ListTile(
                  onTap: () {
                    saveSelectedLanguage('en');
                    Get.updateLocale(const Locale('en', 'US'));
                    Get.offAll(() => const Bottomhome());
                    selectedLanguage = 'en';
                  },
                  leading: SvgPicture.asset(
                    'assets/usflag.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'English',
                        style: TextStyle(color: Colors.white),
                      ),
                      if (selectedLanguage == 'en')
                        const Icon(Icons.check_circle, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Nepali Language Option
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: darkYellow,
                ),
                child: ListTile(
                  onTap: () {
                    saveSelectedLanguage('ne');
                    Get.updateLocale(const Locale('ne', 'NP'));
                    Get.offAll(() => const Bottomhome());
                    selectedLanguage = 'ne';
                  },
                  leading: SvgPicture.asset(
                    'assets/nepflag.svg',
                    width: 30,
                    height: 30,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'नेपाली',
                        style: TextStyle(color: Colors.white),
                      ),
                      if (selectedLanguage == 'ne')
                        const Icon(Icons.check_circle, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
