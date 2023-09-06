import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/selecthospital.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/custtom/custtomdoctorexpriancecard.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';


class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  late ColorNotifier notifier;
  String dropdownvalue = 'London';
  bool selectedindex = false;
  bool selectedindex1 = false;
  bool selectedindex2 = false;
  bool selectedindex3 = false;
  bool selectedindex4 = false;
  bool selectedindex5 = false;
  bool selectedindex6 = false;

  var items = [
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
        appBar: AppBar(
          backgroundColor: notifier.getwihitecolor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset("assets/doctorlistbackarrow.png", scale: 3),
            ),
          ),
          centerTitle: true,
          title: Text(
            EnString.service,
            style:
                TextStyle(color: notifier.getblack, fontFamily: 'Gilroy_Bold'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: km(),
            ),
            SizedBox(width: width / 40)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              tiket("assets/drone.png", EnString.drDon),
              tiket("assets/drtwo.png", EnString.drJustin)
            ],
          ),
        ),
      ),
    );
  }

  Widget tiket(image, txt) {
    return Center(
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            height: height / 1.7,
            width: width / 1,
            child: notifier.isDark
                ? Image.asset(
                    "assets/CombinedShape.png",
                    color: notifier.getwihitecolor,
                  )
                : Image.asset("assets/CombinedShape.png"),
          ),
          Column(
            children: [
              SizedBox(height: height / 13),
              Row(
                children: [
                  SizedBox(width: width / 22),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(image, height: height / 8)),
                  SizedBox(width: width / 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        txt,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Gilroy_Bold',
                            color: notifier.getblack),
                      ),
                      SizedBox(height: height / 100),
                      Text(
                        EnString.blood,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Gilroy_Medium',
                            color: notifier.getgrey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 100),
              SizedBox(height: height / 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(width: width / 20),
                    selection(
                        const Color(0xfffef6ec),
                        Icons.star_border,
                        const Color(0xffffd237),
                        "4.9",
                        "Rating",
                        height / 10,
                        width / 5,
                        height / 25,
                        width / 12,
                        15.sp,
                        14.sp,
                        10.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                    // SizedBox(width: width / 40),
                    selection(
                        const Color(0xffedf2fe),
                        Icons.person_outline,
                        const Color(0xff679cff),
                        "1000+",
                        "patients",
                        height / 10,
                        width / 5,
                        height / 25,
                        width / 12,
                        15.sp,
                        14.sp,
                        10.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                    // SizedBox(width: width / 40),
                    selection(
                        const Color(0xfffef0f2),
                        Icons.account_tree_outlined,
                        const Color(0xfffe79bc),
                        "5 yr+",
                        "Experience",
                        height / 10,
                        width / 5,
                        height / 25,
                        width / 12,
                        15.sp,
                        14.sp,
                        10.sp,
                        notifier.getblack,
                        notifier.getgrey,
                        notifier.getwihitecolor),
                  ],
                ),
              ),
              SizedBox(height: height / 200),
              Padding(
                padding: EdgeInsets.only(
                    left: width / 14, right: width / 10.5, top: height / 60),
                child: Divider(thickness: 1.sp),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 12, top: height / 40),
                    child: Image.asset("assets/tag.png", height: height / 30),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 40, left: width / 80),
                    child: Text(
                      EnString.price,
                      style:
                          TextStyle(color: notifier.getgrey, fontSize: 13.sp),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: height / 40),
                    child: Text(
                      "\$ 1200",
                      style: TextStyle(
                          color: notifier.getperple,
                          fontSize: 14.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                  ),
                  SizedBox(width: width / 10),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _showMyDialog();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: width / 30, right: width / 20),
                  child: Button("Book now", notifier.getperple,
                      notifier.getwihitecolor, 0, Colors.transparent),
                ),
              ),
            ],
          ),
        ],
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

  _showMyDialog() async {
    return showDialog(
      context: context, useRootNavigator: true,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: notifier.getwihitecolor,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.transparent,
                height: height / 2,
                width: width / 1.1,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = !selectedindex;
                        });
                      },
                      child: locatename(
                          EnString.london,
                          selectedindex
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex ? notifier.getblack : notifier.getgrey,
                          selectedindex ? notifier.getblack : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex1 = !selectedindex1;
                        });
                      },
                      child: locatename(
                          EnString.manchester,
                          selectedindex1
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex1 ? notifier.getblack : notifier.getgrey,
                          selectedindex1
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex2 = !selectedindex2;
                        });
                      },
                      child: locatename(
                          EnString.edinburgh,
                          selectedindex2
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex2 ? notifier.getblack : notifier.getgrey,
                          selectedindex2
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex3 = !selectedindex3;
                        });
                      },
                      child: locatename(
                          EnString.bing,
                          selectedindex3
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex3 ? notifier.getblack : notifier.getgrey,
                          selectedindex3
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex4 = !selectedindex4;
                        });
                      },
                      child: locatename(
                          EnString.bristol,
                          selectedindex4
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex4 ? notifier.getblack : notifier.getgrey,
                          selectedindex4
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex5 = !selectedindex5;
                        });
                      },
                      child: locatename(
                          EnString.liverpool,
                          selectedindex5
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex5 ? notifier.getblack : notifier.getgrey,
                          selectedindex5
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex6 = !selectedindex6;
                        });
                      },
                      child: locatename(
                          EnString.grow,
                          selectedindex6
                              ? notifier.getperple
                              : Colors.transparent,
                          selectedindex6 ? notifier.getblack : notifier.getgrey,
                          selectedindex6
                              ? notifier.getblack
                              : notifier.getgrey),
                    ),
                    SizedBox(height: height / 40),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: dailogbutton(notifier.getwihitecolor,
                                EnString.cancel, notifier.getperple),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const Selecthospital());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: dailogbutton(notifier.getperple,
                                EnString.selects, notifier.getwihitecolor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.sp),
            ),
          ),
          title: Text(
            EnString.locate,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: notifier.getblack,
                fontFamily: 'Gilroy_Bold',
                fontSize: 17.sp),
          ),
        );
      },
    );
  }

  Widget dailogbutton(colorr, txt, buttontextcolor) {
    return Container(
      height: height / 17,
      width: width / 3.4,
      decoration: BoxDecoration(
        border: Border.all(color: notifier.getperple, width: 1.sp),
        color: colorr,
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              color: buttontextcolor,
              fontFamily: 'Gilroy_Medium',
              fontSize: 13.sp),
        ),
      ),
    );
  }

  Widget locatename(txt, iconcolor, textcolor, locationcolor) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20.sp,
              color: locationcolor,
            ),
            SizedBox(width: width / 100),
            Text(
              txt,
              style: TextStyle(
                  fontFamily: 'Gilroy_Medium',
                  fontSize: 14.5.sp,
                  color: textcolor),
            ),
            const Spacer(),
            Icon(
              Icons.done,
              size: 17.sp,
              color: iconcolor,
            )
          ],
        ),
      ),
    );
  }

  Widget km() {
    return Container(
      height: height / 30,
      width: width / 3,
      decoration: BoxDecoration(
        color: const Color(0xffE7E5FF),
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: DropdownButton(
        elevation: 0,
        underline: const SizedBox(),
        // Initial Value
        value: dropdownvalue,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
        ),

        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Row(
              children: [
                SizedBox(width: width / 30),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                  size: 15.sp,
                ),
                SizedBox(width: width / 100),
                Text(
                  items,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy_Medium'),
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
    );
  }
}
