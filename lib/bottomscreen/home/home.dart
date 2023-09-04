import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/profile.dart';
import 'package:TezHealthCare/custtom/custtomdoctorexpriancecard.dart';
import 'package:TezHealthCare/custtom/doctorlist/custtomdoctorlist.dart';
import 'package:TezHealthCare/custtom/homeappbar/homeappbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../utils/mediaqury.dart';
import 'doctotlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ColorNotifier notifier;
  late List<AnimatedTextExample> _examples;
  int index = 0;
  int tapCount = 0;
  bool showImageWidget = false;
  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples(onTap: () {
      setState(() {
        tapCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[index];
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder:(ctx, child)=> Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: HomeCustomAppBar(
          Colors.transparent,
          "",
          Colors.transparent,
          "assets/pro.png",
          "assets/alarm.png",
          GestureDetector(
            onTap: () {
              Get.to(
                const Profile(),
              );
            },
            child: Image.asset("assets/pro.png", scale: 3.5),
          ),
          height: height / 15,
        ),

      ),
    );
  }

  Widget locatename(txt, iconcolor, textcolor, locationcolor) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20.sp,
              color: locationcolor,
            ),
            SizedBox(width: width / 100),
            Text(
              txt,
              style: TextStyle(
                  fontFamily: 'Gilroy_Medium',
                  fontSize: 14.5.sp,
                  color: textcolor),
            ),
            const Spacer(),
            Icon(
              Icons.done,
              size: 17.sp,
              color: iconcolor,
            )
          ],
        ),
      ),
    );
  }

  Widget doctorap(color, value, child) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: notifier.getgrey),
        borderRadius: BorderRadius.all(
          Radius.circular(13.sp),
        ),
      ),
      height: 50.0.h,
      width: 300.0.w,
      child: Center(
        key: ValueKey(value),
        child: child,
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

List<AnimatedTextExample> animatedTextExamples(
    {VoidCallback? onTap, context}) =>
    <AnimatedTextExample>[
      AnimatedTextExample(
        label: 'Rotate',
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(width: width / 30),
            Image.asset("assets/medical-history.png", height: height / 30),
            SizedBox(width: width / 40),
            Container(
              color: Colors.transparent,
              height: 200.h,
              width: 240.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText(EnString.meetDrChikanso,
                              textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                          RotateAnimatedText(EnString.drJustin,
                              textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                          RotateAnimatedText(EnString.drMaria,
                              textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                        ],
                        onTap: onTap,
                        isRepeatingAnimation: true,
                        totalRepeatCount: 10,
                      ),
                      SizedBox(width: width / 4),
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText("14:30 PM",
                              textStyle: TextStyle(
                                  color: const Color(0xff2AD3E7),
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                          RotateAnimatedText("1:45 PM",
                              textStyle: TextStyle(
                                  color: const Color(0xff2AD3E7),
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                          RotateAnimatedText("1:3 AM",
                              textStyle: TextStyle(
                                  color: const Color(0xff2AD3E7),
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold')),
                        ],
                        onTap: onTap,
                        isRepeatingAnimation: true,
                        totalRepeatCount: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
