
// ignore_for_file: non_constant_identifier_names, file_names, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/All_doctors.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Card/Card.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Category_View_All.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_main_screen.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  String role = '';
  String username = '';
  String record = '';
  String genderrecord = '';

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      role = sharedPreferences.getString('role') ?? '';
      username = sharedPreferences.getString('usernamerecord') ?? '';
      record = sharedPreferences.getString('record') ?? '';
      genderrecord = sharedPreferences.getString('genderrecord') ?? '';
    });
  }

  Future<Map<String, dynamic>?> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error getting Products: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "प्रादेशिक अस्पताल सिराहा, नेपाल",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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

      body: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Lottie.asset('assets/loading1.json'),
                  ),
                ),
              );
            // } else if (snapshot.hasError || snapshot.data == null) {
            //   return const Center(
            //     child: Text('Error loading data'),
            //   );
            } else {
              
              Map<String, dynamic>? dataMap = snapshot.data;
              List<dynamic>? doneListData = dataMap?['doctors'];

              return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Welcome,\n $username',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: darkYellow),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Category",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                const Category_View_All());
                                          },
                                          child: const Text("View All",
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
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(() =>
                                                    const MainTransactionScreen());
                                              },
                                              child: Card(
                                                borderOnForeground: true,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                        width: 50,
                                                        height: 50,
                                                        child: Image.asset(
                                                            'assets/transation.png')),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text("Transactions",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() =>  const CardScreen());
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
                                                        width: 40,
                                                        height: 40,
                                                        child: Image.asset(
                                                            'assets/credit.png')),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text("Card",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() =>
                                                  const MainTransactionScreen());
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
                                                        width: 40,
                                                        height: 40,
                                                        child: Image.asset(
                                                            'assets/inpatient.png')),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text("IPD",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/OPD_Icon.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("OPD",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/pathology.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Pathology",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/radiology.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Radiology",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/pharmacy.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Pharmacy",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/USG.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("USG",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/surgery.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Surgery",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/bloodbank.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Blood Bank",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/ambulance.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Ambulance",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/physioTherpy.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Physio Therapy",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/certificate.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Certificates",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/bedHistory.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Bed History",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: Image.asset(
                                                          'assets/liveConsulations.png')),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                      "      Live \nConsultations",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Doctors",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            Get.offAll(
                                                () => const AllDoctorsList());
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           const AllDoctorsList()),
                                            // );
                                          },
                                          child: const Text("View All",
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
                                    Column(children: [
                                      Container(
                                        width: width,
                                        height: height,
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                doneListData?.length ?? 0,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: width,
                                                child: Card(
                                                    color: Colors.white70
                                                        .withOpacity(0.7),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: width / 5,
                                                            height: 100,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.network(
                                                                '${doneListData![index]['image']}',
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                'Dr. ${doneListData[index]['name']} ${doneListData[index]['surname']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${doneListData[index]['specialization']}',
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
                                                                "${doneListData[index]['contact_no']}",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${doneListData[index]['email']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                      child:
                                                                          Text(
                                                                    '${doneListData[index]['qualification']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .green),
                                                                  )),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    '${doneListData[index]['work_exp']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              );
                                            }),
                                      ),
                                    ])
                                  ]))
                        ])
                  ]));
            }
          }
          ),
      drawer: const AboutUSScreen(), // Left drawer
      endDrawer: const Notif(),
    ));
  }
}
