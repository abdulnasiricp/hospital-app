import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/All_doctors.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Card/Card.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Category_View_All.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Main_transaction.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_main_screen.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
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
  bool isLoading = true;
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  @override
  void initState() {
    super.initState();
    hitApi();
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
            "प्रादेशिक अस्पताल सिराहा, नेपाल",
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
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: isLoading
              ? Center(
                  child: Container(
                  height: 100,
                  width: 100,
                  child: Center(child: LoadingIndicatorWidget()),
                ))
              : SingleChildScrollView(
                  child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Category",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const Category_View_All());
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
                                        Get.to(() => Main_transaction());
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
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const CardScreen());
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
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    // onTap: () {
                                    //   Get.to(
                                    //       () => const MainTransactionScreen());
                                    // },
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
                                                  fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Doctors",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(() => const AllDoctorsList());
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
                                                'assets/loading1.json'),
                                          ));
                                        } else {}
                                        return Container(
                                          width: width,
                                          child: Card(
                                              color: Colors.white70
                                                  .withOpacity(0.7),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: width / 5,
                                                      height: 100,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          '${DoneListData![index]['image']}', // Replace with your image URL
                                                          width:
                                                              200.0, // Set the width (optional)
                                                          height:
                                                              200.0, // Set the height (optional)
                                                          fit: BoxFit
                                                              .cover, // Set the BoxFit (optional)
                                                          loadingBuilder: (context,
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
                                                          overflow: TextOverflow
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
                                                          '${DoneListData![index]['specialization']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "${DoneListData![index]['contact_no']}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '${DoneListData![index]['email']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
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
                                                                child: Text(
                                                              '${DoneListData![index]['qualification']}',
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

                                                            // Text('${DoneListData![index]['work_exp']},'),
                                                            Text(
                                                              '${DoneListData![index]['work_exp']}',
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );

                } else if (status == ConnectivityStatus.offline) {
                  return const NoInternetScreen();
                } else {
                  // status == ConnectivityStatus.checking
                  return  Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Lottie.asset('assets/loading1.json'),
                    ),
                  );
                } },
        ) ,
        ),
        drawer: const AboutUSScreen(), // Left drawer
        endDrawer: const Notif(),
      ),
    );
  }
}
