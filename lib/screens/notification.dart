import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar:AppBar(title:  Text('notification'.tr),centerTitle: true,backgroundColor: darkYellow,),
        body: SingleChildScrollView(
          child: Column(
            children: [notificationcard()],
          ),
        ),
      ),
    );
  }

  Widget notificationcard() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: height / 15),
            Center(
              child: Card(
                elevation: 1.5.sp,
                color: notifier.getwihitecolor,
                child: Container(
                  color: Colors.transparent,
                  height: height / 7,
                  width: width / 1.1,
                  child: Column(
                    children: [
                      SizedBox(height: height / 25),
                      Text(
                        'ended'.tr,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: notifier.getblack,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                      SizedBox(height: height / 200),
                      Text(
                        
                          'please'.tr,
                        style: TextStyle(
                            fontSize: 14.5.sp,
                            fontFamily: 'Gilroy_Medium',
                            color: notifier.getgrey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: width / 10, top: height / 27),
          child: Image.asset("assets/notification.png", height: height / 17),
        )
      ],
    );
  }
}
