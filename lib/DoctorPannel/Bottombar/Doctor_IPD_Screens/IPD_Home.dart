// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unused_element

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_MainScreens.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class IpdHome extends StatefulWidget {
  const IpdHome({Key? key}) : super(key: key);

  @override
  State<IpdHome> createState() => _IpdHomeState();
}

class _IpdHomeState extends State<IpdHome> {
  bool isLoading = true;
  int tappedIndex = -1;
// Default selected item

  TextEditingController searchController = TextEditingController();
  void filterData(String query) {
    setState(() {
      ipdfilteredData = ipddata
          ?.where((element) =>
              element['id'].toLowerCase().contains(query.toLowerCase()) ||
              element['department_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchIPDData();
    print('----------------$fetchIPDData()');
  }

  List<dynamic>? ipddata = [];
  List<dynamic>? ipdfilteredData = [];

  Future<void> fetchIPDData() async {
    setState(() {
      isLoading = true;
    });

    final Uri url = Uri.parse(ApiLinks.getAllipdRecord);

    final response = await http.post(
      url,
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      print('============$dataMap');
      setState(() {
        ipddata = dataMap['result'];
        ipdfilteredData = ipddata;
        isLoading = false;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  void handleNonJsonResponse() {
    print('Non-JSON response or API error');
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchIPDData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
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
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(children: [
            Container(
              color: Colors.grey,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 12, right: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Container(
                        width: width / 9,
                        child: Center(
                          child: Text(
                            'IPD ID'.tr,
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis to cut off the text
                            maxLines: 1,

                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ]),
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
                              'Gender'.tr,
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
                          child: const Center(
                            child: Text(
                              "Consultant",
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
                child: isLoading
                    ? ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.blue.shade100,
                            child: ListTile(
                              leading: Container(
                                width: 60,
                                height: 60,
                                color: Colors.white,
                              ),
                              title: Container(
                                width: 150,
                                height: 20,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                width: 100,
                                height: 10,
                                color: Colors.white,
                              ),
                              trailing: Container(
                                width: 60,
                                height: 30,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )
                    : ipdfilteredData!.isEmpty
                        ? Center(
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Lottie.asset(
                                'assets/No_Data_Found.json',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: ipdfilteredData!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    height: height / 12,
                                    child: Card(
                                      color: tappedIndex == index
                                          ? Colors.green[100]
                                          : Colors.white70.withOpacity(0.7),
                                      elevation:
                                          tappedIndex == index ? 8.0 : 2.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              tappedIndex = index;
                                            });
                                            Get.to(() => IpdMainScreen(ipdid:ipdfilteredData?[index]['ipdid'] ,));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 9,
                                                    child: Center(
                                                      child: Text(
                                                        'IPDN${ipdfilteredData?[index]['ipdid'] ?? ''}',
                                                        overflow: TextOverflow
                                                            .ellipsis, // Use ellipsis to cut off the text
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 4,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            '${ipdfilteredData?[index]['patient_name'] ?? ''}',
                                                            overflow: TextOverflow
                                                                .ellipsis, // Use ellipsis to cut off the text
                                                            maxLines: 1,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 10,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          '${ipdfilteredData?[index]['gender'] ?? ''}',
                                                          overflow: TextOverflow
                                                              .ellipsis, // Use ellipsis to cut off the text
                                                          maxLines: 1,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 4,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            '${ipdfilteredData?[index]['name'] ?? ''}',
                                                            overflow: TextOverflow
                                                                .ellipsis, // Use ellipsis to cut off the text
                                                            maxLines: 1,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 5,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            '${ipdfilteredData?[index]['department_name'] ?? ''}',
                                                            overflow: TextOverflow
                                                                .ellipsis, // Use ellipsis to cut off the text
                                                            maxLines: 1,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
            )
          ]),
        ));
  }
}
