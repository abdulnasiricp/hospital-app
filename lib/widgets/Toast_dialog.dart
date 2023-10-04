// ignore_for_file: file_names, sized_box_for_whitespace


import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ToastDialog extends StatelessWidget {
  const ToastDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          margin: const EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Select Language'),
              const SizedBox(height: 20),
              Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkYellow),
                  child: ListTile(
                    onTap: () {
                      Get.updateLocale(const Locale('en', 'US'));
                     Get.offAll(() => const Bottomhome());

                  
                    },
                    leading: SvgPicture.asset(
                      'assets/usflag.svg',
                      width: 30,
                      height: 30,
                    ),
                    title: const Center(
                        child: Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
              const SizedBox(height: 10),
              Container(
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkYellow),
                  child: ListTile(hoverColor: whitecolor,
                    onTap: () {
                      Get.updateLocale(const Locale('ne', 'NP'));
                     Get.offAll(() => const Bottomhome());


                    },
                    leading: SvgPicture.asset(
                      'assets/nepflag.svg',
                      width: 30,
                      height: 30,
                    ),
                    title: const Center(
                        child: Text(
                      'नेपाली',
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
              const SizedBox(height: 50),
            ],
          ),
        ),
       
      ],
    );
  }
}
