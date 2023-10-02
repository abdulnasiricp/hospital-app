// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacybillprint.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);
  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
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
        for (var Pharmacybill in apiData) {
          if (Pharmacybill.containsKey('net_amount')) {
            sum += double.tryParse("${Pharmacybill['net_amount']}") ?? 0.0;
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
    Uri.parse(ApiLinks.pharmacy);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      Uri.parse(ApiLinks.pharmacy),
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
        title: const Text(EnString.Pharmacy),
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
                      EnString.billno,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      EnString.Medicin,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      EnString.Status,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      EnString.amount,
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
                            final Pharmacybill = apiData[index];
                            if (Pharmacybill.containsKey('id')) {
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
                                            "${Pharmacybill['id']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          InkWell(
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text(
                                                "${Pharmacybill['Medicine']}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                () => Pharmacybillprint(
                                                  bill_pdf:
                                                      "${Pharmacybill['bill_pdf']}", // Use 'id' as the Pharmacybill ID
                                                  id: "${Pharmacybill['id']}",
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Pharmacybill['status'] ==
                                                        'Paid'
                                                    ? Colors.green
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Text(
                                                  // listName,
                                                  "${Pharmacybill['status']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // 'Rs.${item.total}',
                                            "${Pharmacybill['net_amount']}", // Use 'net_amount' for the amount
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
      bottomSheet: apiData.isEmpty
          ? null // Set bottomSheet to null when apiData is empty
          : Card(
              child: Container(
                height: height / 15,
                width: width,
                color: darkYellow,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        EnString.total,
                        style: TextStyle(
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
    );
  }
}
