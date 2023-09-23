// ignore_for_file: file_names

import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetScreen extends StatefulWidget {
  // final void callback;
  const NoInternetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
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
                "Couldn't connect to server at the moment.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                "Please try again.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
