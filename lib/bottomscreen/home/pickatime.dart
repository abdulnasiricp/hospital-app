import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/addressupdates.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/custtom/doctorlist/custtomdoctorlist.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class PickATime extends StatefulWidget {
  const PickATime({Key? key}) : super(key: key);

  @override
  State<PickATime> createState() => _PickATimeState();
}

class _PickATimeState extends State<PickATime> {
  late ColorNotifier notifier;
  int selectedindex = -1;
  int selectedindex2 = -1;
  int selectedindex3 = -1;
  int selectedindex4 = -1;

  List time = [
    "Mon\n\n09/09",
    "Tue\n\n10/09",
    "Wed\n\n11/09",
    "Thu\n\n12/09",
    "Fri\n\n13/09"
  ];

  List timerr = ["06:00 AM", "06:30 AM", "07:00 AM", "07:30 AM"];
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.to(const AddressUpdates());
          },
          child: SizedBox(
            height: height / 8,
            width: width / 1.1,
            child: Button(EnString.next, notifier.getperple,
                notifier.getwihitecolor, 2.sp, notifier.getwihitecolor),
          ),
        ),
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.pickTime,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Doctorlist(
                    "assets/ucla.png",
                    Colors.transparent,
                    EnString.columbiaAsiaHospital,
                    EnString.bangaloreKarnataka,
                    "16 km",
                    width / 7),
              ),
              SizedBox(height: height / 100),
              sampletime(),
              SizedBox(height: height / 100),
              checktime(),
              SizedBox(height: height / 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget sampletime() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 2.5,
        width: width / 1.1,
        child: Column(
          children: [
            SizedBox(height: height / 30),
            Row(
              children: [
                SizedBox(width: width / 40),
                Text(
                  EnString.sampleTime,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 17.sp),
                ),
                const Spacer(),
                Text(
                  EnString.september,
                  style: TextStyle(
                      color: notifier.getgrey,
                      fontFamily: 'Gilroy_Medium',
                      fontSize: 13.sp),
                ),
                // SizedBox(width: width / 30),
              ],
            ),
            SizedBox(height: height / 40),
            Container(
              color: Colors.transparent,
              height: height / 10,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: width / 70),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });
                        },
                        child: Container(
                          height: height / 12,
                          width: width / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                            color: selectedindex == index
                                ? const Color(0xff2AD3E7)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              time[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Medium',
                                  color: selectedindex == index
                                      ? notifier.getwihitecolor
                                      : notifier.getgrey,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height / 100),
            Row(
              children: [
                SizedBox(width: width / 40),
                Text(
                  EnString.time,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 17.sp),
                ),
              ],
            ),
            SizedBox(height: height / 40),
            SizedBox(
              height: height / 8,
              width: width / 1.1,
              child: timer(),
            ),
            SizedBox(height: height / 40),
          ],
        ),
      ),
    );
  }

  Widget checktime() {
    return Card(
      color: notifier.getwihitecolor,
      child: Container(
        color: Colors.transparent,
        height: height / 2.5,
        width: width / 1.1,
        child: Column(
          children: [
            SizedBox(height: height / 30),
            Row(
              children: [
                SizedBox(width: width / 40),
                Text(
                  EnString.sampleTime,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 17.sp),
                ),
                const Spacer(),
                Text(
                  EnString.september,
                  style: TextStyle(
                      color: notifier.getgrey,
                      fontFamily: 'Gilroy_Medium',
                      fontSize: 13.sp),
                ),
                // SizedBox(width: width / 30),
              ],
            ),
            SizedBox(height: height / 40),
            Container(
              color: Colors.transparent,
              height: height / 10,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: width / 70),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex3 = index;
                          });
                        },
                        child: Container(
                          height: height / 12,
                          width: width / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                            color: selectedindex3 == index
                                ? const Color(0xff2AD3E7)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              time[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Medium',
                                  color: selectedindex3 == index
                                      ? notifier.getwihitecolor
                                      : notifier.getgrey,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height / 100),
            Row(
              children: [
                SizedBox(width: width / 40),
                Text(
                  EnString.time,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 17.sp),
                ),
              ],
            ),
            SizedBox(height: height / 40),
            SizedBox(
              height: height / 8,
              width: width / 1.1,
              child: timer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget timer() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: height / 15,
              mainAxisExtent: height / 7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 7),
          itemCount: timerr.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedindex2 = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: width / 50),
                decoration: BoxDecoration(
                  color: selectedindex2 == index
                      ? const Color(0xff2AD3E7)
                      : Colors.transparent,
                  border: Border.all(
                    color: notifier.getgrey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
                child: Center(
                  child: Text(
                    timerr[index],
                    style: TextStyle(
                        fontFamily: 'Gilroy_Medium',
                        color: selectedindex2 == index
                            ? notifier.getwihitecolor
                            : notifier.getgrey,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
