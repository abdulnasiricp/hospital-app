
// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PathologyScreen extends StatefulWidget {
  const PathologyScreen({Key? key}) : super(key: key);

  @override
  _PathologyScreenState createState() => _PathologyScreenState();
}

class _PathologyScreenState extends State<PathologyScreen> {
  bool isLoading = true;
  String totalAmount = "0.0"; // Initialize with a default value
  Map<String?, dynamic> apiData = {};

  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

 

getData()async{
await LoadData();
await fetchData().then((data) {
    setState(() {
      apiData = data;
      // Parse and update the total amount
      if (data.containsKey("total")) {
        totalAmount = "${data["total"]}";
      }
    });
  }).catchError((error) {
    // Handle errors here
    print('Error: $error');
  });
}
  @override
void initState() {
  super.initState();
  getData();
 
}

  Future<Map<String, dynamic>> fetchData() async {
    final url =
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllTransaction');
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
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
      appBar: AppBar(
        title: const Text(EnString.pathology),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(children: [
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
                    EnString.billno,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.payment,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.status,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.amount,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                          final transaction = apiData[index.toString()];
                          if (transaction != null && transaction.containsKey('id')){
                          return InkWell(
                            onTap: () {
                            // Get.to(
                            //   () => ViewBillDetiles(
                            //     // billNo: ${data['bill_no']}
                            //     // billname: listName,
                            //   ),

                            // print(listName);
                            },

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 5, right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white70, // Background color
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Border radius
                                    ),
                                    width: width,
                                    height: height / 15,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${transaction['bill_no']}",
                                            style: const TextStyle(),
                                          ),
                                          const Text(
                                            'paid',
                                            // "${transaction['section']}",
                                            style: TextStyle(),
                                          ),
                                          const Text(
                                           'pay bill',
                                            // "${transaction['bill_no']}",
                                            style: TextStyle(),
                                          ),
                                          Text(
                                            // 'Rs.${item.total}',
                                            "${transaction['amount']}",
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          }
                          return null;
                        }),
          ),
        ]),
      ),
      bottomSheet: Card(
        child: Container(
          height: height / 15,
          width: width,
          color: darkYellow,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(EnString.total,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text("Rs.$totalAmount",
                      // $totalSum",
                      style: const TextStyle(color: Colors.red, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

