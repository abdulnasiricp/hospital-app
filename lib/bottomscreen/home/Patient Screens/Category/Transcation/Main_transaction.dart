// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, deprecated_member_use, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Pathology_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/ambulance_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/bloodbank.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/pharmacy_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/radiology_bill.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainTransaction extends StatefulWidget {
  const MainTransaction({Key? key}) : super(key: key);

  @override
  State<MainTransaction> createState() => _MainTransactionState();
}

class _MainTransactionState extends State<MainTransaction> {
  String role = '';
  String username = '';
  String record = '';
  String image = '';
  String genderrecord = '';
  String mobilerecord = '';
  String Patient_id = '';
  bool isLoading = true;
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
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
      mobilerecord = sharedPreferences.getString('mobilerecord') ?? '';
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
      image = sharedPreferences.getString('imagerecord') ?? '';
    });
  }

  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Transaction'),
            centerTitle: true,
            backgroundColor: darkYellow,
            // elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Aligns children to the start and end of the row
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligns text to the start of the column
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Welcome,\n $username',
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
                                'Patient Id:- $Patient_id',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'HIS NO:- $Patient_id',
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
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey, // Set your desired background color
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hospital Dues Balance',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: Text(
                                  'Rs.1000',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add your button click logic here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // Background color
                              onPrimary: Colors.white, // Text color
                              elevation: 0, // Elevation
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10), // Padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Button border radius
                              ),
                            ),
                            child: const Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap:
                                true, // Set to true to make the GridView scrollable within the Column
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => const DirectBill());
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
                                          child: SvgPicture.asset(
                                              'assets/bill.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Direct Billing",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const PathologyBill());
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
                                          child: SvgPicture.asset(
                                              'assets/pathology.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Pathology",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const RadiologyBill());
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
                                          child: SvgPicture.asset(
                                              'assets/radiology.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Radiology",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const BloodBank());
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
                                          child: SvgPicture.asset(
                                              'assets/blood_bank.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Blood Bank",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const PharmacyBill());
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
                                          child: SvgPicture.asset(
                                              'assets/pharmacy.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Pharmacy",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const AmbulanceBill());
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
                                          child: SvgPicture.asset(
                                              'assets/ambulance.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Ambulance",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
