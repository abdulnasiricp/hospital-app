// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);
  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkYellow,
        title: Text('doctorProfile'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.white70,
                child: Container(
                  width: width,
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          width: width,
                          height: 120,
                          decoration: BoxDecoration(
                              color: darkYellow,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 1.7, top: 30),
                          child: Container(
                              width: 100,
                              height: 150,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/hospital_logo.png',
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Dr.Ramjinish Kushwaha',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 40),
                          child: Text(
                            'Director,Orthopedics ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                      // SizedBox(height: 70,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'experience'.tr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'specialist'.tr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'hospital'.tr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'location'.tr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'nationality'.tr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width / 3),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25+ years',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Orthopedics',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Firtis Hospital',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Nepal NCR',
                                    style: TextStyle(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Nepal',
                                    style: TextStyle(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Presently working as a Director of institute of Bone,  joint Replacement,orthopedic spine and sports Medicine at BLK-MAX super speicality Hospital Delhi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'about'.tr,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            const Text(
                              'Doctor On Demand is the trusted provider of 24/7 virtual healthcare for the mind and body, including urgent care, mental health, preventative, primary and chronic care, with access to board-certified physicians and licensed psychologists through a smartphone, tablet, or computer.our mission is to improve the world’s health through compassionate care and innovation. \nWe believe that everyone should have instant and affordable access to a board-certified doctor, whenever and wherever needed.',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Card(
              //   child: Container(
              //     width: width,
              //     height: height / 2.1,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
