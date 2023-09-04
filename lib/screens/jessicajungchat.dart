import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/chat/doctorinfomation.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../custtom/doctorlistappbar.dart';
import '../stringfile/enstring.dart';

class JessicaJungChat extends StatefulWidget {
  const JessicaJungChat({Key? key}) : super(key: key);

  @override
  State<JessicaJungChat> createState() => _JessicaJungChatState();
}

class _JessicaJungChatState extends State<JessicaJungChat> {
  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        floatingActionButton: Container(
          height: height / 17,
          width: width / 1.1,
          decoration: BoxDecoration(
            color: const Color(0xfff8f8f8),
            borderRadius: BorderRadius.all(
              Radius.circular(13.sp),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: width / 50),
              Icon(
                Icons.camera_alt_outlined,
                color: notifier.getgrey,
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 40),
                    child: TextField(
                      style: TextStyle(color: notifier.getblack),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: notifier.getgrey),
                          hintText: EnString.howLike,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.send,
                color: notifier.getgrey,
              ),
              SizedBox(width: width / 50),
            ],
          ),
        ),
        appBar: Doctorlistappbar(
          notifier.getwihitecolor,
          EnString.jung,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          GestureDetector(
            onTap: () {
              Get.to(const Doctorinfo());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/about.png", scale: 3.5),
            ),
          ),
          // "assets/about.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 30),
              Row(
                children: [
                  SizedBox(width: width / 100),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 15, left: width / 40, right: width / 40),
                    child: Image.asset(
                      "assets/Avatar.png",
                      height: height / 20,
                    ),
                  ),
                  Container(
                    height: height / 10,
                    width: width / 2,
                    decoration: BoxDecoration(
                      color: notifier.getchatcolor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.sp),
                        bottomRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        EnString.howHealth,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Gilroy_Medium',
                            color: notifier.getblack),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height / 10,
                    width: width / 2,
                    decoration: BoxDecoration(
                      color: notifier.getperple,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        EnString.howHealth,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Gilroy_Medium',
                            color: notifier.getwihitecolor),
                      ),
                    ),
                  ),
                  SizedBox(width: width / 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget typemessege() {
    return ScreenUtilInit(
      builder: (_ , child)  => Center(
        child: Container(
          height: height / 17,
          width: width / 1.1,
          decoration: BoxDecoration(
            color: const Color(0xfff8f8f8),
            borderRadius: BorderRadius.all(
              Radius.circular(13.sp),
            ),
          ),
          child: Row(
            children: [
              Container(
                color: Colors.transparent,
                height: height / 15,
                width: width / 1,
                child: Padding(
                  padding: EdgeInsets.only(left: width / 40),
                  child: TextField(
                    style: TextStyle(color: notifier.getblack),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: notifier.getgrey),
                        hintText: EnString.search,
                        border: InputBorder.none),
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: notifier.getperple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
