// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Examination.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Pre_Checking.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_investigation.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OpdCheckout.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
// ignore_for_file: unnecessary_null_comparison, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Das_screen extends StatefulWidget {
  final String? opdID;
  final String? patientName;
  final String? mobileNo;
  final String? name;
  final String? surname;
  final String? lastVisit;
  final String? totalVisit;
  final String? gender;
  final String? guardianName;


  const Das_screen({
    Key? key,
    this.patientName,
    this.mobileNo,
    this.name,
    this.surname,
    this.lastVisit,
    this.totalVisit,
    this.gender,
    this.guardianName, this.opdID,
  }) : super(key: key);

  @override
  State<Das_screen> createState() => _Das_screenState();
}

class _Das_screenState extends State<Das_screen> {
  late String patientID = '';
  @override
  void initState() {
    super.initState();
  }

  List<dynamic>? DoneListData = [];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_, child) => Scaffold(
            appBar: AppBar(
              title: Text('Details'.tr),
              centerTitle: true,
              backgroundColor: darkYellow,
            ),
            backgroundColor: Colors.lightBlue[50],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Patient Information'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Patient Name: '.tr),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('OPD ID: '.tr),
                                    const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Gender: '.tr),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Phone: '.tr),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Last Visit: '.tr),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Total Visit: '.tr),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.patientName!.isEmpty
                                        ? "N/A"
                                        : widget.patientName!,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                    Text(
                                    widget.opdID!.isEmpty
                                        ? "N/A"
                                        : widget.opdID!,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                   const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.gender!.isEmpty
                                        ? "N/A"
                                        : widget.gender!,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.mobileNo!.isEmpty
                                        ? "N/A"
                                        : widget.mobileNo!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.lastVisit!.isEmpty
                                        ? "N/A"
                                        : DateFormat("dd/MM/yyyy hh:mm a")
                                            .format(
                                            DateTime.parse(widget.lastVisit!),
                                          ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.totalVisit!.isEmpty
                                        ? "N/A"
                                        : widget.totalVisit!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            children: [
                              CardDesign(
                                () {
                                  Get.to(() =>  OpdPreChecking(opdID: widget.opdID,));
                                },
                                SvgPicture.asset(
                                  'assets/emergency.svg',
                                  width: 30,
                                  height: 30,
                                  // color: Colors.white,
                                ),
                                'Pre-Checking'.tr,
                              ),
                              CardDesign(
                                () {
                                  Get.to(() => const OpdExamination());
                                },
                                SvgPicture.asset(
                                  'assets/emergency.svg',
                                  width: 30,
                                  height: 30,
                                  // color: Colors.white,
                                ),
                                'Examination'.tr,
                              ),
                              CardDesign(
                                () {
                                  Get.to(() => const OpdInvestigation());
                                },
                                SvgPicture.asset(
                                  'assets/emergency.svg',
                                  width: 30,
                                  height: 30,
                                  // color: Colors.white,
                                ),
                                'Investigation'.tr,
                              ),
                              CardDesign(
                                () {
                                  Get.to(() => const Opd_Check_Out());
                                },
                                SvgPicture.asset(
                                  'assets/emergency.svg',
                                  width: 30,
                                  height: 30,
                                  // color: Colors.white,
                                ),
                                'Checkout'.tr,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vitals'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            color: Colors.green,
                            width: width,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Height'.tr,
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Weight'.tr,
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "BP",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Pulse'.tr,
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Temperature'.tr,
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Respiration'.tr,
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "5.5Ft",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "50kg",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "120/180",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "120",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "98.6",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            "12",
                                            overflow: TextOverflow
                                                .ellipsis, // Use ellipsis to cut off the text
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Symptoms:'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Known Allergies:'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diagnosis:'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CONSULTANT DOCTOR:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  // Add other widgets related to the consultant doctor here
                                ],
                              ),
                              // Add a button to the right side
                              ElevatedButton(
                                onPressed: () {
                                  // Add your button click functionality here
                                },
                                child: const Text('Add doctor'),
                              ),
                            ],
                          ),
                          Container(
                              height: 200,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  // itemCount: DoneListData!.length,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Container(
                                        width: width,
                                        child: Card(
                                            color:
                                                Colors.white.withOpacity(0.7),
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
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                            'assets/Noimagedoctor.svg',
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.fill,
                                                            color: darkYellow),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Ramjinish Kushwaha",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget buildVitalItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding CardDesign(ontap, iconWidget, iconName) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkYellow,
                ),
                child: Center(child: iconWidget),
              ),
              const SizedBox(height: 10),
              Text(
                iconName,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Adjust the text color
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
