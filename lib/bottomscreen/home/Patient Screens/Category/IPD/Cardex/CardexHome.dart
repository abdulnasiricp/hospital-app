// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Cardex/diet_report.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Cardex/drainage_report.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Cardex/medication_report.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Cardex/observation_report.dart';
import 'package:TezHealthCare/screens/auth/Doctor_Login.dart';
import 'package:TezHealthCare/screens/auth/Patient_login.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CardexHome extends StatefulWidget {
  const CardexHome({Key? key}) : super(key: key);
  @override
  State<CardexHome> createState() => _CardexHomeState();
}

class _CardexHomeState extends State<CardexHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cardex'.tr),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        backgroundColor: darkblue,
        body: DefaultTabController(
          length: 4,
          child: Column(children: [
            ButtonsTabBar(
                height: 50,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                backgroundColor: yellow,
                unselectedBackgroundColor: whitecolor.withOpacity(0.5),
                labelStyle: const TextStyle(
                    wordSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                borderWidth: 1,

                //  elevation: 30,

                tabs: [
                  Tab(
                    child: Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          'medication_report'.tr,
                          style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          'diet_report'.tr,
                          style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          'observation_report'.tr,
                          style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150,
                      child: Center(
                        child: Text(
                          'drainage_report'.tr,
                          style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
            const Expanded(
              child: TabBarView(
                children: [
                  MedicationReport(),
                  Dietreport(),
                  Observationreport(),
                  Drainagereport(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
