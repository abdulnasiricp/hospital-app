// ignore_for_file: file_names, camel_case_types, duplicate_ignore
// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace, file_names

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Das_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
class OPD_Medication_Report extends StatefulWidget {
  const OPD_Medication_Report({Key? key}) : super(key: key);

  // const OPD_Medication({super.key});

  @override
  State<OPD_Medication_Report> createState() => _OPD_Medication_ReportState();
}

class _OPD_Medication_ReportState extends State<OPD_Medication_Report> {
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
//==============================================================================


  getData() async {
    await LoadData();
    await getpatientDetails();
    await fetchData();
    
    calculateTotalAmount();

    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
//==============================================================================

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
//==============================================================================

  late String ipdData = '';

  Future<void> getpatientDetails() async {
    // Set the body
    final body = {
      'patient_id': 10909,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getpatientDetails),
        headers: ApiLinks.MainHeader,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);
        ipdData = data['result']['ipdid'];
        print('=============$ipdData');

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }
//==============================================================================

/////get medication data
  Map<String, dynamic>? DataMap;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];

  Future<Map<String, dynamic>> fetchData() async {
    Uri.parse(ApiLinks.getIPDMedication);

    final body = {"ipd_id": ipdData};

    final response = await http.post(
      Uri.parse(ApiLinks.getIPDMedication),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      DataMap = json.decode(response.body);
      setState(() {
        data = DataMap!['medication'];
        filteredData = data;
        isLoading = false; // Set isLoading to false when data is loaded
      });
    } else {
      throw Exception('Failed to load data');
    }
    return {};
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

//==============================================================================

  TextEditingController searchController = TextEditingController();


// filter data

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) => element['medicine_name']
              .toLowerCase()
              .contains(query.toLowerCase()))
          // element['status'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: SafeArea(
              child: Container(
            decoration: BoxDecoration(color: darkYellow, boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: Offset(0, 5)),
            ]),
            alignment: Alignment.center,
            child: AnimationSearchBar(
                previousScreen: const Das_screen(),
                isBackButtonVisible: true,
                backIconColor: whitecolor,
                centerTitle: 'medication'.tr,
                centerTitleStyle: TextStyle(color: whitecolor, fontSize: 20),
                searchIconColor: whitecolor,
                searchFieldDecoration: BoxDecoration(
                    color: whitecolor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                closeIconColor: whitecolor,
                onChanged: (query) => filterData(query),
                searchTextEditingController: searchController,
                horizontalPadding: 5),
          ))),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: width,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'mid'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'medicine'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'dose'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'frequency'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'No. D'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
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
                          itemCount: filteredData?.length,
                          itemBuilder: (context, index) {
                            final MedicationData = filteredData?[index];
                            if (MedicationData.containsKey('id')) {
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
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: width / 15,
                                                child: Text(
                                                  (index + 1).toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                width: width / 5,
                                                child: Text(
                                                  "${MedicationData['medicine_name']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                child: Text(
                                                  "${MedicationData['medicine_dosage_id']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                width: width / 6,
                                                child: Text(
                                                  "${MedicationData['dose_interval_id']}",
                                                  // overflow: ,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                width: width / 11,
                                                child: Text(
                                                  "${MedicationData['dose_duration_id']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
    );
  }
}
