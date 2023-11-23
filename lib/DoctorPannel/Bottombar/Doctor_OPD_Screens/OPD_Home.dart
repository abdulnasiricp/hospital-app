// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:convert';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Das_screen.dart';
import 'package:http/http.dart' as http;

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class OpdHome extends StatefulWidget {
  const OpdHome({Key? key}) : super(key: key);

  @override
  State<OpdHome> createState() => _OpdHomeState();
}

class _OpdHomeState extends State<OpdHome> {
  int tappedIndex = -1;
  String selectedItem = 'Checkout'; // Default selected item
  TextEditingController searchController = TextEditingController();
  void filterData(String query) {
    setState(() {
      radiologyfilteredData = radiologydata
          ?.where((element) =>
              (element['opdid']
                      ?.toLowerCase()
                      ?.contains(query.toLowerCase()) ??
                  false) ||
              (element['patient_name']
                      ?.toLowerCase()
                      ?.contains(query.toLowerCase()) ??
                  false) ||
              (element['name']?.toLowerCase()?.contains(query.toLowerCase()) ??
                  false))
          .toList();
    });
  }

///////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    fetchRadiologyData();
  }

  List<dynamic>? radiologydata = [];
  List<dynamic>? radiologyfilteredData = [];

  Future<void> fetchRadiologyData() async {
    setState(() {
      isLoading = true;
    });

    final Uri url = Uri.parse(ApiLinks.singleTableDataDetector);
    final body = {"table": "opd_details"};

    final response = await http.post(
      url,
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final List<dynamic> rawData = dataMap['result'];

      // Filter data based on "is_emergency" equal to "1"
      radiologydata =
          rawData.where((element) => element['is_emergency'] == "0").toList();

      setState(() {
        radiologyfilteredData = radiologydata;
        isLoading = false;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  bool isLoading = true;
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

    await fetchRadiologyData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

///////////////////////////////////////////////////////////////////////
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
                  centerTitle: "OPD Patient",
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
                          child: const Center(
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
                    : radiologyfilteredData!.isEmpty
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
                            itemCount: radiologyfilteredData!.length,
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
                                            Get.to(() => Das_screen(
                                                  opdID: radiologyfilteredData?[
                                                          index]['opdid'] ??
                                                      "",
                                                  patientName:
                                                      radiologyfilteredData?[
                                                                  index][
                                                              'patient_name'] ??
                                                          "",
                                                  mobileNo:
                                                      radiologyfilteredData?[
                                                                  index]
                                                              ['mobileno'] ??
                                                          "",
                                                  name: radiologyfilteredData?[
                                                          index]['name'] ??
                                                      "",
                                                  surname:
                                                      radiologyfilteredData?[
                                                                  index]
                                                              ['surname'] ??
                                                          "",
                                                  lastVisit:
                                                      radiologyfilteredData?[
                                                                  index]
                                                              ['last_visit'] ??
                                                          "",
                                                  totalVisit:
                                                      radiologyfilteredData?[
                                                                  index]
                                                              ['total_visit'] ??
                                                          "",
                                                  gender:
                                                      radiologyfilteredData?[
                                                                  index]
                                                              ['gender'] ??
                                                          "",
                                                  guardianName:
                                                      radiologyfilteredData?[
                                                              index]
                                                          ['guardian_name'],
                                                  opdid: radiologyfilteredData?[
                                                      index]['opdid'],
                                                ));
                                            // String? status =
                                            //     radiologyfilteredData?[index]
                                            //             ['status']
                                            //         .toString();
                                            // switch (status) {
                                            //   case '1':
                                            //     // Navigate to Registered screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 0));
                                            //     break;
                                            //   case '2':
                                            //     // Navigate to Pre-Checking screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 0));
                                            //     break;
                                            //   case '3':
                                            //     // Navigate to Examination screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 1));
                                            //     break;
                                            //   case '4':
                                            //     // Navigate to Sent for Investigation screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 2));
                                            //     break;
                                            //   case '5':
                                            //     // Navigate to Investigation Report screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 2));
                                            //     break;
                                            //   case '6':
                                            //     // Navigate to Checkout screen
                                            //     Get.to(() =>
                                            //         const OpdMainScreen(
                                            //             initialTabIndex: 3));
                                            //     break;
                                            //   default:
                                            //   // Handle unknown status
                                            // }
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
                                                        '${radiologyfilteredData?[index]['opdid'] ?? ''}',
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
                                                            '${radiologyfilteredData?[index]['patient_name'] ?? ''}',
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
                                                    width: width / 4,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            '${radiologyfilteredData?[index]['name'] ?? ''} ${radiologyfilteredData?[index]['surname'] ?? ''}',
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
                                                    width: width / 8,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            radiologyfilteredData?[
                                                                            index]
                                                                        [
                                                                        'last_visit'] !=
                                                                    null
                                                                ? DateFormat(
                                                                        "dd/MM/yyyy HH:mm:aa")
                                                                    .format(DateTime.parse(
                                                                        radiologyfilteredData![index]
                                                                            [
                                                                            'last_visit']))
                                                                : '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                            ),
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
                                                    width: width / 7,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: getStatusColor(
                                                            radiologyfilteredData?[
                                                                    index]
                                                                ['status']),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1.0),
                                                          child: Text(
                                                            getStatusText(
                                                                radiologyfilteredData?[
                                                                        index]
                                                                    ['status']),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                            ),
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
          ]),
        ));
  }

  String getStatusText(String? status) {
    switch (status) {
      case '1':
        return 'Registered';
      case '2':
        return 'Pre-checking';
      case '3':
        return 'Examination';
      case '4':
        return 'Sent for investigation';
      case '5':
        return 'Investigation report';
      case '6':
        return 'Checkout';
      default:
        return '';
    }
  }

  Color getStatusColor(String? status) {
    switch (status) {
      case '1':
        return const Color(0xffe2d5d5); // Registered
      case '2':
        return const Color(0xff01c7f9); // Pre-checking
      case '3':
        return const Color(0xff999b97); // Examination
      case '4':
        return const Color(0xffc11f7e); // Sent for investigation
      case '5':
        return const Color(0xffadce09); // Investigation report
      case '6':
        return const Color(0xff313e7c); // Checkout
      default:
        return const Color(0xffe2d5d5); // Default color for unknown status
    }
  }
}
