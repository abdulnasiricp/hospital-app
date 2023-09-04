import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../custtom/appbar.dart';
import '../custtom/custtombutton.dart';
import '../stringfile/enstring.dart';
import '../utils/mediaqury.dart';

class Veryfiyyournumber extends StatefulWidget {
  const Veryfiyyournumber({Key? key}) : super(key: key);

  @override
  State<Veryfiyyournumber> createState() => _VeryfiyyournumberState();
}

class _VeryfiyyournumberState extends State<Veryfiyyournumber> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(backgroundColor: notifier.getwihitecolor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height / 2.8,
                  decoration: BoxDecoration(
                    color: notifier.getperple,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.sp),
                      bottomLeft: Radius.circular(30.sp),
                    ),
                  ),
                  child: CustomAppBar(
                      Colors.transparent,
                      EnString.verifyYourNumber,
                      notifier.getwihitecolor,
                      "assets/ic_back.png",
                      height: height / 15),
                ),
                Column(
                  children: [
                    SizedBox(height: height / 5),
                    Center(
                      child: Stack(
                        children: [
                          Center(
                            child: Card(
                              elevation: 1.sp,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Container(
                                height: height / 4,
                                width: width / 1.1,
                                decoration: BoxDecoration(color: notifier.getwihitecolor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.sp),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: height / 50),
                                    Text(
                                      EnString
                                          .entertheverifynumberthatsenttoyourphonerecently,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: notifier.getgrey,
                                          fontSize: 14.sp,
                                          fontFamily: 'Gilroy_Medium'),
                                    ),
                                    SizedBox(height: height / 50),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height / 9,
                                left: width / 10,
                                right: width / 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                otpfild(),
                                otpfild(),
                                otpfild(),
                                otpfild(),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: height / 5.5),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      const Veryfiyyournumber(),
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(const Bottomhome());
                                    },
                                    child: Button(
                                        EnString.confirm,
                                        notifier.getperple,
                                        notifier.getwihitecolor,
                                        0,
                                        Colors.transparent),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget otpfild() {
    return Container(
      height: height / 17,
      width: width / 8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.sp),
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.sp),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
