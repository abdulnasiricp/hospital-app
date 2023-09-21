// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print, file_names


import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class BloodBank extends StatefulWidget {
  const BloodBank({Key? key}) : super(key: key);

  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank>  {
 String username = '';
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    username = sp.getString('usernamerecord') ?? '';
    patient = sp.getString('patientidrecord') ?? '';

    print(patient);
    setState(() {});
  }

  bool noDataAvailable = false;

  String apiUrl = "https://uat.tez.hospital/xzy/webservice/getAllPayment";
  String authKey = "zbuks_ram859553467";
  Map<String, dynamic>? responseData;
  List<dynamic>? DoneListData = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': authKey,
        },
        body: json.encode({"patient_id": patient}),
      );

      if (response.statusCode == 200) {
        setState(() {
          responseData = json.decode(response.body);
          DoneListData = responseData?['bloodbank'];
          print(DoneListData);
          isLoading = false;
        });
        if (DoneListData == null || DoneListData!.isEmpty) {
          // If no data is available, set a flag to display "No data available" text.
          noDataAvailable = true;
        } else {
          // If data is available, reset the flag.
          noDataAvailable = false;
        }
      } else {
        setState(() {
          isLoading = false;
          // responseData = Error: ${response.statusCode};
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        // Text('No data found');
        print("$e");
      });
    }
  }

  getAllData() async {
    await LoadData();

    await fetchData();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true to show shimmer
    });

    // Fetch data when the user pulls down to refresh
    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: width,
                    height: height,
                    child: isLoading
                        ? ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
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
                            },
                          )
                        : DoneListData == null || DoneListData!.isEmpty
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
                                itemCount: DoneListData!.length,
                                itemBuilder: (context, index) {
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Bill No.: ${DoneListData![index]['id']}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "HIS No: ${DoneListData![index]['case_reference_id']}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextButton.icon(
                                                      onPressed: () {
                                                        Get.to(() =>
                                                            const ViewBillDetiles());
                                                      },
                                                      icon: const Icon(
                                                          Icons.view_list),
                                                      label: const Text('View'))
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                          child: Text(
                                                        "Total :${DoneListData![index]['total']}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ))),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Doctor: ${DoneListData![index]['doctor_name']}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(patient)
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
