// ignore_for_file: avoid_print, prefer_final_fields, unused_field, non_constant_identifier_names, unused_local_variable, non_constant_identifier_names, non_constant_identifier_names, duplicate_ignore
import 'dart:async';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_Home_Bottom_bar.dart';
import 'package:TezHealthCare/language_Services/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/themeService.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true); // Set to false in production
  // // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  String? selectedLanguage =
      sharedPreferences.getString('selectedLanguage') ?? 'en';
  String defaultLang = selectedLanguage == 'ne' ? 'ne_NP' : 'en_US';
  print('========================> $defaultLang');
  runApp(MyApp(
    defaultLanguage: defaultLang,
  ));
}

class MyApp extends StatefulWidget {
  final String defaultLanguage;

  const MyApp({
    Key? key,
    required this.defaultLanguage,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

@override
class _MyAppState extends State<MyApp> {
  Future<bool> _isLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('username') &&
        sharedPreferences.containsKey('password') &&
        sharedPreferences.containsKey('role')) {
      final String? role = sharedPreferences.getString('role');
      print('==============================> Role: $role');

      switch (role) {
        case 'patient':
          print('========================> Navigating to Bottomhome()');
          Get.off(() => const Bottomhome());
          return true;
        case '3':
          print(
              '===============================>Navigating to Doctor_Home_Bottom_bar()');
          Get.off(() => const Doctor_Home_Bottom_bar());
          return true;
        default:
          print(
              '===================================>Role not recognized. Navigating to Splash_Screen()');
          Get.off(() => const Splash_Screen());
          return false;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ColorNotifier()),
        ],
        child: KhaltiScope(
          publicKey: "test_public_key_c976acda9afe490881d18f9856e6f896",
          enabledDebugging: true, // Set to false in production
          builder: (context, navKey) {
            return GetMaterialApp(
              locale: Locale(widget.defaultLanguage),
              translations: Translation(),
              debugShowCheckedModeBanner: false,
              theme: Themes().lightTheme,
              darkTheme: Themes().darkTheme,
              home: FutureBuilder<bool>(
                future: _isLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container();
                  } else {
                    return Container();
                  }
                },
              ),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ],
            );
          },
        ),
      ),
    );
  }
}
