import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/screens/auth/authwidget/authwidget.dart';
import 'package:TezHealthCare/screens/veryfiyyournumber.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/mediaqury.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late ColorNotifier notifier;
  String? _selectedindex;
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

  final List<Map> _myjson = [
    {
      'id': '1',
      'image': 'assets/flag.png',
      'Text': "+91",
    },
    {
      'id': '2',
      'image': 'assets/flagtwo.png.png',
      'Text': "+92",
    },
    {
      'id': '3',
      'image': 'assets/flagthree.jpg',
      'Text': "+93",
    },
    {
      'id': '4',
      'image': 'assets/flagfour.png',
      'Text': "+91",
    },
    {
      'id': '5',
      'image': 'assets/flagfive.png',
      'Text': "+95",
    }
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: SingleChildScrollView(
          child: Column(
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
                    child: CustomAppBar(Colors.transparent, EnString.signup,
                        notifier.getwihitecolor, "assets/ic_back.png",
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
                                color: notifier.getwihitecolor,
                                elevation: 1.sp,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.sp),
                                ),
                                child: Container(
                                  height: height / 4.8,
                                  width: width / 1.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.sp),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: height / 50),
                                      Row(
                                        children: [
                                          SizedBox(width: width / 20),
                                          Text(
                                            EnString.emailorphonenumber,
                                            style: TextStyle(
                                                color: notifier.getgrey,
                                                fontSize: 15.sp,
                                                fontFamily: 'Gilroy_Medium'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 50),
                                      mobailnotextfild(),
                                      SizedBox(height: height / 50),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(height: height / 7.3),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(const Veryfiyyournumber());
                                    },
                                    child: Button(
                                        EnString.confirm,
                                        notifier.getperple,
                                        notifier.getwihitecolor,
                                        0,
                                        Colors.transparent),
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
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 110.0, right: 15.0),
                      child: Divider(
                        color: notifier.getblack,
                        height: 50.h,
                      )),
                ),
                Text(
                  EnString.or,
                  style: TextStyle(color: notifier.getblack, fontSize: 15.sp),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 110.0),
                    child: Divider(
                      color: notifier.getblack,
                      height: 50.h,
                    ),
                  ),
                ),
              ]),
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  authlogin(EnString.facebook, notifier.getblack,
                      "assets/Facebook.png", notifier.getwihitecolor),
                  SizedBox(width: width / 50),
                  authlogin(EnString.whatsapp, notifier.getblack,
                      "assets/Whatsapp.png", notifier.getwihitecolor),
                ],
              ),
              SizedBox(height: height / 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    EnString.alreadyhaveanaccount,
                    style: TextStyle(
                        color: notifier.getblack,
                        fontFamily: 'Gilroy_Medium',
                        fontSize: 13.sp),
                  ),
                  SizedBox(height: height / 3.5),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      EnString.signin,
                      style: TextStyle(
                          color: notifier.getperple,
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 13.sp),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobailnotextfild() {
    return Container(
      height: height / 16,
      width: width / 1.2,
      decoration: BoxDecoration(
        border: Border.all(color: notifier.getblack),
        borderRadius: BorderRadius.all(
          Radius.circular(13.sp),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: width / 100),
          DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<String>(
                hint: Row(
                  children: [
                    Image.asset("assets/flagfour.png", height: height / 25),
                    Text(
                      "+91",
                      style: TextStyle(color: notifier.getblack),
                    )
                  ],
                ),
                value: _selectedindex,
                onChanged: (newValue) {
                  setState(() {
                    _selectedindex = newValue;
                  });
                },
                items: _myjson.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          map["image"].toString(),
                          width: 35.w,
                        ),
                        Text(
                          map["Text"].toString(),
                          style: TextStyle(color: notifier.getblack),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(width: 1, height: height / 25, color: notifier.getgrey),
          SizedBox(width: width / 100),
          Container(
            color: Colors.transparent,
            height: 80.h,
            width: 190.w,
            child:   TextField(style: TextStyle(color: notifier.getblack),
              keyboardType: TextInputType.number,
              decoration:   InputDecoration(hintStyle: TextStyle(color: notifier.getblack),
                  border: InputBorder.none, hintText: "123456789"),
            ),
          ),
        ],
      ),
    );
  }
}
