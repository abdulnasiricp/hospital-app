// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_MainScreens.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IpdHome extends StatefulWidget {
  const IpdHome({Key? key}) : super(key: key);

  @override
  State<IpdHome> createState() => _IpdHomeState();
}

class _IpdHomeState extends State<IpdHome> {
  String selectedItem = 'Checkout'; // Default selected item
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text('IPD Patient'),
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
                        'IPD No'.tr,
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
                        'Department Name'.tr,
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
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                        onTap: () {
                                    
                                    // Get.to(() => const IpdExamination());
                                    // Get.to(() => const IpdInvestigation());
                                    // Get.to(() => const IPDCardex());
                                    // Get.to(() => const IpdMedication());
                                    // Get.to(() => const IpdOperations());
                                    // Get.to(() => const IpdBedHistory());
                                    Get.to(
                                            () => const IpdMainScreen());


                                  },
                      child: Card(
                        
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
                                  Container(
                                    width: width / 8,
                                    child: const Center(
                                      child: Text(
                                        "OPDN7695",
                                        overflow: TextOverflow
                                            .ellipsis, // Use ellipsis to cut off the text
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
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
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width / 4,
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
                                ],
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width / 4,
                                    child: Container(
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Center(
                                          child: Text(
                                            'Cardiology',
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
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ]));
  }
}
