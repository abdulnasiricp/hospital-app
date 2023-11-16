// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_MainScreens.dart';
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
  int tappedIndex = -1;
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
              padding: const EdgeInsets.only(
                  left: 10.0, top: 12, right: 10, bottom: 5),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: width / 9,
                        child: Center(
                          child: Text(
                            'OPD ID'.tr,
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,

                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: width / 4,
                        child: Center(
                          child: Text(
                            'Patient Name'.tr,
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: width / 4,
                        child: Center(
                          child: Text(
                            'Consultant'.tr,
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: width / 4,
                        child: Center(
                          child: Text(
                            "Last Visit",
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: width / 12,
                        child: Center(
                          child: Text(
                            'status'.tr,
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
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
                      Container(
                        height: height / 20,
                        child: Card(
                          color:
                              tappedIndex == index ? Colors.grey : Colors.white,
                          elevation: tappedIndex == index ? 8.0 : 2.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  tappedIndex = index;
                                });
                                Get.to(() => const OpdMainScreen());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width / 9,
                                        child: const Center(
                                          child: Text(
                                            "OPDN7695",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width / 4,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width / 4,
                                        child: Container(
                                          child: const Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Center(
                                              child: Text(
                                                '13/11/2023 11:58 AM',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width / 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'Examination',
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
