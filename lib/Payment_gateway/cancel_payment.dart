import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CancelPaymentScreen extends StatelessWidget {
  final String title;
  final String message;
  final String btnnName;

  const CancelPaymentScreen({
    Key? key,
    required this.title,
    required this.message,
    required this.btnnName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 60,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: width/3,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(btnnName),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(darkYellow),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: darkYellow,
            radius: 40,
            child: Container(
                width: width / 3,
                height: height / 7,
                child: Lottie.asset('assets/cancel.json')),
          ),
        ),
      ],
    );
  }
}
