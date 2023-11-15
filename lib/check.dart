// import 'package:flutter/material.dart';


// class DynamicRowList extends StatefulWidget {
//   const DynamicRowList({Key? key}) : super(key: key);

//   @override
//   _DynamicRowListState createState() => _DynamicRowListState();
// }

// class _DynamicRowListState extends State<DynamicRowList> {
//   List<Widget> rows = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//      body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 // Add a new row when the "Add" button is clicked
//                 rows.add(buildRow());
//               });
//             },
//             child: Text('Add'),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: rows.length,
//               itemBuilder: (context, index) {
//                 return rows[index];
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRow() {
//     TextEditingController textFieldController = TextEditingController();

//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: textFieldController,
//             decoration: InputDecoration(labelText: 'Enter text'),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               // Remove the row when the "Cancel" button is clicked
//               rows.removeLast();
//             });
//           },
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }
// }



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
