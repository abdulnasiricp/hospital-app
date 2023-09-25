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

class MainTransaction extends StatefulWidget {
  const MainTransaction({Key? key}) : super(key: key);
  @override
  State<MainTransaction> createState() => _MainTransactionState();
}
class _MainTransactionState extends State<MainTransaction> {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
