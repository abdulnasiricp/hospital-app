import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';

Widget selection(color, icon, iconcolor, txt, exp, mainheight, mainwidth,
    underheight, underwidth, iconsize, fontsize, expiconsize,titlecolor,subtitlecolor,cardcolor) {
  return ScreenUtilInit(
    builder:(_ , child) => Card(color: cardcolor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: mainheight,
            width: mainwidth,
            child: Column(
              children: [
                Container(
                  height: underheight,
                  width: underwidth,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(15.sp),
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: iconcolor,
                    size: iconsize,
                  ),
                ),
                SizedBox(height: height / 80),
                Text(
                  txt,
                  style: TextStyle(
                      color: titlecolor,
                      fontSize: fontsize,
                      fontFamily: 'Gilroy_Bold'),
                ),
                SizedBox(height: height / 300),
                Text(
                  exp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: subtitlecolor,
                      fontSize: expiconsize,
                      fontFamily: 'Gilroy_Medium'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  // return Card(
  //   elevation: 1.sp,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(15.sp),
  //     ),
  //   ),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(15.sp),
  //       ),
  //     ),
  //     height: height / 6.5,
  //     width: height / 8,
  //     child: Column(
  //       children: [
  //         SizedBox(height: height / 35),
  //         Image.asset(image, height: height / 17),
  //         SizedBox(height: height / 100),
  //         Text(
  //           name,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontSize: 12.sp,
  //               fontFamily: 'Gilroy_Bold',
  //               color: notifier.getblack),
  //         )
  //       ],
  //     ),
  //   ),
  // );
}