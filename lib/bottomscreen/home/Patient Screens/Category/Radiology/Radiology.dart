// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'dart:async';

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Billview.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Reportbiew.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Radiology extends StatefulWidget {
  const Radiology({Key? key}) : super(key: key);

  @override
  State<Radiology> createState() => _RadiologyState();
}

class _RadiologyState extends State<Radiology> {
  bool isLoading = true;

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // get shared preference data
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

// ///////////////////////////////////////////////////////////////////////////////////////////////
//calculate total amount

  late String totalAmount = "0.00"; // Initialize with a default value

  void calculateTotalAmount() {
    double total = 0.0;
    for (var item in filteredData!) {
      total += double.tryParse(item['net_amount']) ?? 0.0;
    }
    setState(() {
      totalAmount =
          total.toStringAsFixed(2); // Format as a string with 2 decimal places
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  getData() async {
    await LoadData();
    await fetchData();

    calculateTotalAmount();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

////////////////////////////////////////////////////////////////////////////////////////////
// Get Radiology data
  Map<String, dynamic>? DataMap;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];
  Future<Map<String, dynamic>> fetchData() async {
    Uri.parse(ApiLinks.radiology);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      Uri.parse(ApiLinks.radiology),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      DataMap = json.decode(response.body);
      setState(() {
        data = DataMap!['result'];
        filteredData = data;
        isLoading = false; // Set isLoading to false when data is loaded
      });
    } else {
      throw Exception('Failed to load data');
    }
    return {};
  }

////////////////////////////////////////////////////////////////////////////////////////////
//refresh screen
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

////////////////////////////////////////////////////////////////////////////////////
  TextEditingController searchController = TextEditingController();

////////////////////////////////////////////////////////////////////////////////////////
// filter data

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
              element['id'].toLowerCase().contains(query.toLowerCase()) ||
              element['status'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: darkYellow, // Set the status bar color here
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
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
                  previousScreen: const Bottomhome(),
                  isBackButtonVisible: true,
                  backIconColor: whitecolor,
                  centerTitle: 'radiology'.tr,
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
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                width: width,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width / 8,
                            child: Text(
                              'billno'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width / 5,
                            child: Text(
                              'Payment'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width / 5,
                            child: Text(
                              'Report'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width / 5,
                            child: Center(
                              child: Text(
                                'amount'.tr,
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
              Expanded(
                child: isLoading
                    ? ListView.builder(
                        itemCount: 10,
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
                    : filteredData!.isEmpty
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
                            itemCount: filteredData?.length,
                            itemBuilder: (context, index) {
                              final Radiologybill = filteredData?[index];
                              if (Radiologybill.containsKey('id')) {
                                return Column(
                                  children: [
                                    Card(
                                      color: Colors.white70.withOpacity(0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${Radiologybill['id']}".isEmpty
                                                  ? 'N/A'
                                                  : "${Radiologybill['id']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 8,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (Radiologybill[
                                                              'status'] ==
                                                          'Paid') {
                                                        Get.to(
                                                          () =>
                                                              RadiologyBillview(
                                                            bill_pdf:
                                                                "${Radiologybill['bill_pdf']}", // Use 'id' as the Pathologybill ID
                                                            id: "${Radiologybill['id']}",
                                                          ),
                                                        );
                                                      } else {
                                                        // Handle the tap event for 'UnPaid' status
                                                        Get.to(
                                                          () =>
                                                              RadiologyBillview(
                                                            bill_pdf:
                                                                "${Radiologybill['bill_pdf']}", // Use 'id' as the Pathologybill ID
                                                            id: "${Radiologybill['id']}",
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Radiologybill[
                                                                    'status'] ==
                                                                'Paid'
                                                            ? Colors.green
                                                            : Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            // listName,
                                                            "${Radiologybill['status']}"
                                                                    .isEmpty
                                                                ? 'N/A'
                                                                : "${Radiologybill['status']}",
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
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
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 4,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (Radiologybill[
                                                              'is_printed'] ==
                                                          '1') {
                                                        Get.to(
                                                          () =>
                                                              RadiologyReportview(
                                                            report_pdf:
                                                                "${Radiologybill['report_pdf']}",
                                                            id: "${Radiologybill['id']}",
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                "Radiology report is currently printing. Please stay tuned."),
                                                            backgroundColor:
                                                                Colors.red,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Radiologybill[
                                                                    'is_printed'] ==
                                                                '1'
                                                            ? Colors.green
                                                            : Colors
                                                                .yellowAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Center(
                                                          child: Text(
                                                            Radiologybill[
                                                                        'is_printed'] ==
                                                                    '1'
                                                                ? 'Report Printed'
                                                                : 'Processing',
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
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
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 7,
                                                  child: Center(
                                                    child: Text(
                                                      // 'Rs.${item.total}',
                                                      "${Radiologybill['net_amount']}"
                                                              .isEmpty
                                                          ? 'N/A'
                                                          : "${Radiologybill['net_amount']}", // Use 'net_amount' for the amount
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  ],
                                );
                              }
                              return null;
                            },
                          ),
              ),
            ],
          ),
        ),
        bottomSheet: data!.isEmpty
            ? null // Set bottomSheet to null when apiData is empty
            : Card(
                child: Container(
                  height: 50,
                  width: width,
                  color: darkYellow,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total'.tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Text("Rs.$totalAmount",
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
