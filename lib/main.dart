import 'package:TezHealthCare/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import 'onbonding/onbonding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ColorNotifier()),
        ],
        child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:   Onbonding(),
        ),
      ),
    );
  }
}