import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/profilesettings.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/custtom/custtombutton.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);

    return ScreenUtilInit(
      builder: (_ , child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.address,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 25),
              Stack(
                children: [
                  Center(
                    child: Card(color: notifier.getwihitecolor,
                      child: Container(
                        color: Colors.transparent,
                        height: height / 7,
                        width: width / 1.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height / 50),
                            Row(
                              children: [
                                SizedBox(width: width / 50),
                                Icon(
                                  Icons.location_on_outlined,
                                  color: notifier.getperple,
                                  size: 25.sp,
                                ),
                                SizedBox(width: width / 100),
                                Text(
                                  EnString.londonCity,
                                  style: TextStyle(
                                      color: notifier.getgrey,
                                      fontSize: 15.sp,
                                      fontFamily: 'Gilroy_Medium'),
                                ),
                                SizedBox(width: width / 6.5),
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: notifier.getgrey,
                                  size: 25.sp,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: width / 10),
                                Text(
                                  EnString.no,
                                  style: TextStyle(
                                      color: notifier.getgrey,
                                      fontSize: 15.sp,
                                      fontFamily: 'Gilroy_Medium'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height / 12),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(const ProfileSettings());
                            },
                            child: Button(
                                EnString.newAddress,
                                const Color(0xffE7E5FF),
                                notifier.getperple,
                                0,
                                Colors.transparent)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
