import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/screens/jessicajungchat.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
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
      builder: (_, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
       
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: const Color(0xfff8f8f8),
            border: Border.all(),
            borderRadius: BorderRadius.all(
              Radius.circular(13.sp),
            ),
          ),
          child: Row(
            children: [
              Container(
                color: Colors.transparent,
                height: 50,
                width: 300,
                child: Padding(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.only(left: 10),
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
