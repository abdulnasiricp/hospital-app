// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Examination.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_investigation.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpdHome extends StatefulWidget {
  const OpdHome({Key? key}) : super(key: key);

  @override
  State<OpdHome> createState() => _OpdHomeState();
}

class _OpdHomeState extends State<OpdHome> {
  String selectedItem = 'Checkout'; // Default selected item
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text('OPD Patient'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Column(children: [
          Container(
            color: Colors.grey,
            width: width,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 12, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'OPD ID'.tr,
                        overflow: TextOverflow
                            .ellipsis, // Use ellipsis to cut off the text
                        maxLines: 1,

                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Patient Name'.tr,
                        overflow: TextOverflow
                            .ellipsis, // Use ellipsis to cut off the text
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Consultant'.tr,
                        overflow: TextOverflow
                            .ellipsis, // Use ellipsis to cut off the text
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Status'.tr,
                        overflow: TextOverflow
                            .ellipsis, // Use ellipsis to cut off the text
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Get.to(() => const OpdPreChecking());
                                      // Get.to(() => const OpdExamination());
                                      Get.to(() => const OpdInvestigation());
                                    },
                                    child: Container(
                                      width: width / 8,
                                      child: const Center(
                                        child: Text(
                                          "OPDN7695",
                                          overflow: TextOverflow
                                              .ellipsis, // Use ellipsis to cut off the text
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width / 7,
                                    child: InkWell(
                                      onTap: () {
                                   
                                      },
                                      child: Container(
                                        
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Center(
                                            child: Text(
                                              "chhotelal ram",
                                              overflow: TextOverflow
                                                  .ellipsis, // Use ellipsis to cut off the text
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width / 4,
                                    child: InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                      
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Center(
                                            child: Text(
                                              'Madhurendra Tiwari (9001)',
                                              overflow: TextOverflow
                                                  .ellipsis, // Use ellipsis to cut off the text
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: DropdownButton<String>(
                                    value: selectedItem,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedItem = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Registerted',
                                      'Pre-Checking',
                                      'Examination',
                                      'investigation',
                                      ' report',
                                      'Checkout',
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ]));
  }
}
