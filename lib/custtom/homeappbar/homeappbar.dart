import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/search.dart';
import 'package:TezHealthCare/screens/notification.dart';

class HomeCustomAppBar extends PreferredSize {
  final double height;
  final String txt;
  final Color color;
  final Color titlecolor;
  final String lefterrow;
  final String righticon;
  final Widget profile;

  HomeCustomAppBar(
    this.color,
    this.txt,
    this.titlecolor,
    this.lefterrow,
    this.righticon,
    this.profile, {
    Key? key,
    required this.height,
  }) : super(
          key: key,
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    const Notif(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(righticon, scale: 3.5),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const Search());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/serch.png", scale: 3.5),
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: profile,
            ),
            title: Text(
              txt,
              style: TextStyle(color: titlecolor, fontFamily: 'Gilroy_Bold'),
            ),
          ),
          preferredSize: Size.fromHeight(height),
        );
}
