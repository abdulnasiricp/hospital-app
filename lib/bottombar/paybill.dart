import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class PayBill extends StatefulWidget {
  const PayBill({Key? key}) : super(key: key);

  @override
  State<PayBill> createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {

  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder:(_ , child) => Scaffold(backgroundColor: notifier.getwihitecolor,
        body: Column(
          children: [
            SizedBox(height: height/70),
            Row(
              children: [
                SizedBox(width: width / 11),
                Text(
                  EnString.september,
                  style:
                  TextStyle(fontSize: 15.sp, fontFamily: 'Gilroy_Bold',color: notifier.getblack),
                )
              ],
            ),
            SizedBox(height: height / 50),
            Card(color: notifier.getwihitecolor,
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
            )
          ],
        ),
      ),
    );
  }
}
