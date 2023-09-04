import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/payment.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/custtom/textfild.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class AddressUpdates extends StatefulWidget {
  const AddressUpdates({Key? key}) : super(key: key);

  @override
  State<AddressUpdates> createState() => _AddressUpdatesState();
}

class _AddressUpdatesState extends State<AddressUpdates> {
  late ColorNotifier notifier;
  bool isChecked = false;
  String provincialvalue = 'London';
  String districtvalue = 'London';
  String wardvalue = 'London';
  var provincial = [
    'London',
    'India',
    'USA',
    'Germany',
  ];

  var district = [
    'London',
    'India',
    'USA',
    'Germany',
  ];
  var ward = [
    'London',
    'India',
    'USA',
    'Germany',
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.addressUpdates,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  color: notifier.getwihitecolor,
                  child: Container(
                    color: Colors.transparent,
                    height: height / 1.6,
                    width: width / 1.1,
                    child: Column(
                      children: [
                        SizedBox(height: height / 40),
                        Row(
                          children: [
                            SizedBox(width: width / 20),
                            Text(
                              EnString.specificAddress,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: notifier.getgrey,
                                  fontFamily: 'Gilroy_Medium'),
                            )
                          ],
                        ),
                        SizedBox(height: height / 70),
                        Customtextfild.textField(
                            EnString.london,
                            notifier.getperple,
                            notifier.getgrey,
                            notifier.getblack,
                            notifier.getgrey,
                            height / 15,
                            width / 1.2,
                            Icons.home_outlined,
                            notifier.getperple),
                        SizedBox(height: height / 50),
                        Row(
                          children: [
                            SizedBox(width: width / 20),
                            Text(
                              EnString.prov,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: notifier.getgrey,
                                  fontFamily: 'Gilroy_Medium'),
                            )
                          ],
                        ),
                        SizedBox(height: height / 70),
                        Container(
                          height: height / 15,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp)),
                              border: Border.all(
                                  color: notifier.getgrey, width: 1)),
                          child: DropdownButton(
                            elevation: 0,
                            value: provincialvalue,
                            underline: const SizedBox(),
                            icon: Padding(
                              padding: EdgeInsets.only(left: width / 1.9),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: notifier.getperple,
                              ),
                            ),
                            items: provincial.map((String items) {
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
                                provincialvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          children: [
                            SizedBox(width: width / 20),
                            Text(
                              EnString.district,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: notifier.getgrey,
                                  fontFamily: 'Gilroy_Medium'),
                            )
                          ],
                        ),
                        SizedBox(height: height / 70),
                        Container(
                          height: height / 15,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp)),
                              border: Border.all(
                                  color: notifier.getgrey, width: 1)),
                          child: DropdownButton(
                            elevation: 0,
                            value: districtvalue,
                            underline: const SizedBox(),
                            icon: Padding(
                              padding: EdgeInsets.only(left: width / 1.9),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: notifier.getperple,
                              ),
                            ),
                            items: district.map((String items) {
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
                                districtvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          children: [
                            SizedBox(width: width / 20),
                            Text(
                              EnString.ward,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: notifier.getgrey,
                                  fontFamily: 'Gilroy_Medium'),
                            )
                          ],
                        ),
                        SizedBox(height: height / 70),
                        Container(
                          height: height / 15,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp)),
                              border: Border.all(
                                  color: notifier.getgrey, width: 1)),
                          child: DropdownButton(
                            elevation: 0,
                            value: wardvalue,
                            underline: const SizedBox(),
                            icon: Padding(
                              padding: EdgeInsets.only(left: width / 1.9),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: notifier.getperple,
                              ),
                            ),
                            items: ward.map((String items) {
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
                                wardvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: width / 50),
                            Transform.scale(
                              scale: 1.sp,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.sp),
                                  ),
                                ),
                                activeColor: notifier.getperple,
                                side: BorderSide(color: notifier.getperple),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      EnString.select,
                                      style: TextStyle(
                                          fontSize: height / 55,
                                          color: notifier.getgrey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: height / 1.6),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width / 30, right: width / 30),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const Payment());
                        },
                        child: Button(
                            EnString.addressUpdates,
                            notifier.getperple,
                            notifier.getwihitecolor,
                            0,
                            Colors.transparent),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
