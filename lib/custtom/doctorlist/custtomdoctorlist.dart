import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Doctorlist extends StatefulWidget {
  final String? image;
  final Color? bordercolor;
  final String? drname;
  final String? subname;
  final String? kmr;
  final double? kmrw;

  const Doctorlist(this.image, this.bordercolor, this.drname, this.subname,
      this.kmr, this.kmrw,
      {Key? key})
      : super(key: key);

  @override
  State<Doctorlist> createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            color: notifier.getwihitecolor,
            elevation: 1.5.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(11.sp),
              ),
            ),
            child: Container(
              height: height / 6.72,
              width: width / 1.1,
              decoration: BoxDecoration(
                border: Border.all(color: widget.bordercolor!, width: 2.sp),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.sp),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: width / 80),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Colors.transparent,
                          height: height / 7,
                          width: width / 4,
                          child: Image.asset(
                            widget.image!,
                            height: height / 7,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: width / 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.drname!,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Gilroy_Bold',
                                color: notifier.getblack),
                          ),
                          Text(
                            widget.subname!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Gilroy_Bold',
                                color: notifier.getgrey),
                          ),
                          SizedBox(height: height / 70),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color(0xffFFC107),
                                size: 22.sp,
                              ),
                              Text(
                                "4.5 (834)",
                                style: TextStyle(
                                    color: notifier.getgrey, fontSize: 13.sp),
                              ),
                              SizedBox(width: widget.kmrw),
                              km(widget.kmr)
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget km(txt) {
    return Container(
      height: height / 30,
      width: width / 5,
      decoration: BoxDecoration(
        color: notifier.getkmcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: const Color(0xff2AD3E7),
            size: 15.sp,
          ),
          Text(
            txt,
            style: TextStyle(
                color: const Color(0xff2AD3E7),
                fontSize: 13.sp,
                fontFamily: 'Gilroy_Medium'),
          ),
        ],
      )),
    );
  }
}
