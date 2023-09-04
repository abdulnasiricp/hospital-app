import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        appBar: CustomAppBar(
          Colors.transparent,
          EnString.profileSettings,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Card(
                  child: Container(
                    color: Colors.transparent,
                    height: height / 5,
                    width: width / 1.1,
                    child: Column(
                      children: [
                        SizedBox(height: height/30),
                        Row(
                          children: [
                            SizedBox(width: width/17),
                            Icon(
                              Icons.person_outline,
                              color: notifier.getperple,
                              size: 20.sp,
                            ),
                            SizedBox(width: width/40),
                            Text(
                              EnString.jung,
                              style: TextStyle(
                                  color: notifier.getgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                            SizedBox(width: width/2.6),
                            Icon(Icons.more_vert_outlined,
                                color: notifier.getgrey, size: 20.sp)
                          ],
                        ),
                        SizedBox(height: height/60),
                        Row(
                          children: [
                            SizedBox(width: width/17),
                            Icon(
                              Icons.location_on_outlined,
                              color: const Color(0xffFF6F5B),
                              size: 20.sp,
                            ),
                            SizedBox(width: width/40),
                            Text(
                              EnString.londonCity,
                              style: TextStyle(
                                  color: notifier.getgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                          ],
                        ),
                        SizedBox(height: height/60),
                        Row(
                          children: [
                            SizedBox(width: width/17),
                            Icon(
                              Icons.female,
                              color: const Color(0xff2AD3E7),
                              size: 20.sp,
                            ),
                            SizedBox(width: width/40),
                            Text(
                              EnString.female,
                              style: TextStyle(
                                  color: notifier.getgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),

                          ],
                        )
                      ],
                    ),
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
