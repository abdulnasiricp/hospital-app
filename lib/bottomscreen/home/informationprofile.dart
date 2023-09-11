// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationProfile extends StatefulWidget {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  State<InformationProfile> createState() => _InformationProfileState();
}

class _InformationProfileState extends State<InformationProfile> {
String role = '', usernamerecord = '';
  String record = '', genderrecord = '';
  String imagerecord = '', email = '';
  String mobile = '', id = '';

  @override
  void initState() {
    super.initState();
    LoadData();
    dateinput.text = ""; //set the initial value of text field

  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role = sharedPreferences.getString('role') ?? '';
    email = sharedPreferences.getString('username') ?? '';
    record = sharedPreferences.getString('record') ?? '';
    genderrecord = sharedPreferences.getString('genderrecord') ?? '';
    imagerecord = sharedPreferences.getString('imagerecord') ?? '';
    usernamerecord = sharedPreferences.getString('usernamerecord') ?? '';
    mobile = sharedPreferences.getString('mobile') ?? '';
    setState(() {});
  }

  late ColorNotifier notifier;

  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                      color: notifier.getperple,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.sp),
                        bottomLeft: Radius.circular(30.sp),
                      ),
                    ),
                    child: CustomAppBar(
                        Colors.transparent,
                        EnString.informationProfile,
                        notifier.getwihitecolor,
                        "assets/ic_back.png",
                        height: height / 15),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height / 5.5),
                      Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/Avatar.png",
                              height: height / 9,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: height / 15),
                              Padding(
                                padding: EdgeInsets.only(left: width / 1.9),
                                child: Container(
                                  height: height / 24,
                                  decoration: BoxDecoration(
                                      color: notifier.getwihitecolor,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset("assets/ar-camera.png"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 50),

              Row(
                children: [
                  SizedBox(width: width / 14),
                  Text(
                    EnString.firstName,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
              SizedBox(height: height / 80),
              Padding(
                padding: EdgeInsets.only(left: width / 14, right: width / 14),
                child: Container(
                  width: double.infinity,
                  height: height/12,
                  child: Card(
                    child: Center(child: Text(usernamerecord.toString()))),
                )
                
              ),

              Row(
                children: [
                  SizedBox(width: width / 14),
                  Text(
                    EnString.gender,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
              SizedBox(height: height / 80),
              Padding(
                padding: EdgeInsets.only(left: width / 14, right: width / 14),
                child: Container(
                  width: double.infinity,
                  height: height/12,
                  child: Card(
                    child: Center(child: Text(genderrecord.toString()))),
                )
               
              ),
              SizedBox(height: height / 50),
             
          
              Row(
                children: [
                  SizedBox(width: width / 14),
                  Text(
                    EnString.phoneNumber,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
              SizedBox(height: height / 80),
              Padding(
                padding: EdgeInsets.only(left: width / 14, right: width / 14),
                child:Container(
                  width: double.infinity,
                  height: height/12,
                  child: Card(
                    child: Center(child: Text(mobile.toString()))),
                )
                 
              ),
              // SizedBox(height: height / 50),
              Row(
                children: [
                  SizedBox(width: width / 14),
                  Text(
                    EnString.email,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
              SizedBox(height: height / 80),
              Padding(
                padding: EdgeInsets.only(left: width / 14, right: width / 14),
                child:Container(
                  width: double.infinity,
                  height: height/12,
                  child: Card(
                    child: Center(child: Text(email.toString()))),
                )
                
              ),

            
            ],
          ),
        ),
      ),
    );
  }
}
