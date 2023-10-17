// ignore_for_file: camel_case_types, file_names, unnecessary_new

import 'dart:async';
import 'package:TezHealthCare/onbonding/onbonding.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Onbonding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkYellow, // Background color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Company logo at the center
          Center(
            child: Image.asset(
              'assets/hospital_logo.png',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
          ),
          //
          //
          // "Powered by" logo at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Text(
                'Powered by:',
                style: TextStyle(
                    fontSize: 8, fontWeight: FontWeight.bold, color: yellow),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 1.0), // Adjust the bottom padding as needed
              child: Image.asset(
                'assets/Tezashlogo.png',
                width: 80, // Adjust the width as needed
                height: 80, // Adjust the height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:TezHealthCare/Controller/notificationProvider.dart';
// import 'package:TezHealthCare/Services/notification_worker.dart';
// import 'package:TezHealthCare/language_Services/translation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:TezHealthCare/Controller/loginController.dart';
// import 'package:TezHealthCare/Splash_Screen.dart';
// import 'package:TezHealthCare/bottombar/bottombar.dart';
// import 'package:TezHealthCare/themeService.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:workmanager/workmanager.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await FlutterDownloader.initialize(debug: true); // Set to false in production

//   //////////////////////////////////////////////////////////////////
//   // Initialize SharedPreferences
//   // Initialize SharedPreferences
//   final sharedPreferences = await SharedPreferences.getInstance();

//   String? selectedLanguage = sharedPreferences.getString('selectedLanguage');

//   String defaultLang = ''; // Initialize defaultLanguage with an empty string

//   if (selectedLanguage == 'ne') {
//      defaultLang = '"ne","NP"';
//   } else if (selectedLanguage == 'en') {
//     defaultLang = '"en","US"';
//   }

//   print('========================> $defaultLang');

//   // final defaultLanguage = 'en_US';

//   runApp(MyApp(
//       defaultLanguage: defaultLang,
//       ));

//   Workmanager().initialize(callbackDispatcher);
//   Workmanager().registerPeriodicTask(
//     "1",
//     "checkForNewDataTask",
//     initialDelay: const Duration(minutes: 1),
//     frequency: const Duration(minutes: 15),
//     inputData: <String, dynamic>{
//       'payload': 'navigate_to_home_transaction_bill'
//     },
//   );
// }

// class MyApp extends StatelessWidget {
//   final String defaultLanguage;
//   const MyApp({
//     Key? key,
//     required this.defaultLanguage,
//   }) : super(key: key);

//   Future<bool> _isLoggedIn() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.containsKey('username') &&
//         sharedPreferences.containsKey('password');
//   }

//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return ScreenUtilInit(
//       child: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => ColorNotifier()),
//           // ChangeNotifierProvider(create: (_) => LoginController()),
//           // ChangeNotifierProvider(create: (_) => NotificationProvider()),
//         ],
//         child: KhaltiScope(
          
//           publicKey: "test_public_key_c976acda9afe490881d18f9856e6f896",
//           enabledDebugging: true, // Set to false in production
//           builder: (context, navKey) {
//             return GetMaterialApp(
              
//               locale: Locale(defaultLanguage),
//               translations: Translation(),
//               debugShowCheckedModeBanner: false,
//               theme: Themes().lightTheme,
//               darkTheme: Themes().darkTheme,
//               home: FutureBuilder<bool>(
//                 future: _isLoggedIn(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     print('=============>>>>> $defaultLanguage');
//                     final bool isLoggedIn = snapshot.data ?? false;
//                     return isLoggedIn
//                         ? const Bottomhome()
                        
//                         : const Splash_Screen();
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//               navigatorKey: navKey,
//               localizationsDelegates: const [
//                 KhaltiLocalizations.delegate,
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
