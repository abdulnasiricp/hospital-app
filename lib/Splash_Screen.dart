// ignore_for_file: camel_case_types, file_names, unnecessary_new, unnecessary_string_interpolations, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:TezHealthCare/onbonding/onboarding.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}
class _Splash_ScreenState extends State<Splash_Screen> {
  bool isLoading = true;
  late String HospitalLogo = '';
  Future<void> getAboutUsDetails() async {
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.aboutUs),
        headers: ApiLinks.MainHeader,
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        HospitalLogo = data['0']['app_logo'];
        print('------------$HospitalLogo');
        // Set the state to rebuild the widget
        setState(() {
          isLoading = false;
        });
      } else {
        isLoading = false;

        // Handle the error
      }
    } catch (error) {
      isLoading = false;

      print(error);
    }
  }

  late Timer _timer;
  @override
  void initState() {
    getAboutUsDetails();
    super.initState();
    _timer = Timer(const Duration(seconds: 7), () {
      route();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkYellow, // Background color
      body: isLoading
          ? null
          : Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: HospitalLogo.isEmpty
                      ? Container()
                      : Image.network(
                          '$HospitalLogo',
                          width: 300.0,
                          height: 300.0,
                          fit: BoxFit.fill,
                        ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(
                      'Powered by:',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: yellow),
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
