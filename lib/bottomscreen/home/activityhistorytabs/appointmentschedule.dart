import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/payschedule.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Appointmentschedule extends StatefulWidget {
  const Appointmentschedule({Key? key}) : super(key: key);

  @override
  State<Appointmentschedule> createState() => _AppointmentscheduleState();
}

class _AppointmentscheduleState extends State<Appointmentschedule> {
  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: Column(
          children: [
            SizedBox(height: height / 20),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 5, left: width / 50),
                  child: Center(
                    child: Card(
                      elevation: 1.5.sp,
                      color: notifier.getwihitecolor,
                      child: Container(
                        color: Colors.transparent,
                        height: height / 3.8,
                        width: width / 1.1,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: height / 17),
                    Center(
                      child:
                          Image.asset("assets/sedual.png", height: height / 4),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: height / 3),
                    Center(
                        child: Text(
                      EnString.doNot,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifier.getblack,
                          fontFamily: 'Gilroy_Bold'),
                    )),
                    SizedBox(height: height / 200),
                    Text(
                      EnString
                          .bookHealth,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width / 22, right: width / 50),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            const Payschedule(),
                          );
                        },
                        child: Button(
                            EnString.makeAppointment,
                            notifier.getperple,
                            notifier.getwihitecolor,
                            0,
                            Colors.transparent),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
