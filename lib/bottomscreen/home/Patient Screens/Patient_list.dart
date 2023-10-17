// ignore_for_file: sized_box_for_whitespace, file_names

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/new_member.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/confirmation_screen.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
          backgroundColor: darkYellow,
          radius: 25,
          child: IconButton(
              onPressed: () {
                Get.to(() => const AddNewMemberScreen());
              },
              icon: Icon(Icons.add, color: whitecolor))),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('patientList'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'selectPatient'.tr,
              style: TextStyle(color: Colors.orange[900], fontSize: 15),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const ConfirmationScreen());
              },
              child: Container(
                width: width,
                height: 50,
                child: const Card(
                    color: Colors.white70,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Ramjinish Kushwaha',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                // Get.to(()=>PatientList());
              },
              child: Container(
                width: width,
                height: 50,
                child: const Card(
                    color: Colors.white70,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Test Test',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
