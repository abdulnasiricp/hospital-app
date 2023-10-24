// ignore_for_file: avoid_print

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/pathology.dart';
import 'package:TezHealthCare/language_Services/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/themeService.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

// FlutterLocalNotificationsPlugin notificationsPlugin =
//     FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true); // Set to false in production
  //////////////////////////////////////////////////////////////////
  // // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  String? selectedLanguage = sharedPreferences.getString('selectedLanguage') ??
      'en'; // Default to 'en' if not found
  String defaultLang = selectedLanguage == 'ne' ? 'ne_NP' : 'en_US';
  print('========================> $defaultLang');

  

   // Create an instance of the Workmanager class.
  final workmanager = Workmanager();

  // Register a background task to call the fetchData() function every 30 seconds.
  workmanager.registerPeriodicTask(
    "my_task_id",
    "my_task_name",
    frequency: const Duration(seconds: 30),
    initialDelay: const Duration(seconds: 10),
    constraints: Constraints(
      networkType: NetworkType.connected,

    ),
   

  );

  runApp(MyApp(
    defaultLanguage: defaultLang,
  ));
  
}

class MyApp extends StatelessWidget {
  final String defaultLanguage;
  const MyApp({
    Key? key,
    required this.defaultLanguage,
  }) : super(key: key);

  Future<bool> _isLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey('username') &&
        sharedPreferences.containsKey('password');
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
              locale: Locale(defaultLanguage),
              translations: Translation(),
              debugShowCheckedModeBanner: false,
              theme: Themes().lightTheme,
              darkTheme: Themes().darkTheme,
              home: FutureBuilder<bool>(
                future: _isLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final bool isLoggedIn = snapshot.data ?? false;
                    return isLoggedIn
                        ? const Bottomhome()
                        : const Splash_Screen();
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
