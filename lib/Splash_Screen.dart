// ignore_for_file: camel_case_types, file_names, unnecessary_new

import 'dart:async';
import 'package:TezHealthCare/onbonding/onboarding.dart';
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
    var duration = const Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.withOpacity(0.5), // Background color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Company logo at the center
          Center(
            child: Image.asset(
              'assets/hospital_logo.png',
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
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

                'assets/Tezashlogo'
                    '.png',
                width: 100, // Adjust the width as needed
                height: 80, // Adjust the height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
