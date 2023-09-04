import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/myappoiment.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Paymentsuccessfuly extends StatefulWidget {
  const Paymentsuccessfuly({Key? key}) : super(key: key);

  @override
  State<Paymentsuccessfuly> createState() => _PaymentsuccessfulyState();
}

class _PaymentsuccessfulyState extends State<Paymentsuccessfuly> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        // appBar: CustomAppBar(
        //   Colors.transparent,
        //   EnString.Payment,
        //   notifier.getblack,
        //   "assets/doctorlistbackarrow.png",
        //   height: height / 15,
        // ),
        body: Column(
          children: [
            SizedBox(height: height / 7),
            Stack(
              children: [
                Container(
                    color: Colors.transparent,
                    height: height / 1.7,
                    width: width / 1,
                    child: notifier.isDark
                        ? Image.asset("assets/CombinedShape.png",
                            color: notifier.getwihitecolor)
                        : Image.asset("assets/CombinedShape.png")),
                Column(
                  children: [
                    SizedBox(height: height / 12),
                    Image.asset("assets/success.png", height: height / 7),
                    Text(
                      EnString.paymentSuccess,
                      style:
                          TextStyle(fontSize: 20.sp, fontFamily: 'Gilroy_Bold'),
                    ),
                    SizedBox(height: height / 50),
                    Text(
                      EnString
                          .successfully,
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontSize: 15.sp,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 22,
                          left: width / 14,
                          right: width / 10.5),
                      child: Divider(
                        thickness: 0.80,
                        color: notifier.getgrey,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: height / 70),
                            Row(
                              children: [
                                SizedBox(width: width / 8),
                                Icon(Icons.person_outline,
                                    color: notifier.getperple, size: 22.sp),
                                SizedBox(width: width / 50),
                                Text(
                                  EnString.drMaria,
                                  style: TextStyle(
                                      fontFamily: 'Gilroy_Medium',
                                      fontSize: 13.sp),
                                )
                              ],
                            ),
                            SizedBox(height: height / 100),
                            Row(
                              children: [
                                SizedBox(width: width / 10),
                                Icon(Icons.calendar_today_outlined,
                                    color: notifier.getperple, size: 22.sp),
                                SizedBox(width: width / 50),
                                Text(
                                  "15 June, 2022",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy_Medium',
                                      fontSize: 13.sp),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: height / 70),
                            Row(
                              children: [
                                SizedBox(width: width / 12),
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: notifier.getperple, size: 22.sp),
                                SizedBox(width: width / 50),
                                Text(
                                  "33 USD",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy_Medium',
                                      fontSize: 13.sp),
                                )
                              ],
                            ),
                            SizedBox(height: height / 100),
                            Row(
                              children: [
                                SizedBox(width: width / 10.5),
                                Icon(Icons.timer_outlined,
                                    color: notifier.getperple, size: 22.sp),
                                SizedBox(width: width / 50),
                                Text(
                                  "10.00 AM",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy_Medium',
                                      fontSize: 13.sp),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Get.to(const MyAppoiment());
                },
                child: Button(EnString.seeAppointment, notifier.getperple,
                    notifier.getwihitecolor, 0, Colors.transparent)),
            GestureDetector(
                onTap: () {
                  Get.to(const Bottomhome());
                },
                child: dashbordbutton())
          ],
        ),
      ),
    );
  }

  Widget dashbordbutton() {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        // print(constraints);
        return Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: height / 15,
              width: width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                border: Border.all(color: notifier.getperple),
                color: notifier.getwihitecolor,
                // borderRadius: 10,
              ),
              child: Center(
                child: Text(
                  EnString.home,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Gilroy_Medium',
                      fontSize: 15.sp,
                      color: notifier.getblack),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
