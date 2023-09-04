import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/activityhistory.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.search,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: height/70),
              // serchfild(),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const ActivityHistory());
                    },
                    child: selection(
                      const Color(0xffe7e5ff),
                      "assets/orthopodist.png",
                      const Color(0xff679cff),
                      EnString.auth,
                      "",
                      height / 8,
                      width / 4,
                      height / 17,
                      width / 8,
                      20.sp,
                      12.sp,
                      11.sp,
                      notifier.getblack,
                      notifier.getgrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const ActivityHistory());
                    },
                    child: selection(
                      const Color(0xffffe2de),
                      "assets/surgeon.png",
                      const Color(0xfffe79bc),
                      EnString.surgeon,
                      " ",
                      height / 8,
                      width / 4,
                      height / 17,
                      width / 8,
                      20.sp,
                      13.sp,
                      11.sp,
                      notifier.getblack,
                      notifier.getgrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const ActivityHistory());
                    },
                    child: selection(
                      const Color(0xffd4faff),
                      "assets/teath.png",
                      const Color(0xffffd237),
                      EnString.dentist,
                      "",
                      height / 8,
                      width / 4,
                      height / 17,
                      width / 8,
                      20.sp,
                      13.sp,
                      11.sp,
                      notifier.getblack,
                      notifier.getgrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(const ActivityHistory());
                    },
                    child: selection(
                      const Color(0xffe7e5ff),
                      "assets/hart.png",
                      const Color(0xff679cff),
                      EnString.auth,
                      "",
                      height / 8,
                      width / 4,
                      height / 17,
                      width / 8,
                      20.sp,
                      13.sp,
                      11.sp,
                      notifier.getblack,
                      notifier.getgrey,
                    ),
                  ),
                  SizedBox(width: width / 15),
                  GestureDetector(
                    onTap: () {
                      Get.to(const ActivityHistory());
                    },
                    child: selection(
                      const Color(0xffffe2de),
                      "assets/Thanks.png",
                      const Color(0xfffe79bc),
                      EnString.auth,
                      "",
                      height / 8,
                      width / 4,
                      height / 17,
                      width / 8,
                      20.sp,
                      13.sp,
                      11.sp,
                      notifier.getblack,
                      notifier.getgrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selection(
      color,
      icon,
      iconcolor,
      txt,
      exp,
      mainheight,
      mainwidth,
      underheight,
      underwidth,
      iconsize,
      fontsize,
      expiconsize,
      titlecolor,
      subtitlecolor) {
    return ScreenUtilInit(
      builder: (_ , child)  => Card(
        color: notifier.getwihitecolor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: mainheight,
              width: mainwidth,
              child: Column(
                children: [
                  Container(
                      height: underheight,
                      width: underwidth,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.sp),
                          bottomLeft: Radius.circular(15.sp),
                        ),
                      ),
                      child: Image.asset(icon, scale: 5)),
                  SizedBox(height: height / 80),
                  Text(
                    txt,
                    style: TextStyle(
                        color: titlecolor,
                        fontSize: fontsize,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                  SizedBox(height: height / 300),
                  Text(
                    exp,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: subtitlecolor,
                        fontSize: expiconsize,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget catogery(ht, wt, image, txt) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(11.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(11.sp),
                ),
              ),
              height: ht,
              width: wt,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: width / 13),
                  child: Text(
                    txt,
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium',
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width / 40),
          child: Image.asset(image, height: height / 22),
        )
      ],
    );
  }
}
