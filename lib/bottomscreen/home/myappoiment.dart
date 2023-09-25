import 'package:TezHealthCare/utils/colors.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/bottomscreen/home/appoinmenttabs/past.dart';
import 'package:TezHealthCare/bottomscreen/home/appoinmenttabs/upcoming.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class MyAppoiment extends StatefulWidget {
  const MyAppoiment({Key? key}) : super(key: key);

  @override
  State<MyAppoiment> createState() => _MyAppoimentState();
}

class _MyAppoimentState extends State<MyAppoiment> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: AppBar(
          title: const Text('My Appointment'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: height / 1.125,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.sp),
                    ),
                  ),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          unselectedLabelStyle:
                              TextStyle(color: notifier.getperple),
                          backgroundColor: notifier.getperple,
                          unselectedBackgroundColor: Colors.transparent,
                          labelStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          //  borderWidth: 1,
                          //  elevation: 30,
                          radius: 10.sp,
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.sp),
                                  ),
                                  border: Border.all(color: notifier.getperple),
                                ),
                                height: height / 19,
                                width: width / 2.5,
                                child: Center(
                                  child: Text(
                                    EnString.upcoming,
                                    style: TextStyle(
                                        color: notifier.isDark
                                            ? Colors.green
                                            : const Color(0xff2AD3E7),
                                        fontFamily: 'Gilroy Medium',
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.sp),
                                  ),
                                  border: Border.all(color: notifier.getperple),
                                ),
                                height: height / 19,
                                width: width / 2.5,
                                child: Center(
                                  child: Text(
                                    EnString.past,
                                    style: TextStyle(
                                        color: notifier.isDark
                                            ? Colors.green
                                            : const Color(0xff2AD3E7),
                                        fontFamily: 'Gilroy Medium',
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: <Widget>[Upcoming(), Past()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
