// ignore_for_file: camel_case_types, avoid_unnecessary_containers, unused_local_variable, unnecessary_string_interpolations

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/Cardex/IPD_Cardex.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Bed_History.dart';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Medication.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Operations.dart';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Overview/IPD_OverviewMain.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Bed_History.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Cardex_Report.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/OPD_Medication.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Operation_Report.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Pathology_Report.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Prescription.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Report/Radilogy_Report.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
// ignore_for_file: unnecessary_null_comparison, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class IPD_Das_screen extends StatefulWidget {
  final String? IpdID;
  final String? patientName;
  final String? title;
  final String? mobileNo;
  final String? name;
  final String? surname;
  final String? lastVisit;
  final String? totalVisit;
  final String? gender;
  final String? guardianName;
  final String? IpdVisitDetailsID;
  final String? status;
  final String? employee_id;
  final String? case_reference_id;
  final String? patient_id;

  const IPD_Das_screen({
    Key? key,
    this.patientName,
    this.title,
    this.name,
    this.patient_id,
    this.employee_id,
    this.status,
    this.mobileNo,
    this.surname,
    this.lastVisit,
    this.totalVisit,
    this.gender,
    this.guardianName,
    this.case_reference_id,
    this.IpdID,
    this.IpdVisitDetailsID,
  }) : super(key: key);

  @override
  State<IPD_Das_screen> createState() => _IPD_Das_screenState();
}

class _IPD_Das_screenState extends State<IPD_Das_screen> {
  late String patientID = '';
  @override
  void initState() {
    super.initState();
    fetchRadiologyData();
    fetchConsultantData();
    fetchDoctorlisttData();
  }

  List<dynamic>? radiologydata = [];
  List<dynamic>? radiologyfilteredData = [];
  bool isLoading = false;
  Future<void> fetchRadiologyData() async {
    setState(() {
      isLoading = true;
    });

    final Uri url = Uri.parse(ApiLinks.singleTableDataDetector);
    final body = {
      "table": "visit_details",
      "where": {"ipd_details_id": widget.IpdID}
    };

    final response = await http.post(
      url,
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final List<dynamic> rawData = dataMap['result'];
      radiologydata = rawData;
      print(
          "++++ddscsd++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$radiologydata");
      setState(() {
        radiologydata = rawData;
        isLoading = false;
      });
    } else {
      handleNonJsonResponse();
      isLoading = false;
    }
  }

