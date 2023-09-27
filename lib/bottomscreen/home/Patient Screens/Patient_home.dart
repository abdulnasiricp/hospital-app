// ignore_for_file: sized_box_for_whitespace, file_names, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/All_doctors.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Card/Card.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/IPD.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/ambulance_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/pharmacy_bill.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/LoadingWidget.dart';
import 'package:TezHealthCare/widgets/No_internet_screen.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class PatientHomePage extends StatefulWidget {
  final String? patientId;
  const PatientHomePage({Key? key, this.patientId}) : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  double totalSum = 0.0;
  // Initialize with a default value

  Future<void> getTotalSum() async {
    final sp = await SharedPreferences.getInstance();
    final patientSpecificKey =
        'totalSum_${widget.patientId}'; // Use the patient's ID in the key
    final storedTotalSum = sp.getDouble(patientSpecificKey);
    if (storedTotalSum != null) {
      setState(() {
        totalSum = storedTotalSum;
      });
    }
  }

  String role = '';
  String username = '';
  String record = '';
  String genderrecord = '';
  bool isLoading = true;
  String Patient_id = '';
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  @override
  void initState() {
    super.initState();
    getTotalSum();
    LoadData();

    hitApi();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      role = sharedPreferences.getString('role') ?? '';
      username = sharedPreferences.getString('usernamerecord') ?? '';
      record = sharedPreferences.getString('record') ?? '';
      genderrecord = sharedPreferences.getString('genderrecord') ?? '';
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  Future<void> hitApi() async {
    try {
      final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          DataMap = jsonDecode(response.body);
          DoneListData = DataMap!['doctors'];
          isLoading = false; // Set isLoading to false after successful response
        });
      } else {
        print('Error getting Products: ${response.statusCode}');
        setState(() {
          isLoading = false; // Set isLoading to false in case of error
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false; // Set isLoading to false in case of an exception
      });
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await hitApi();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 100,
          title: const Text(
            EnString.hospitalTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => const AboutUSScreen());
                },
                child: Image.asset(
                  'assets/hospital_logo.png',
                  width: 200,
                  height: 200,
                ),
              )),
          actions: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  Get.to(() => const Notif());
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          ],
          backgroundColor: darkYellow,
          elevation: 0,
        ),
        body: ConnectivityBuilder(
          interval: const Duration(seconds: 5),
          builder: (ConnectivityStatus status) {
            if (status == ConnectivityStatus.online) {
              return RefreshIndicator(
                onRefresh: _handleRefresh,
                child: isLoading
                    ? Center(
                        child: Container(
                        height: 100,
                        width: 100,
                        child: LoadingIndicatorWidget(),
                      ))
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Aligns children to the start and end of the row
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Aligns text to the start of the column
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          '${EnString.welcome} $username',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end, // Aligns text to the end of the column
                                      children: [
                                        Text(
                                          '${EnString.patientId} $Patient_id',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '${EnString.hisNo} $Patient_id',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              totalSum == 0.0
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Card(
                                          color:
                                              Colors.white70.withOpacity(0.7),
                                          child: Container(
                                            height: 50,
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      EnString.hospitaldueBalance,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkYellow,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30.0),
                                                      child: Text(
                                                        'Rs.$totalSum',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Add your button click logic here
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                    backgroundColor: Colors
                                                        .green, // Text color
                                                    elevation: 0, // Elevation
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical:
                                                            10), // Padding
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // Button border radius
                                                    ),
                                                  ),
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.white,
                                                    highlightColor: Colors.grey,
                                                    child: const Text(
                                                      'Pay Now',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                          
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     const Text("Category",
                                    //         style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //         )),
                                    //     InkWell(
                                    //       onTap: () {
                                    //         Get.to(
                                    //             () => const Category_View_All());
                                    //       },
                                    //       child: const Text("View All",
                                    //           style: TextStyle(
                                    //               fontSize: 12,
                                    //               fontWeight: FontWeight.bold,
                                    //               color: Colors.black)),
                                    //     ),
                                    //   ],
                                    // ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GridView.count(
                                            crossAxisCount: 5,
                                            shrinkWrap:
                                                true, // Set to true to make the GridView scrollable within the Column
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const TransactionBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/transaction.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.transactionBill,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      () => const CardScreen());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 7,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/card.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.card,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() => const IPD());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/ipd.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.idp,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // InkWell(
                                              //   onTap: () {
                                              //     Get.to(() => const BloodBank());
                                              //   },
                                              //   child: Container(
                                              //     width: 100,
                                              //     height: 100,
                                              //     child: Card(
                                              //       child: Column(
                                              //         children: [
                                              //           const SizedBox(
                                              //             height: 5,
                                              //           ),
                                              //           Container(
                                              //             width: 30,
                                              //             height: 30,
                                              //             child: SvgPicture.asset(
                                              //                 'assets/opd.svg',
                                              //                 width: 15,
                                              //                 height: 15,
                                              //                 color: darkYellow),
                                              //           ),
                                              //           const SizedBox(
                                              //             height: 10,
                                              //           ),
                                              //           const Text("OPD",
                                              //               style: TextStyle(
                                              //                 fontSize: 5,
                                              //                 fontWeight:
                                              //                     FontWeight.bold,
                                              //               ))
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const PharmacyBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/pathology.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.pathology,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/radiology.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.radiology,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/pharmacy.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.pharmacy,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/usg.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.usg,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/surgery.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.surgery,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/blood_bank.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.bloodBank,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/ambulance.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.ambulance,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/therapy.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                            EnString.physioTherapy,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/certificate.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.certificates,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/bed_history.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(EnString.bedHistory,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const AmbulanceBill());
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: SvgPicture.asset(
                                                              'assets/live_consult.svg',
                                                              width: 15,
                                                              height: 15,
                                                              color:
                                                                  darkYellow),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                            EnString.liveConsultations,
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(EnString.doctors,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        InkWell(
                                          onTap: () {
                                            Get.offAll(
                                                () => const AllDoctorsList());
                                          },
                                          child: const Text(EnString.viewAll,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: width,
                                          height: height,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: DoneListData!.length,
                                              itemBuilder: (context, index) {
                                                if (DoneListData == null ||
                                                    DoneListData!.isEmpty) {
                                                  return Center(
                                                      child: Center(
                                                    child: Lottie.asset(
                                                        'assets/tez_spin.json'),
                                                  ));
                                                } else {
                                                  return Container(
                                                    width: width,
                                                    child: Card(
                                                        color: Colors.white70
                                                            .withOpacity(0.7),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width:
                                                                    width / 5,
                                                                height: 100,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child: Image
                                                                      .network(
                                                                    '${DoneListData![index]['image']}', // Replace with your image URL
                                                                    width:
                                                                        200.0, // Set the width (optional)
                                                                    height:
                                                                        200.0, // Set the height (optional)
                                                                    fit: BoxFit
                                                                        .cover, // Set the BoxFit (optional)
                                                                    loadingBuilder:
                                                                        (context,
                                                                            child,
                                                                            loadingProgress) {
                                                                      if (loadingProgress ==
                                                                          null) {
                                                                        return child;
                                                                      } else {
                                                                        return CircularProgressIndicator(
                                                                          color:
                                                                              darkYellow,
                                                                          backgroundColor:
                                                                              yellow,
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Dr. ${DoneListData![index]['name']} ${DoneListData![index]['surname']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    '${DoneListData![index]['specialization']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .blue),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    '${DoneListData![index]['email']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    // style: const TextStyle(
                                                                    //     fontWeight:
                                                                    //     FontWeight.bold),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      // Text('${DoneListData![index]['qualification']},'),
                                                                      Container(
                                                                          child:
                                                                              Text(
                                                                        '${DoneListData![index]['qualification']}',
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.green),
                                                                      )),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),

                                                                      // Text('${DoneListData![index]['work_exp']},'),
                                                                      Text(
                                                                        '${DoneListData![index]['work_exp']}',
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  );
                                                }
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            } else if (status == ConnectivityStatus.offline) {
              return const NoInternetScreen();
            } else {
              // status == ConnectivityStatus.checking
              return Center(
                child: LoadingIndicatorWidget(),
              );
            }
          },
        ),
        drawer: const AboutUSScreen(), // Left drawer
        endDrawer: const Notif(),
      ),
    );
  }
}
