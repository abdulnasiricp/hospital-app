// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/USG/BillReport.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/USG/ScanReport.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class USGScreen extends StatefulWidget {
  const USGScreen({Key? key}) : super(key: key);

  @override
  State<USGScreen> createState() => _USGScreenState();
}

class _USGScreenState extends State<USGScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> apiData = []; // Initialize as a list
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

  getData() async {
    await LoadData();
    await fetchData().then((data) {
      setState(() {
        // Map the API response to a list of payment records
        if (data.containsKey("result")) {
          apiData = List<Map<String, dynamic>>.from(data["result"]);
        }
        isLoading = false;
      });
    }).catchError((error) {
      // Handle errors here
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    Uri.parse(ApiLinks.getAllUsgBill);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      Uri.parse(ApiLinks.getAllUsgBill),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: darkYellow, // Set the status bar color here
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('usg'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: width,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          // width: width/7,
                          child: Center(
                            child: Text(
                              'billno'.tr,
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
                          width: width / 7,
                          child: Text(
                            'Scan'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: width / 7,
                          child: Text(
                            'Report'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: width / 7,
                          child: Text(
                            'amount'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                  : apiData.isEmpty
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
                          itemCount: apiData.length,
                          itemBuilder: (context, index) {
                            final USGbill = apiData[index];
                            if (USGbill.containsKey('id')) {
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
                                            "${USGbill['id']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (USGbill['is_scan_entry'] ==
                                                  '1') {
                                                Get.to(
                                                  () => USGScanreportview(
                                                    scan_report_link: USGbill[
                                                            'direct_charge_details']
                                                        [0]['scan_report_link'],
                                                    id: "${USGbill['id']}",
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "Pathology report is currently printing. Please stay tuned."),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    USGbill['is_scan_entry'] ==
                                                            '1'
                                                        ? Colors.green
                                                        : Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Text(
                                                    USGbill['is_scan_entry'] ==
                                                            '1'
                                                        ? 'Report Scanned'
                                                        : 'Processing',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (USGbill['is_report_entry'] ==
                                                  '1') {
                                                Get.to(
                                                  () => USGBillview(
                                                    finding_report_link: USGbill[
                                                            'direct_charge_details']
                                                        [
                                                        0]['finding_report_link'],
                                                    id: "${USGbill['id']}",
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "Pathology report is currently printing. Please stay tuned."),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    USGbill['is_report_entry'] ==
                                                            '1'
                                                        ? Colors.green
                                                        : Colors.yellowAccent,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Text(
                                                    USGbill['is_report_entry'] ==
                                                            '1'
                                                        ? 'Report Printed'
                                                        : 'Processing',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // 'Rs.${item.total}',
                                            "${USGbill['net_amount']}",
                                            // Use 'net_amount' for the amount
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
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
    );
  }
}
