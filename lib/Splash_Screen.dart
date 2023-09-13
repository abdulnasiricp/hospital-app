// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class Splash_Screen extends StatefulWidget {
//   @override
//   State<Splash_Screen> createState() => _Splash_ScreenState();
// }
//
// class _Splash_ScreenState extends State<Splash_Screen>  {
//   startTime() async {
//     var _duration = new Duration(seconds: 2);
//     return new Timer(_duration, navigationPage);
//   }
//
//   void navigationPage() {
//     Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Stack(
//         fit: StackFit.expand,
//         children: <Widget>[new Image.asset('assets/images/aeologic_logo.png')],
//       ),
//     );
//   }
// }