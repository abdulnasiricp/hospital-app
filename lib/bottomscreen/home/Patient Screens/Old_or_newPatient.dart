// ignore_for_file: file_names, sized_box_for_whitespace

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
        title: const Text('Old or New Patient?'),
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
                'Are you a new patient or old patient of this hospital?',
                style: TextStyle(color: Colors.blue[400]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: width,
                height: height / 9,
                child:  Card(
                  
                  color: Colors.red[100],
                    child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Patient',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'I have not visited this hospital before or i do\n not have Hospital No.'),
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
                    child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Old Patient',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'I have visited this hospital before and have \n Hospital No.'),
                    ],
                  ),
                )),
                         ),
             ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Note: You can find hospital No. on OPD card/book ',style: TextStyle(color: Colors.blue[400]),),
            )
          ],
        ),
      ),
    );
  }
}