import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/paymentsuccessfuly.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late ColorNotifier notifier;
  bool selectedindex = false;
  bool selectedindex1 = false;
  bool selectedindex2 = false;
  bool selectedindex3 = false;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
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
                    child: CustomAppBar(Colors.transparent, EnString.payment,
                        notifier.getwihitecolor, "assets/ic_back.png",
                        height: height / 15),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height / 6.7),
                      Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: Center(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: height / 2.5,
                                width: width / 1,
                                child: Image.asset("assets/paymentcard.png",color: notifier.getwihitecolor),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: height / 24),
                                  Row(
                                    children: [
                                      SizedBox(width: width / 10),
                                      Image.asset("assets/Avatar.png",
                                          height: height / 17),
                                      SizedBox(width: width / 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EnString.jung,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: notifier.getblack,
                                                fontFamily: 'Gilroy_Bold'),
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_outline,
                                                color: notifier.getperple,
                                                size: 15.sp,
                                              ),
                                              SizedBox(width: width / 100),
                                              Text(
                                                EnString.male,
                                                style: TextStyle(
                                                    color: notifier.getgrey,
                                                    fontFamily: 'Gilroy_Medium',
                                                    fontSize: 13.sp),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color: const Color(0xffFF6F5B),
                                                size: 15.sp,
                                              ),
                                              SizedBox(width: width / 100),
                                              Text(
                                                EnString.date,
                                                style: TextStyle(
                                                    color: notifier.getgrey,
                                                    fontFamily: 'Gilroy_Medium',
                                                    fontSize: 13.sp),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height / 75),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 12, right: width / 9),
                                    child: Divider(
                                        thickness: 0.10.sp,
                                        color: notifier.getgrey),
                                  ),
                                  SizedBox(height: height / 50),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: width / 11),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EnString.sampleTime,
                                            style: TextStyle(
                                                color: notifier.getblack,
                                                fontSize: 15.sp,
                                                fontFamily: 'Gilroy_Bold'),
                                          ),
                                          SizedBox(height: height / 70),
                                          Row(
                                            children: [
                                              Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: notifier.getperple,
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                "2020/09/18",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(Icons.timer_outlined,
                                                  color:
                                                      const Color(0xffFF6F5B),
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                "08:00 am",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                  color:
                                                      const Color(0xff2AD3E7),
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                EnString.hospital,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EnString.checkTime,
                                            style: TextStyle(
                                                color: notifier.getblack,
                                                fontSize: 15.sp,
                                                fontFamily: 'Gilroy_Bold'),
                                          ),
                                          SizedBox(height: height / 70),
                                          Row(
                                            children: [
                                              Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: notifier.getperple,
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                "14:00 pm",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(Icons.timer_outlined,
                                                  color:
                                                      const Color(0xffFF6F5B),
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                "08:00 am",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 100),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                  color:
                                                      const Color(0xff2AD3E7),
                                                  size: 16.sp),
                                              SizedBox(width: width / 70),
                                              Text(
                                                EnString.hospital,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Gilroy_Medium',
                                                    color: notifier.getgrey),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: width / 5),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              healthexamination(),
              SizedBox(height: height / 50),
              discount(),
              SizedBox(height: height / 50),
              paymentmethod(),
              SizedBox(height: height / 50),
              total(),
              SizedBox(height: height / 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget healthexamination() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 10,
        width: width / 1.2,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/drtwo.png")),
            SizedBox(width: width / 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 60),
                Text(
                  EnString.basicHealth,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 14.sp),
                ),
                SizedBox(height: height / 90),
                Row(
                  children: [
                    Image.asset("assets/tag.png", height: height / 30),
                    Text(
                      EnString.price,
                      style:
                          TextStyle(color: notifier.getgrey, fontSize: 13.sp),
                    ),
                    SizedBox(width: width / 3.7),
                    Text(
                      "\$ 1200",
                      style: TextStyle(
                          color: notifier.getperple,
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 14.sp),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget discount() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 8,
        width: width / 1.2,
        child: Column(
          children: [
            SizedBox(height: height / 80),
            Row(
              children: [
                SizedBox(width: width / 17),
                Text(
                  EnString.discount,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
              ],
            ),
            SizedBox(height: height / 70),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.all(Radius.circular(11.sp))),
              height: height / 20,
              width: width / 1.4,
              child: Padding(
                padding: EdgeInsets.only(left: width / 40),
                child: TextField(
                  style: TextStyle(color: notifier.getblack),
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: EnString.promotionCode,
                      border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentmethod() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 8,
        width: width / 1.2,
        child: Column(
          children: [
            SizedBox(height: height / 80),
            Row(
              children: [
                SizedBox(width: width / 17),
                Text(
                  EnString.paymentMethod,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            GestureDetector(
              onTap: () {
                _showMyDialog();
              },
              child: Container(
                height: height / 19,
                width: width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                  border: Border.all(color: notifier.getgrey),
                ),
                child: Row(
                  children: [
                    SizedBox(width: width / 40),
                    Image.asset("assets/pay.png", height: height / 30),
                    SizedBox(width: width / 50),
                    Text(
                      EnString.visaMastercard,
                      style:
                          TextStyle(color: notifier.getgrey, fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 15.sp, color: notifier.getperple),
                    SizedBox(width: width / 45),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget total() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 6.7,
        width: width / 1.2,
        child: Column(
          children: [
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 50),
                Text(
                  EnString.total,
                  style: TextStyle(
                      color: notifier.getgrey,
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy_Medium'),
                ),
                const Spacer(),
                Text(
                  "\$ 1200",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy_Bold',
                      color: notifier.getperple),
                ),
                SizedBox(width: width / 30),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.to(const Paymentsuccessfuly());
              },
              child: Button(EnString.payment, notifier.getperple,
                  notifier.getwihitecolor, 0, Colors.transparent),
            )
          ],
        ),
      ),
    );
  }

  _showMyDialog() async {
    return showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: notifier.getwihitecolor,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.transparent,
                height: height / 3.2,
                width: width / 1.1,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = !selectedindex;
                        });
                      },
                      child: locatename(
                          EnString.visaMastercard,
                          selectedindex
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex ? notifier.getblack : notifier.getgrey,
                          selectedindex ? notifier.getblack : notifier.getgrey,
                          "assets/pay.png"),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex1 = !selectedindex1;
                        });
                      },
                      child: locatename(
                          EnString.domesticATM,
                          selectedindex1
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex1 ? notifier.getblack : notifier.getgrey,
                          selectedindex1 ? notifier.getblack : notifier.getgrey,
                          "assets/pay.png"),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex2 = !selectedindex2;
                        });
                      },
                      child: locatename(
                          EnString.wallet,
                          selectedindex2
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex2 ? notifier.getblack : notifier.getgrey,
                          selectedindex2 ? notifier.getblack : notifier.getgrey,
                          "assets/wallet.png"),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex3 = !selectedindex3;
                        });
                      },
                      child: locatename(
                          EnString.cash,
                          selectedindex3
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex3 ? notifier.getblack : notifier.getgrey,
                          selectedindex3 ? notifier.getblack : notifier.getgrey,
                          "assets/cash.png"),
                    ),
                    SizedBox(height: height / 40),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: dailogbutton(notifier.getwihitecolor,
                                EnString.cancel, notifier.getperple),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: dailogbutton(notifier.getperple,
                                EnString.selects, notifier.getwihitecolor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.sp),
            ),
          ),
          title: Text(
            EnString.payments,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: notifier.getblack,
                fontFamily: 'Gilroy_Bold',
                fontSize: 17.sp),
          ),
        );
      },
    );
  }

  Widget dailogbutton(colorr, txt, buttontextcolor) {
    return Container(
      height: height / 17,
      width: width / 3.4,
      decoration: BoxDecoration(
        border: Border.all(color: notifier.getperple, width: 1.sp),
        color: colorr,
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              color: buttontextcolor,
              fontFamily: 'Gilroy_Medium',
              fontSize: 13.sp),
        ),
      ),
    );
  }

  Widget locatename(txt, iconcolor, textcolor, locationcolor, image) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              image,
              height: height / 40,
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
}
