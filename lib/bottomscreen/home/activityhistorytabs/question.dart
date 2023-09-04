import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/questionsfordoctors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../../custtom/custtomdoctorexpriancecard.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const QuestionsForDoctors());
                    },
                    child: selection(
                        const Color(0xffedf2fe),
                        Icons.person_outline,
                        const Color(0xff679cff),
                        "1000+",
                        "patients",
                        height / 8,
                        width / 4,
                        height / 17,
                        width / 8,
                        20.sp,
                        15.sp,
                        11.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QuestionsForDoctors());
                    },
                    child: selection(
                        const Color(0xfffef0f2),
                        Icons.account_tree_outlined,
                        const Color(0xfffe79bc),
                        "5 yr+",
                        "Experience",
                        height / 8,
                        width / 4,
                        height / 17,
                        width / 8,
                        20.sp,
                        15.sp,
                        11.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QuestionsForDoctors());
                    },
                    child: selection(
                        const Color(0xfffef6ec),
                        Icons.star_border,
                        const Color(0xffffd237),
                        "4.9",
                        "Rating",
                        height / 8,
                        width / 4,
                        height / 17,
                        width / 8,
                        20.sp,
                        15.sp,
                        11.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QuestionsForDoctors());
                    },
                    child: selection(
                        const Color(0xffedf2fe),
                        Icons.person_outline,
                        const Color(0xff679cff),
                        "250+",
                        "patients",
                        height / 8,
                        width / 4,
                        height / 17,
                        width / 8,
                        20.sp,
                        15.sp,
                        11.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ),
                  SizedBox(width: width / 15),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QuestionsForDoctors());
                    },
                    child: selection(
                        const Color(0xfffef0f2),
                        Icons.account_tree_outlined,
                        const Color(0xfffe79bc),
                        "7 yr+",
                        "Experience",
                        height / 8,
                        width / 4,
                        height / 17,
                        width / 8,
                        20.sp,
                        15.sp,
                        11.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ),
                ],
              )
            ],
          ),
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
