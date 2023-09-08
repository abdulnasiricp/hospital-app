import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/custtom/doctorratinglist.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../payschedule.dart';

class Past extends StatefulWidget {
  const Past({Key? key}) : super(key: key);

  @override
  State<Past> createState() => _PastState();
}

class _PastState extends State<Past> {
  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return  Scaffold(
      backgroundColor: notifier.getwihitecolor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Get.to(
              const Payschedule(),
            );
          },
          child: Column(
            children: [
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.jung,
                  EnString.youLike,
                  "12:35",width / 16),
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drtwo.png",
                  Colors.transparent,
                  EnString.push,
                  EnString.youLike,
                  "12:35",width / 33),
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.jung,
                  EnString.youLike,
                  "12:35",width / 16),
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.jung,
                  EnString.youLike,
                  "12:35",width / 16),
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drtwo.png",
                  Colors.transparent,
                  EnString.push,
                  EnString.youLike,
                  "12:35",width / 35),
              SizedBox(height: height / 150),
              Doctorratinglist(
                  "assets/drone.png",
                  Colors.transparent,
                  EnString.jung,
                  EnString.youLike,
                  "12:35",width / 18),
              SizedBox(height: height / 150),
            ],
          ),
        ),
      ),
    );
  }
}