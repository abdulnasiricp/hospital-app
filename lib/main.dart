import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:TezHealthCare/Controller/loginController.dart';
import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/themeService.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true); // Set to false in production

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          ChangeNotifierProvider(create: (_) => LoginController()),
        ],
        child: KhaltiScope(
          publicKey: "test_public_key_d5d9f63743584dc38753056b0cc737d5",
          enabledDebugging: true, // Set to false in production
          builder: (context, navKey) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Themes().lightTheme,
              darkTheme: Themes().darkTheme,
              home: FutureBuilder<bool>(
                future: _isLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final bool isLoggedIn = snapshot.data ?? false;
                    return isLoggedIn ? const Bottomhome() : const Splash_Screen();
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
