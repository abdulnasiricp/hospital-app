// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print, file_names


import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class RadiologyBill extends StatefulWidget {
  const RadiologyBill({Key? key}) : super(key: key);

  @override
  State<RadiologyBill> createState() => _RadiologyBillState();
}

class _RadiologyBillState extends State<RadiologyBill> {
  String patientId = "10380";
  String apiUrl =
      "https://uat.tez.hospital/xzy/webservice/getAllPayment"; // Replace with your API endpoint
  String authKey = "zbuks_ram859553467"; // Replace with your auth key
  Map<String, dynamic>? responseData;
  List<dynamic>? DoneListData = [];
  bool isLoading = true;

  void fetchData() async {
    setState(() {
      isLoading = true;
      responseData;
      DoneListData;
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': authKey,
        },
        body: json.encode({"patient_id": patientId}),
      );

      if (response.statusCode == 200) {
        setState(() {
          responseData = json.decode(response.body);
          DoneListData = responseData?['radiology_bill'];
          print(DoneListData);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          // responseData = Error: ${response.statusCode};
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        // responseData = "Error: $e";
        print("$Error");
      });
    }
  }

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: width,
                  height: height,
                  child: ListView.builder(
                      itemCount: isLoading ? 10 : DoneListData!.length,
                      itemBuilder: (context, index) {
                        if (isLoading) {
                          return Shimmer.fromColors(
                            baseColor: Colors.blue.shade100,
                            highlightColor: Colors.grey.shade100,
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
                        } else {
                          return Container(
                            width: width,
                            child: Card(
                                color: Colors.white70.withOpacity(0.7),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Bill No.: ${DoneListData![index]['id'] ?? ""}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "HIS No: ${DoneListData![index]['case_reference_id'] ?? "10147"}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextButton.icon(
                                              onPressed: () {
                                                Get.to(() =>
                                                    const ViewBillDetiles());
                                              },
                                              icon: const Icon(Icons.view_list),
                                              label: const Text('View'))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Date: ${DoneListData![index]['date']}',
                                            style: const TextStyle(
                                                color: Colors.blue),
                                          ),
                                          Container(
                                              height: 20,
                                              width: width / 3,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text(
                                                "Total :${DoneListData![index]['total'] ?? ""}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Doctor: ${DoneListData![index]['doctor_name'] ?? "Nasir Khan"}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        )));
  }
}
