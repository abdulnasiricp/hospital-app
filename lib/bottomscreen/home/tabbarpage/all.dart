import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../../custtom/doctorlist/custtomdoctorlist.dart';
import '../../../utils/mediaqury.dart';
import '../service.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Get.to(
              const Service(),
            );
          },
          child: Column(
            children: [
              Doctorlist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.drDon,
                  EnString.ang,
                  "2 km",
                  width / 7),
              Doctorlist(
                  "assets/drtwo.png",
                  Colors.transparent,
                  EnString.drJustin,
                  EnString.ang,
                  "2 km",
                  width / 7),
              Doctorlist("assets/drthree.png", Colors.transparent,
                  EnString.drMaria, EnString.ang, "2 km", width / 7),
              Doctorlist(
                  "assets/drfive.png",
                  Colors.transparent,
                  EnString.drChai,
                  EnString.ang,
                  "2 km",
                  width / 7),
              Doctorlist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.dr,
                  EnString.ang,
                  "2 km",
                  width / 7),
              Doctorlist(
                  "assets/drtwo.png",
                  Colors.transparent,
                  EnString.drJustin,
                  EnString.ang,
                  "2 km",
                  width / 7),
            ],
          ),
        ),
      ),
    );
  }
}
