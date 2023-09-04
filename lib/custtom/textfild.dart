import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfild {
  static Widget textField(
      labletext, focuscolor, lablecolor, textcolor, bordercolor, h, w,preicon,iconcolor) {
    return ScreenUtilInit(
      builder: (_ , child)  => Container(
        color: Colors.transparent,
        height: h,
        width: w,
        child: TextField(
          style: TextStyle(color: textcolor),
          onChanged: (value) {},
          // obscureText: hidePassword, //show/hide password
          decoration: InputDecoration(
            prefixIcon: Icon(preicon, color: iconcolor),
            label: Text(labletext),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            labelStyle: TextStyle(color: lablecolor),
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
      ),
    );
  }
}
