import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Doctorlistappbar extends PreferredSize {
  final double height;
  final String txt;
  final Color color;
  final Color titlecolor;
  final String lefterrow;

  final Widget rights;

  Doctorlistappbar(
    this.color,
    this.txt,
    this.titlecolor,
    this.lefterrow,
    this.rights, {
    Key? key,
    required this.height,
  }) : super(
          key: key,
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
            actions: [
              rights,
            ],
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
