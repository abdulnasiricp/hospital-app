import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Billview.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Reportview.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Liveconsultation extends StatefulWidget {
  // const Liveconsultation({super.key});

  @override
  State<Liveconsultation> createState() => _LiveconsultationState();
}

class _LiveconsultationState extends State<Liveconsultation> {
  bool isLoading = true;
  List<Map<String, dynamic>> apiData = []; // Initialize as a list

  late String patient = '';
  late String totalAmount = "0.00"; // Initialize with a default value

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

        // Calculate and update the total amount
        double sum = 0.0;
        for (var Pathologybill in apiData) {
          if (Pathologybill.containsKey('net_amount')) {
            sum += double.tryParse("${Pathologybill['net_amount']}") ?? 0.0;
          }
        }
        totalAmount = sum.toStringAsFixed(2);

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
    Uri.parse(ApiLinks.pathology);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      Uri.parse(ApiLinks.pathology),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(EnString.Liveconsultation),
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
              height: height / 20,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OPD / IPD",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text("Doctor",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      EnString.Date,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ), Text("Duration ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      EnString.status,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            title: Container(
                              width: 150,
                              height: 15,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              width: 100,
                              height: 8,
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
                            final Pathologybill = apiData[index];
                            if (Pathologybill.containsKey('id')) {
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
                                            "${Pathologybill['id']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,fontSize: 8,

                                            ),
                                          ),
                                          InkWell(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                // listName,
                                                "Ramjinish Prasad Kushwaha",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                "02/10/2023 9:41 PM",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    fontSize: 10
                                                ),
                                              ),
                                            ),
                                          ), InkWell(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                "30 minutes",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    fontSize: 10
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .green, // Background color
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      2.0), // Rounded corners
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.video_call,
                                                    color: Colors.white,
                                                  ),
                                                  const Text(
                                                    "Join",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