  void handleNonJsonResponse() {
    print('Non-JSON response or API error');
    setState(() {
      isLoading = false;
    });
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////// for getting consultant list
  List<dynamic>? Data = [];
  List<dynamic>? Doctorlist = [];
  Future<void> fetchConsultantData() async {
    setState(() {
      isLoading = true;
    });

    final Uri url = Uri.parse(ApiLinks.getOpdIpdDoctor);
    final body = {"ipd_id": widget.IpdID};

    final response = await http.post(
      url,
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Data = json.decode(response.body);
      final List<dynamic> rawData = Data['result'];
      Doctorlist = rawData;
      setState(() {
        Doctorlist = rawData;
        print("  All Doctpor=================+++++++++++++++$Data");
        isLoading = false;
      });
    } else {
      handleNonJsonResponse();
      isLoading = false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true;
    });

    await fetchRadiologyData();
    await fetchConsultantData();

    setState(() {
      isLoading = false;
    });
  }

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
            body: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: isLoading
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.transparent,
                          child: const LoadingIndicatorWidget(),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Patient Name: '.tr),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('IPD ID: '.tr),
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
                                          // Text('Last Visit: '.tr),
                                          // const SizedBox(
                                          //   height: 5,
                                          // ),
                                          // Text('Total Visit: '.tr),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            widget.IpdID!.isEmpty
                                                ? "N/A"
                                                : widget.IpdID!,
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
                                          // Text(
                                          //   widget.lastVisit!.isEmpty
                                          //       ? "N/A"
                                          //       : DateFormat(
                                          //               "dd/MM/yyyy hh:mm a")
                                          //           .format(
                                          //           DateTime.parse(
                                          //               widget.lastVisit!),
                                          //         ),
                                          //   maxLines: 2,
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: const TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                          // const SizedBox(
                                          //   height: 5,
                                          // ),
                                          // Text(
                                          //   widget.totalVisit!.isEmpty
                                          //       ? "N/A"
                                          //       : widget.totalVisit!,
                                          //   maxLines: 2,
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: const TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 5,
                                    shrinkWrap: true,
                                    children: [
                                      CardDesign(
                                        () {
                                          Get.to(
                                              (const IpdOverviewMainScreen()));
                                        },
                                        SvgPicture.asset(
                                          'assets/emergency.svg',
                                          width: 30,
                                          height: 30,
                                          // color: Colors.white,
                                        ),
                                        'OverView'.tr,
                                      ),
                                      CardDesign(
                                        () {
                                          Get.to((const IPDCardex()));
                                        },
                                        SvgPicture.asset(
                                          'assets/emergency.svg',
                                          width: 30,
                                          height: 30,
                                          // color: Colors.white,
                                        ),
                                        'Cardex'.tr,
                                      ),
                                      CardDesign(
                                        () {
                                          Get.to((const IpdMedication()));
                                        },
                                        SvgPicture.asset(
                                          'assets/emergency.svg',
                                          width: 30,
                                          height: 30,
                                          // color: Colors.white,
                                        ),
                                        'Medication'.tr,
                                      ),
                                      CardDesign(
                                        () {
                                          Get.to((const IpdOperations()));
                                        },
                                        SvgPicture.asset(
                                          'assets/emergency.svg',
                                          width: 30,
                                          height: 30,
                                          // color: Colors.white,
                                        ),
                                        'Operation'.tr,
                                      ),
                                      CardDesign(
                                        () {
                                          Get.to((const IpdBedHistory()));
                                        },
                                        SvgPicture.asset(
                                          'assets/emergency.svg',
                                          width: 30,
                                          height: 30,
                                          // color: Colors.white,
                                        ),
                                        'Bed History'.tr,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reports'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.count(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 4,
                                      shrinkWrap: true,
                                      children: [
                                        CardDesign(
                                          () {
                                            Get.to(
                                                () => const Pathology_Report());
                                          },
                                          SvgPicture.asset(
                                            'assets/pathology.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Pathology'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(
                                                () => const Radilogy_Report());
                                          },
                                          SvgPicture.asset(
                                            'assets/radiology.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Radilogy'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(() => const Prescription());
                                          },
                                          SvgPicture.asset(
                                            'assets/Prescription.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Prescription'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(() =>
                                                const OPD_Medication_Report());
                                          },
                                          SvgPicture.asset(
                                            'assets/Medication.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Medication'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(() => const Bed_History());
                                          },
                                          SvgPicture.asset(
                                            'assets/bed_history.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Bed History'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(
                                                () => const Operation_Report());
                                          },
                                          SvgPicture.asset(
                                            'assets/surgery.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Operation'.tr,
                                        ),
                                        CardDesign(
                                          () {
                                            Get.to(() => const Cardex_Report());
                                          },
                                          SvgPicture.asset(
                                            'assets/cardex.svg',
                                            width: 30,
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                          'Cardex'.tr,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Vitals'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      color: Colors.green,
                                      width: width,
                                      height: height / 20,
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
                                                      'H'.tr,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      'W'.tr,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      'P'.tr,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      'T'.tr,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      'R'.tr,
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                  ),
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
                                                    '',
                                                    // " ${radiologydata![0]['height'] ?? 'N/A'}",
                                                    overflow: TextOverflow
                                                        .ellipsis, // Use ellipsis to cut off the text
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    '',
                                                    // " ${radiologydata![0]['weight'] ?? 'N/A'}",
                                                    overflow: TextOverflow
                                                        .ellipsis, // Use ellipsis to cut off the text
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    '',
                                                    // " ${radiologydata![0]['bp'] ?? 'N/A'}",
                                                    overflow: TextOverflow
                                                        .ellipsis, // Use ellipsis to cut off the text
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    '',
                                                    // " ${radiologydata![0]['pulse'] ?? 'N/A'}",
                                                    overflow: TextOverflow
                                                        .ellipsis, // Use ellipsis to cut off the text
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    '',
                                                    // " ${radiologydata![0]['temperature'] ?? 'N/A'}",
                                                    overflow: TextOverflow
                                                        .ellipsis, // Use ellipsis to cut off the text
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    '',
                                                    // "${radiologydata![0]['respiration'] ?? 'N/A'}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
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
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Symptoms:'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, left: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                '',
                                                // " ${radiologydata![0]['symptoms'] ?? 'N/A'}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Known Allergies:'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, left: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                '',
                                                // " ${radiologydata![0]['known_allergies'] ?? 'N/A'}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Diagnosis:'.tr,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, left: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                '',
                                                // " ${radiologydata![0]['symptoms'] ?? 'N/A'}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'CONSULTANT DOCTOR:',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Add a button to the right side
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: width /
                                              3.4, // Set the desired width
                                          height: height / 25,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _showAlldoctorSelection(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(150, 30),
                                              backgroundColor:
                                                  yellow, // Set the background color
                                            ),
                                            child: const Text('Add doctor',
                                                style:
                                                    TextStyle(fontSize: 12.0)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: height / 7,
                                    child: ListView.builder(
                                      itemCount: Doctorlist!.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Card(
                                          child: Stack(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "${Doctorlist![index]['name'] ?? 'N/A'} ${Doctorlist![index]['surname'] ?? 'N/A'}",
                                                ),
                                                subtitle: Text(
                                                  "${Doctorlist![index]['qualification']?.isNotEmpty ?? false ? Doctorlist![index]['qualification'] : 'N/A'}",
                                                  style: const TextStyle(
                                                      color: Colors.blueAccent),
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: darkYellow,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: yellow,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: ClipOval(
                                                        child: '${Doctorlist![index]['image']}' !=
                                                                    null &&
                                                                '${Doctorlist![index]['image']}' !=
                                                                    ''
                                                            ? Image.network(
                                                                '${Doctorlist![index]['image']}',
                                                                width: 42.0,
                                                                height: 42.0,
                                                                fit:
                                                                    BoxFit.fill,
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
                                                              )
                                                            : Center(
                                                                child: SvgPicture.asset(
                                                                    'assets/Noimagedoctor.svg',
                                                                    width: 42.0,
                                                                    height:
                                                                        42.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    color:
                                                                        darkYellow),
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CornerBanner(
                                                title: int.parse(Doctorlist![
                                                                    index]
                                                                ['main_doctor']
                                                            .toString()) ==
                                                        0
                                                    ? 'Referral'
                                                    : 'Consultant',
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkYellow,
                ),
                child: Center(child: iconWidget),
              ),
              const SizedBox(height: 3),
              Text(
                iconName,
                style: const TextStyle(
                  fontSize: 8,
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

  /////////////////////////////////////////////////////////////////////////// For Getting alll doctor
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
  List<dynamic>? NewListData = [];

  Future fetchDoctorlisttData() async {
    final response = await http.post(
      Uri.parse(ApiLinks.getAllDoctor),
      headers: ApiLinks.MainHeader,
    );
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['doctors'];
        print("______________________________________________$DoneListData");
        isLoading = false;
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
      Center(child: Text("${response.statusCode}"));
    }
  }

  void filterData(String query) {
    setState(() {
      DoneListData = DataMap?['doctors']
          ?.where((doctor) =>
              (doctor['name'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (doctor['surname'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (doctor['id'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  TextEditingController searchController = TextEditingController();
  List<String> selectedDoctorIds = [];
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// For Doctor Add

  Future<void> makePostRequest(Map<String, String> result) async {
    const String apiUrl = ApiLinks.addOpdIpdDoctor;
    Map<String, dynamic> requestBody = {
      "visit_details_id": "${widget.IpdVisitDetailsID}",
      "doctor_id": selectedDoctorIds
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestBody),
        headers: ApiLinks.MainHeader,
      );
      print(
          "----------------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$requestBody");
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print("+________________________________________________$responseData");
        if (responseData["status"] == "1") {
          setState(() {
            // Show success message and navigate to the next screen if needed
            Fluttertoast.showToast(
              msg: '${responseData["message"]}',
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          });
        } else {
          // Handle other cases based on status and message
          setState(() {
            Fluttertoast.showToast(
              msg: '${responseData["message"]}',
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          });
        }
      } else {
        // Handle other status codes (non-200) if needed
        setState(() {
          Fluttertoast.showToast(
            msg: 'Error: ${response.reasonPhrase}',
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        });
      }
    } catch (e) {
      setState(() {
        Fluttertoast.showToast(
          msg: '$e',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }
  }

  /// For Doctor Add

  void _showAlldoctorSelection(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items at the ends
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Doctor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close), // Close icon
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      width: width / 0.8,
                      height: 50,
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (query) {
                          setState(() {
                            filterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search Doctor',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  isLoading
                      ? Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.transparent,
                            child: const LoadingIndicatorWidget(),
                          ),
                        ))
                      : DoneListData!.isEmpty
                          ? Expanded(
                              child: Center(
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Lottie.asset(
                                  'assets/No_Data_Found.json',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                          : Expanded(
                              child: ListView.builder(
                                itemCount: DoneListData!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final doctorId =
                                      DoneListData![index]['id'] as String;
                                  final isDoctorSelected =
                                      selectedDoctorIds.contains(doctorId);
                                  return Card(
                                    color: isDoctorSelected
                                        ? Colors.green
                                        : Colors.white70.withOpacity(0.7),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Toggle the selection state of the doctor
                                        setState(() {
                                          if (isDoctorSelected) {
                                            selectedDoctorIds.remove(doctorId);
                                          } else {
                                            selectedDoctorIds.add(doctorId);
                                          }
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              "${DoneListData![index]['name'] ?? 'N/A'} ${DoneListData![index]['surname'] ?? 'N/A'}",
                                            ),
                                            subtitle: Text(
                                              "${DoneListData![index]['qualification'] != null && DoneListData![index]['qualification'].isNotEmpty ? DoneListData![index]['qualification'] : 'N/A'}",
                                              style: const TextStyle(
                                                  color: Colors.blueAccent),
                                            ),
                                            leading: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: darkYellow,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: yellow,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: ClipOval(
                                                    child: '${DoneListData![index]['image']}' !=
                                                                null &&
                                                            '${DoneListData![index]['image']}' !=
                                                                ''
                                                        ? Image.network(
                                                            '${DoneListData![index]['image']}',
                                                            width: 42.0,
                                                            height: 42.0,
                                                            fit: BoxFit.fill,
                                                            loadingBuilder:
                                                                (context, child,
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
                                                          )
                                                        : Center(
                                                            child: SvgPicture.asset(
                                                                'assets/Noimagedoctor.svg',
                                                                width: 42.0,
                                                                height: 42.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                  if (selectedDoctorIds.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            child: const Text('Add Doctor'),
                            onPressed: () {
                              Map<String, String> result =
                                  Map.from(selectedDoctorIds.asMap()).map(
                                      (key, value) =>
                                          MapEntry(key.toString(), value));

                              makePostRequest(result);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(yellow),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  ///////////////////////////////////////////////////////////////////////////////
}

class CornerBanner extends StatelessWidget {
  final String title;

  const CornerBanner({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        left: -30,
        child: Transform.rotate(
          angle: -1.5708,
          child: Container(
            width: 70,
            color: title == 'Consultant'
                ? Colors.green
                : Colors.red, // Customize the colors as needed
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
