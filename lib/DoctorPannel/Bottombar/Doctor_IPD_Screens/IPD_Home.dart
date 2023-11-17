// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_MainScreens.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IpdHome extends StatefulWidget {
  const IpdHome({Key? key}) : super(key: key);

  @override
  State<IpdHome> createState() => _IpdHomeState();
}

class _IpdHomeState extends State<IpdHome> {
  int tappedIndex = -1;
  String selectedItem = 'Checkout'; // Default selected item
  List<dynamic>? filteredData = [];
  List<dynamic>? data = [];
  TextEditingController searchController = TextEditingController();
  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
              element['id'].toLowerCase().contains(query.toLowerCase()) ||
              element['status'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 65),
            child: SafeArea(
                child: Container(
              decoration: BoxDecoration(color: darkYellow, boxShadow: const [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5)),
              ]),
              alignment: Alignment.center,
              child: AnimationSearchBar(
                  isBackButtonVisible: false,
                  backIconColor: whitecolor,
                  centerTitle: "IPD Patient",
                  centerTitleStyle: TextStyle(color: whitecolor, fontSize: 20),
                  searchIconColor: whitecolor,
                  searchFieldDecoration: BoxDecoration(
                      color: whitecolor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  closeIconColor: whitecolor,
                  onChanged: (query) => filterData(query),
                  searchTextEditingController: searchController,
                  horizontalPadding: 5),
            ))),
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
                            'IPD No'.tr,
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
                        width: width / 12,
                        child: const Center(
                          child: Text(
                            "Gender",
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
                            'Department Name'.tr,
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
                        height: height / 12,
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
                                Get.to(() => const IpdMainScreen());
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
                                                "chhotelal ram (10909)",
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
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Male',
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
                                        width: width / 5,
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
