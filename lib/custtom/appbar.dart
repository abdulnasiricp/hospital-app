import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final String txt;
  final Color color;
  final Color titlecolor;
  final String lefterrow;

  CustomAppBar(
    this.color,
    this.txt,
    this.titlecolor,
    this.lefterrow, {
    Key? key,
    required this.height,
  }) : super(
          key: key,
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 10),
            //     child: Image.asset(rightarrow, scale: 3),
            //   ),
            // ],
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(lefterrow, scale: 3),
              ),
            ),
            title: Text(
              txt,
              style: TextStyle(color: titlecolor, fontFamily: 'Gilroy_Bold'),
            ),
          ),
          preferredSize: Size.fromHeight(height),
        );
}
