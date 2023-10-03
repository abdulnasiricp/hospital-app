// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/new_member.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Patient_list.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OldorNewPatientScreen extends StatefulWidget {
  const OldorNewPatientScreen({Key? key}) : super(key: key);

  @override
  State<OldorNewPatientScreen> createState() => _OldorNewPatientScreenState();
}

class _OldorNewPatientScreenState extends State<OldorNewPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('oldOrNewPatient'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'askPatientQuestions'.tr,
                style: TextStyle(color: Colors.blue[400]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Get.to(()=>const AddNewMemberScreen());


              },
              child: Container(
                width: width,
                height: height / 9,
                child:  Card(
                  
                  color: Colors.red[100],
                    child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'newPatient'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'oldPatientDesc'.tr),
                    ],
                  ),
                )),
              ),
            ),
            const SizedBox(height: 10,),
             InkWell(
              onTap: (){
                Get.to(()=>const PatientList());
              },
               child: Container(
                width: width,
                height: height / 9,
                child:  Card(
                  color: Colors.yellow[100],
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'oldPatient'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Text(
                          'oldPatientDesc'.tr),
                    ],
                  ),
                )),
                         ),
             ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('note'.tr,style: TextStyle(color: Colors.blue[400]),),
            )
          ],
        ),
      ),
    );
  }
}
