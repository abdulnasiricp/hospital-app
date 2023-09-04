import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custtom/custtombutton.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  late ColorNotifier notifier;
  bool selectedindex = false;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.forgotPassword,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 25),
              Row(
                children: [
                  SizedBox(width: width / 20),
                  Text(
                    EnString.details,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy_Medium',
                        color: notifier.getblack),
                  ),
                ],
              ),
              SizedBox(height: height / 30),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedindex = !selectedindex;
                    });
                  },
                  child: types("assets/sms.png", "Via sms:", "+123 456789",
                      selectedindex ? notifier.getperple : Colors.transparent)),
              SizedBox(height: height / 100),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedindex = !selectedindex;
                    });
                  },
                  child: types(
                      "assets/email.png",
                      "Via Email:",
                      "dremospace@gmail.com",
                      selectedindex ? Colors.transparent : notifier.getperple)),
              SizedBox(height: height / 3.2),
              GestureDetector(
                  onTap: () {
                    Get.to(const Bottomhome());
                  },
                  child: Button("Continue", notifier.getperple,
                      notifier.getwihitecolor, 0, Colors.transparent))
            ],
          ),
        ),
      ),
    );
  }

  Widget types(image, txt, numb, color) {
    return Card(
      color: notifier.getwihitecolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.sp),
        ),
      ),
      child: Container(
        height: height / 8,
        width: width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.sp),
            ),
            border: Border.all(color: color)),
        child: Row(
          children: [
            SizedBox(width: width / 35),
            Center(
                child: Image.asset(
              image,
              height: height / 14,
              color: notifier.getperple,
            )),
            SizedBox(width: width / 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 35),
                Text(
                  txt,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy_Medium'),
                ),
                SizedBox(height: height / 300),
                Text(
                  numb,
                  style: TextStyle(
                      color: notifier.getblack,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy_Medium'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
