import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/address.dart';
import 'package:TezHealthCare/custtom/doctorlistappbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class QuestionsForDoctors extends StatefulWidget {
  const QuestionsForDoctors({Key? key}) : super(key: key);

  @override
  State<QuestionsForDoctors> createState() => _QuestionsForDoctorsState();
}

class _QuestionsForDoctorsState extends State<QuestionsForDoctors> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: Doctorlistappbar(
          notifier.getwihitecolor,
          EnString.questions,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          GestureDetector(
            // onTap: () {
            //   Get.to(const Doctorinfo());
            // },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/about.png", scale: 3.5),
            ),
          ),
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const Address());
                  },
                  child: Card(
                    color: notifier.getwihitecolor,
                    child: Container(
                      color: Colors.transparent,
                      height: height / 7,
                      width: width / 1.1,
                      child: Column(
                        children: [
                          SizedBox(height: height / 80),
                          Row(
                            children: [
                              SizedBox(width: width / 50),
                              Image.asset("assets/Avatar.png",
                                  height: height / 15),
                              SizedBox(width: width / 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height / 100),
                                  Text(
                                    EnString.jung,
                                    style: TextStyle(
                                        color: notifier.getblack,
                                        fontSize: 15.sp,
                                        fontFamily: 'Gilroy_Bold'),
                                  ),
                                  SizedBox(height: height / 150),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: notifier.getperple,
                                        size: 18.sp,
                                      ),
                                      SizedBox(width: width / 200),
                                      Text(
                                        EnString.male,
                                        style: TextStyle(
                                            color: notifier.getgrey,
                                            fontSize: 12.5.sp),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height / 200),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: const Color(0xffFF6F5B),
                                        size: 18.sp,
                                      ),
                                      SizedBox(width: width / 200),
                                      Text(
                                        "21/09/1999",
                                        style: TextStyle(
                                            color: notifier.getgrey,
                                            fontSize: 12.5.sp),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Card(
                color: notifier.getwihitecolor,
                child: Container(
                  color: Colors.transparent,
                  height: height / 3,
                  width: width / 1.1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 50),
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: notifier.getgrey),
                              border: InputBorder.none,
                              hintText: EnString.typeSomething),
                          maxLines: 7,
                        ),
                      ),
                      SizedBox(height: height / 25),
                      Container(
                        height: height / 16,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.sp),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width / 25),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: notifier.getgrey,
                              size: 19.sp,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.send_sharp,
                              color: notifier.getgrey,
                              size: 19.sp,
                            ),
                            SizedBox(width: width / 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
