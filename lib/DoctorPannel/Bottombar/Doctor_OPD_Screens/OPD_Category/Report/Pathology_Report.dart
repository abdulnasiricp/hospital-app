// ignore_for_file: file_names, camel_case_types, sized_box_for_whitespace, unused_import, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers, deprecated_member_use
import 'dart:async';
import 'dart:convert';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_Home_Bottom_bar.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/Das_screen.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Home.dart';
import 'package:TezHealthCare/DoctorPannel/Doctor_Profile_Screens/DoctorHome.dart';
import 'package:flutter/services.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Billview.dart';
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
class Pathology_Report extends StatefulWidget {
  final String? case_reference_id;

  const Pathology_Report({Key? key, this.case_reference_id}) : super(key: key);


  @override
  State<Pathology_Report> createState() => _Pathology_ReportState();
}

class _Pathology_ReportState extends State<Pathology_Report> {
  /////////////////////////////////////////////////////////////////////////////////////

  bool isLoading = true;


  //////////////////////////////////////////////////////////////////////////////////////////
  getData() async {
    await fetchData();


    isLoading = false;
  }

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
  TextEditingController searchController = TextEditingController();


  Future<Map<String, dynamic>> fetchData() async {
   

    final body = {
      
    "case_id":'${widget.case_reference_id}'
    // "case_id":'11632'

    };
    try {
      final response = await http.post(
        Uri.parse(ApiLinks.getPathologyReport),
        headers: ApiLinks.MainHeader,
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
  }
////////////////////////////////////////////////////////////////////////////////////////
// filter data

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
              element['id'].toLowerCase().contains(query.toLowerCase()) ||
              element['patient_name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  //////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: darkYellow, // Set the status bar color here
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OpdHome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
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
                  previousScreen: const OpdHome(),
                  isBackButtonVisible: true,
                  backIconColor: whitecolor,
                  centerTitle: 'pathology'.tr,
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
                  padding: const EdgeInsets.only(left: 15.0, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            // width: width/7,
                            child: Center(
                              child: Text(
                                'OPD ID'.tr,
                                overflow: TextOverflow
                                    .ellipsis, // Use ellipsis to cut off the text
                                maxLines: 1,

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
                              'Patient Name'.tr,
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis to cut off the text
                              maxLines: 1,
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
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis to cut off the text
                              maxLines: 1,
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
                              'Date'.tr,
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis to cut off the text
                              maxLines: 1,
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
                              final Pathologybill = filteredData?[index];
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
                                                      "${Pathologybill['id']}"
                                                              .isEmpty
                                                          ? 'N/A'
                                                          : "${Pathologybill['id']}",
                                                      overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
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
                                                              Billview(
                                                            bill_pdf:
                                                                "${Pathologybill['bill_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                             bill_name: 'Tez_Health_Care-Pathology-report-${widget.case_reference_id}.pdf',
                                                          ),
                                                        );
                                                      } else {
                                                        Get.to(
                                                          () =>
                                                            Billview(
                                                            bill_pdf:
                                                                "${Pathologybill['bill_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                            bill_name: 'Tez_Health_Care-Pathology-report-${widget.case_reference_id}.pdf',
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(3.0),
                                                      child: Center(
                                                        child: Text(
                                                          "${Pathologybill['patient_name']}"
                                                                  .isEmpty
                                                              ? 'N/A'
                                                              : "${Pathologybill['patient_name']}",
                                                          overflow: TextOverflow
                                                              .ellipsis, // Use ellipsis to cut off the text
                                                          maxLines: 1,
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
                                                          () => Billview(
                                                            bill_pdf:
                                                                "${Pathologybill['report_pdf']}",
                                                            id: "${Pathologybill['id']}",
                                                            bill_name: 'Tez_Health_Care-Pathology-report-${widget.case_reference_id}.pdf',
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
                                                            overflow: TextOverflow
                                                                .ellipsis, // Use ellipsis to cut off the text
                                                            maxLines: 1,
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
                                                      "${Pathologybill['date']}"
                                                              .isEmpty
                                                          ? 'N/A'
                                                          : "${Pathologybill['date']}",
                                                          overflow: TextOverflow
                                                          .ellipsis, // Use ellipsis to cut off the text
                                                      maxLines: 1,
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
        // 
      ),
    );
  }

  TextFormField searchField() {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
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
