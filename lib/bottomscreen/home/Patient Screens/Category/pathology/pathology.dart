// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';

import 'package:TezHealthCare/Controller/notificationProvider.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Billview.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Reportview.dart';
import 'package:TezHealthCare/main.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Pathalogy extends StatefulWidget {
  const Pathalogy({Key? key}) : super(key: key);

  @override
  State<Pathalogy> createState() => _PathalogyState();
}

class _PathalogyState extends State<Pathalogy> {
  /////////////////////////////////////////////////////////////////////////
  // show notification
  void showNotification() async {
    AndroidNotificationDetails androidDetiles =
        const AndroidNotificationDetails(
      'Notification',
      'Discounter',
      priority: Priority.max,
      importance: Importance.max,
    );

    DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetiles,
      iOS: iosDetiles,
    );
    await notificationsPlugin.show(
        0, 'pathology', 'New data are added', notificationDetails);
  }
  /////////////////////////////////////////////////////////////////////////////////////

  bool isLoading = true;
  late String totalAmount = "0.00"; // Initialize with a default value
  List<Map<String, dynamic>> apiData = []; // Initialize as a list

////////////////////////////////////////////////////////////////////////////////////////////
// get Shared prefernce data

  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

///////////////////////////////////////////////////////////////////////////////////////////////

  getData() async {
    await LoadData();
    await fetchData();
    calculateTotalAmount();

    isLoading = false;
    // Check if the length of apiData has changed
    // if (apiData.length != previousApiData.length) {
    //   showNotification();
    // }
  }

// ///////////////////////////////////////////////////////////////////////////////////////////////
//calculate total amount
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

  //////////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    getData();
  }

////////////////////////////////////////////////////////////////////////////////////////////
// Get pathology data
  Map<String, dynamic>? DataMap;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];

  Future<Map<String, dynamic>> fetchData() async {
    Uri.parse(ApiLinks.pathology);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };
    try {
      final response = await http.post(
        Uri.parse(ApiLinks.pathology),
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
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false; // Set isLoading to false on error
      });
    }
    return {};
  }

////////////////////////////////////////////////////////////////////////////////////////
//refresh screen
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });

    final notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    const notificationMessage = 'New data are added';
    final notificationData = {
      'key1': 'value1',
      'key2': 'value2'
    }; // Replace with your data
    notificationProvider.addNotification(notificationMessage, notificationData);
  }

  /////////////////////////////////////////////////////////////////////////////////////

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

  //////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            height: 40,
            width: width,
            child: searchField()),
          centerTitle: true,
          backgroundColor: darkYellow,
          leading: IconButton(
            onPressed: () {
              Get.to(() => const Bottomhome());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showNotification();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 40,
              //     child: searchField(),
              //   ),
              // ),
              Container(
                color: Colors.grey,
                width: width,
                height: height / 20,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                              'Payment'.tr,
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
                            itemCount: filteredData!.length,
                            itemBuilder: (context, index) {
                              final Pathologybill = filteredData![index];
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
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 8,
                                                  child: Center(
                                                    child: Text(
                                                      "${Pathologybill['id']}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (Pathologybill[
                                                              'status'] ==
                                                          'Paid') {
                                                        Get.to(
                                                          () =>
                                                              pathologyBillview(
                                                            bill_pdf:
                                                                "${Pathologybill['bill_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                          ),
                                                        );
                                                      } else {
                                                        Get.to(
                                                          () =>
                                                              pathologyBillview(
                                                            bill_pdf:
                                                                "${Pathologybill['bill_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Pathologybill[
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
                                                            "${Pathologybill['status']}",
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
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 4,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (Pathologybill[
                                                              'is_printed'] ==
                                                          '1') {
                                                        Get.to(
                                                          () => pathologyReport(
                                                            report_pdf:
                                                                "${Pathologybill['report_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                "Pathology report is currently printing. Please stay tuned."),
                                                            backgroundColor:
                                                                Colors.red,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Pathologybill[
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
                                                            Pathologybill[
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
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 7,
                                                  child: Center(
                                                    child: Text(
                                                      "${Pathologybill['net_amount']}",
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
                  height: height / 15,
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

  TextFormField searchField() {
    return TextFormField(
                  onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                  controller: searchController,
                  onChanged: (query) => filterData(query),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                );
  }
}
