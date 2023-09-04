import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/activityhistorytabs/bill.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../custtom/sedualappbar.dart';
import '../../stringfile/enstring.dart';
import '../../utils/mediaqury.dart';

class Payschedule extends StatefulWidget {
  const Payschedule({Key? key}) : super(key: key);

  @override
  State<Payschedule> createState() => _PayscheduleState();
}

class _PayscheduleState extends State<Payschedule> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child) => Scaffold(backgroundColor: notifier.getwihitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 4.2,
                    decoration: BoxDecoration(
                      color: notifier.getperple,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.sp),
                        bottomLeft: Radius.circular(30.sp),
                      ),
                    ),
                    child: CidualCustomAppBar(
                        Colors.transparent,
                        EnString.sche,
                        notifier.getwihitecolor,
                        "assets/timehistry.png",
                        height: height / 15),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height / 5.6),
                      Center(
                        child: Card(color: notifier.getwihitecolor,
                          child: Container(
                            color: Colors.transparent,
                            height: height / 7.5,
                            width: width / 1.2,
                            child: Row(

                              children: [
                                SizedBox(width: width/14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: height / 50),
                                    Image.asset("assets/waypay.png",
                                        height: height / 18),
                                    SizedBox(height: height / 100),
                                    Text(
                                      EnString.waitPay,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: notifier.getperple,
                                          fontFamily: 'Gilroy_Medium'),
                                    )
                                  ],
                                ),
                                SizedBox(width: width/13),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: height / 50),
                                    Image.asset("assets/Endocrine.png",
                                        height: height / 18),
                                    SizedBox(height: height / 100),
                                    Text(
                                      EnString.crime,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: notifier.getgrey,
                                          fontFamily: 'Gilroy_Medium'),
                                    )
                                  ],
                                ),
                                SizedBox(width: width/13),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: height / 50),
                                    Image.asset("assets/Dentist.png",
                                        height: height / 18),
                                    SizedBox(height: height / 100),
                                    Text(
                                      EnString.dentist,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: notifier.getgrey,
                                          fontFamily: 'Gilroy_Medium'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 35),
              Row(
                children: [
                  SizedBox(width: width / 13.5),
                  Text(
                    EnString.paymentProgress,
                    style:
                        TextStyle(fontSize: 15.sp, fontFamily: 'Gilroy_Bold'),
                  )
                ],
              ),
              SizedBox(height: height / 50),
              GestureDetector(
                onTap: () {
                  Get.to(const ActivityBill());
                },
                child: Card(color: notifier.getwihitecolor,
                  child: Container(
                    color: Colors.transparent,
                    height: height / 7,
                    width: width / 1.2,
                    child: Column(
                      children: [
                        SizedBox(height: height / 80),
                        Row(
                          children: [
                            SizedBox(width: width / 30),
                            Text(
                              EnString.paymentCode,
                              style: TextStyle(
                                  color: notifier.getgrey,
                                  fontSize: 15.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                            const Spacer(),
                            Text(
                              "#0012345678",
                              style: TextStyle(
                                  color: notifier.getblack,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                            SizedBox(width: width / 50),
                          ],
                        ),
                        SizedBox(height: height / 100),
                        Row(
                          children: [
                            SizedBox(width: width / 30),
                            Icon(Icons.calendar_today,
                                color: notifier.getperple, size: 20.sp),
                            SizedBox(width: width / 100),
                            Text(
                              EnString.schedule,
                              style: TextStyle(
                                  color: notifier.getgrey,
                                  fontSize: 13.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            )
                          ],
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          children: [
                            SizedBox(width: width / 30),
                            Text(
                              EnString.total,
                              style: TextStyle(
                                  color: notifier.getblack,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                            SizedBox(width: width / 40),
                            Text(
                              "\$ 1200",
                              style: TextStyle(
                                  color: notifier.getperple,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Bold'),
                            ),
                            SizedBox(width: width / 3.3),
                            Container(
                              height: height / 30,
                              width: width / 4.2,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFF7DF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.sp),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  EnString.waitPay,
                                  style: TextStyle(
                                      color: const Color(0xffFFC107),
                                      fontSize: 11.sp,
                                      fontFamily: 'Gilroy_Medium'),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
