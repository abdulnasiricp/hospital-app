import 'package:TezHealthCare/Controller/loginController.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/onbonding/onbonding.dart';
import 'package:TezHealthCare/screens/auth/login.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _isLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey('username') && sharedPreferences.containsKey('password');
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
        child:  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: 
          FutureBuilder<bool>(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final bool isLoggedIn = snapshot.data ?? false;
            return isLoggedIn ? const Bottomhome() : const Onbonding();
          }
           else {
            return Container();
            // const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        }
        ),
        

      ),
      
      )
      
    );

  }
}