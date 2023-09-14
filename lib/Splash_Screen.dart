<<<<<<< HEAD
// ignore_for_file: file_names
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
=======
import 'dart:async';
import 'package:TezHealthCare/onbonding/onbonding.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
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
    var duration = Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Onbonding()));
  }

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
                'assets/tezash.png',
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
>>>>>>> db4d6bf70833bbaf479161f8080155942e47a8b0
