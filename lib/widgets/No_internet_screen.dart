// ignore_for_file: file_names

import 'dart:async';

import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NoInternetScreen extends StatefulWidget {
  // final void callback;
  const NoInternetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
   // internet connection checker
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/nointernet.svg',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Connection Error',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Couldn't connect to server at the moment,Please try again.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: ()async {
                  
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                 Get.to(()=> const NoInternetScreen());
                  setState(() => isAlertSet = true);
                }
              
                },
                child: Container(
                  width: width / 1.2,
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Try Again',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
