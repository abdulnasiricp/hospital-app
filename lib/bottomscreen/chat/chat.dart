import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/custtom/doctorlistappbar.dart';
import 'package:TezHealthCare/screens/jessicajungchat.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../custtom/doctorlist/custtomdoctorchatlist.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: Doctorlistappbar(
          notifier.getwihitecolor,
          EnString.chat,
          notifier.getblack,
          "assets/pro.png",
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset("assets/chatperson.png", scale: 3.5),
          ),
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 30),
              serchfild(),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drone.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drtwo.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drthree.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drfive.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drthree.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const JessicaJungChat(),
                  );
                },
                child: const Custtomdoctorchat(
                    "assets/drone.png",
                    Colors.transparent,
                    EnString.jung,
                    EnString.youLike,
                    "12:35"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serchfild() {
    return Center(
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
              height: height / 8,
              width: width / 1.3,
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
    );
  }
}
