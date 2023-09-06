import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/custtom/textfild.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InformationProfile extends StatefulWidget {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  State<InformationProfile> createState() => _InformationProfileState();
}

class _InformationProfileState extends State<InformationProfile> {
  late ColorNotifier notifier;
  String dropdownvalue = 'Female';

  // List of items in our dropdown menu
  var items = [
    'Female',
    'Male',
  ];
  TextEditingController dateinput = TextEditingController();

  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
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
                child: Customtextfild.textField(
                    EnString.enterusername,
                    notifier.getgrey,
                    notifier.getgrey,
                    notifier.getblack,
                    notifier.getgrey,
                    height / 10,
                    width,
                    Icons.drive_file_rename_outline,
                    notifier.getperple),
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
                  height: height / 13,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                      border: Border.all(color: notifier.getgrey, width: 1)),
                  child: Center(
                    child: DropdownButton(
                      elevation: 0,
                      value: dropdownvalue,
                      underline: const SizedBox(),
                      icon: Row(
                        children: [
                          SizedBox(width: width / 1.74),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: notifier.getperple,
                          ),
                        ],
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Row(
                            children: [
                              SizedBox(width: width / 40),
                              Text(
                                items,
                                style: TextStyle(color: notifier.getgrey),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 50),
              Row(
                children: [
                  SizedBox(width: width / 14),
                  Text(
                    EnString.dateBirth,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ],
              ),
              SizedBox(height: height / 80),
              datepicker(height / 17, width / 1.1.w, notifier.getgrey,
                  notifier.getgrey, notifier.getgrey),
              // datepicker(
              //     notifier.getgrey,
              //     notifier.getgrey,
              //      15.sp,
              //
              //     height / 17,
              //     width / 1.1.w,
              //      ),
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
                child: Customtextfild.textField(
                    "0123 4567 789",
                    notifier.getgrey,
                    notifier.getgrey,
                    notifier.getblack,
                    notifier.getgrey,
                    height / 10,
                    width,
                    Icons.numbers,
                    notifier.getperple),
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
                child: Customtextfild.textField(
                    EnString.gmail,
                    notifier.getgrey,
                    notifier.getgrey,
                    notifier.getblack,
                    notifier.getgrey,
                    height / 10,
                    width,
                    Icons.email,
                    notifier.getperple),
              ),

              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(EnString.save, notifier.getperple,
                      notifier.getwihitecolor, 0, Colors.transparent),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget datepicker(h, w, textcolor, bordercolor, focuscolor) {
    return Padding(
      padding: EdgeInsets.only(left: width / 14, right: width / 14),
      child: Column(
        children: [
          TextField(
            controller: dateinput,
            style: TextStyle(color: textcolor),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                // print(
                //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                // print(
                //     formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  dateinput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {
                // print("Date is not selected");
              }
            },
            //show/hide password
            decoration: InputDecoration(
              hintText: "1999/09/21",
              hintStyle: TextStyle(color: notifier.getgrey),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: bordercolor, width: 1),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focuscolor, width: 1),
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: height/17,
    //   width: width/1.1.w,
    //   child: Column(
    //     children: [
    //       TextField(
    //         controller: dateinput,
    //         style: TextStyle(color: notifier.getgrey),
    //         onChanged: (value) {},
    //         decoration: InputDecoration(
    //           // suffix: Icon(
    //           //   Icons.date_range_outlined,
    //           //   color: notifier.getperple,
    //           // ),
    //           hintText: "1999/09/21",
    //           disabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(15.sp),
    //           ),
    //           hintStyle: TextStyle(color: notifier.getgrey),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(15.sp),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: notifier.getgrey, width: 1),
    //             borderRadius: BorderRadius.circular(15.sp),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: notifier.getgrey, width: 1),
    //             borderRadius: BorderRadius.circular(15.sp),
    //           ),
    //         ),
    //         readOnly: true,
    //         onTap: () async {
    //           DateTime? pickedDate = await showDatePicker(
    //               context: context,
    //               initialDate: DateTime.now(),
    //               firstDate: DateTime(
    //                   2000), //DateTime.now() - not to allow to choose before today.
    //               lastDate: DateTime(2101));
    //
    //           if (pickedDate != null) {
    //             // print(
    //             //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
    //             String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    //             // print(
    //             //     formattedDate); //formatted date output using intl package =>  2021-03-16
    //             //you can implement different kind of Date Format here according to your requirement
    //
    //             setState(() {
    //               dateinput.text =
    //                   formattedDate; //set output date to TextField value.
    //             });
    //           } else {
    //             // print("Date is not selected");
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
