// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, avoid_print, deprecated_member_use, sized_box_for_whitespace

import 'dart:async';

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/api_call.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class Doctor_Home_Page extends StatefulWidget {
  const Doctor_Home_Page({Key? key}) : super(key: key);
  @override
  State<Doctor_Home_Page> createState() => _Doctor_Home_PageState();
}

class _Doctor_Home_PageState extends State<Doctor_Home_Page> {
  // internet connection checker
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Column(
            children: [
              SvgPicture.asset(
                'assets/nointernet.svg',
                width: 30,
                height: 30,
              ),
              const Text('No Connection'),
            ],
          ),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  late Map<String, double> dataMap = {
    "Total Patients": 0,
    "OPD Patient": 0,
    "IPD Patient": 0,
    "Emergency": 0,
    "Pathology": 0,
    "Surgery Performed": 0,
    "Radiology": 0,
    "Live Consultation": 0,
  };

  // String welcomeMessage = 'Welcome to Doctor Home Page';
  String doctorRole = '';
  String employeeId = '';
  String id = '';
  String username = '';
  String mobile = '';
  String email = '';
  String gender = '';
  String localAddress = '';
  String permanentAddress = '';
  String dateFormat = '';
  String timeFormat = '';
  String currencySymbol = '';
  String timezone = '';
  String image = '';
  String token = '';
  Future<void> loadDoctorData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      doctorRole = sp.getString('Doctor') ?? '';
      employeeId = sp.getString('employee_id') ?? '';
      id = sp.getString('id') ?? '';
      username = sp.getString('username') ?? '';
      mobile = sp.getString('mobile') ?? '';
      email = sp.getString('email') ?? '';
      gender = sp.getString('gender') ?? '';
      localAddress = sp.getString('local_address') ?? '';
      permanentAddress = sp.getString('permanent_address') ?? '';
      dateFormat = sp.getString('date_format') ?? '';
      timeFormat = sp.getString('time_format') ?? '';
      currencySymbol = sp.getString('currency_symbol') ?? '';
      timezone = sp.getString('timezone') ?? '';
      image = sp.getString('image') ?? '';
      token = sp.getString('token') ?? '';
    });
  }

  bool isLoggingOut = false; // Flag to check if logout process is in progress
  late String patientID = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patientID = sp.getString('patientidrecord') ?? '';
    print(patientID);
    setState(() {});
  }

  bool isLoading = true;
  getData() async {
    await LoadData();
    await loadDoctorData();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    getConnectivity();
    super.initState();
    fetchSurgeryData();
    fetchOpdpatientdata();
    fetchIpdpatientdata();
    fetchPathologyperformeddata();
    fetchRadilogyperformeddata();
    fetchLiveconsultantperformeddata();
    fetchemergrncyddata();
  }

/////////////////////////////////// for dasboard data
  double Surgeryperformeddata = 0;
  Future<void> fetchSurgeryData() async {
    Surgeryperformeddata = await Dasboarddataapicall.fetchData("surgery");
    updateDataMap();
    setState(() {});
    print(
        "====================================================$Surgeryperformeddata");
  }

  double Opdpatientdata = 0;
  Future<void> fetchOpdpatientdata() async {
    Opdpatientdata = await Dasboarddataapicall.fetchData("visit_details");
    updateDataMap();

    setState(() {});
  }

  double Ipdpatientdata = 0;
  Future<void> fetchIpdpatientdata() async {
    Ipdpatientdata = await Dasboarddataapicall.fetchData("ipd_details");
    updateDataMap();

    setState(() {});
  }

  double Pathologyperformeddata = 0;
  Future<void> fetchPathologyperformeddata() async {
    Pathologyperformeddata =
        await Dasboarddataapicall.fetchData("pathology_billing");
    updateDataMap();

    setState(() {});
  }

  double Radilogyperformeddata = 0;
  Future<void> fetchRadilogyperformeddata() async {
    Radilogyperformeddata =
        await Dasboarddataapicall.fetchData("radiology_billing");
    updateDataMap();

    setState(() {});
  }

  double Liveconsultantperformeddata = 0;
  Future<void> fetchLiveconsultantperformeddata() async {
    Liveconsultantperformeddata =
        await Dasboarddataapicall.fetchData("conferences");
    updateDataMap();

    setState(() {});
  }

  double emergrncyddata = 0;
  Future<void> fetchemergrncyddata() async {
    emergrncyddata = await Dasboarddataapicall.fetchData("emergency");
    updateDataMap();

    setState(() {});
  }

  void updateDataMap() {
    setState(() {
      dataMap = {
        "Total Patients": calculateTotalPatients(),
        "OPD Patient": Opdpatientdata,
        "IPD Patient": Ipdpatientdata,
        "Emergency": emergrncyddata,
        "Pathology": Pathologyperformeddata,
        "Surgery Performed": Surgeryperformeddata,
        "Radiology": Radilogyperformeddata,
        "Live Consultation": Liveconsultantperformeddata,
      };
    });
  }

////////////////////////////////////////////
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });
    await fetchSurgeryData();
    await fetchOpdpatientdata();
    await fetchIpdpatientdata();
    await fetchPathologyperformeddata();
    await fetchRadilogyperformeddata();
    await fetchLiveconsultantperformeddata();
    await fetchemergrncyddata();
    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  double calculateTotalPatients() {
    try {
      double ipdCount = double.parse("$Ipdpatientdata");
      double opdCount = double.parse("$Opdpatientdata");
      double emgCount = double.parse("$emergrncyddata");

      // Perform the addition and return the result
      return (ipdCount + opdCount + emgCount).toDouble();
    } catch (e) {
      // Handle parsing errors, return a default value, or show an error message
      print('Error calculating total patients: $e');
      return 0;
    }
  }

  //////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
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
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: Colors.blue,
              onPressed: () {
                // Get.to(() => const Notif());
              },
              icon: Stack(
                children: [
                  badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.orangeAccent,
                    ),
                    position: badges.BadgePosition.custom(start: 15, bottom: 3),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: darkYellow,
        elevation: 0,
      ),
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
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  '${'welcome'.tr} $username',
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
                                  '${'Doctor ID'.tr} $id'.isEmpty
                                      ? "N/A"
                                      : '${'DoctorID'.tr} $id',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Gilroy_Bold',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              shrinkWrap:
                                  true, // Set to true to make the GridView scrollable within the Column
                              children: [
                                homeCard(
                                    SvgPicture.asset('assets/people.svg',
                                        width: 30,
                                        height: 30,
                                        color: Colors.white),
                                    'Total Patients Served',
                                    calculateTotalPatients()),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/opd.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'OPD Patients',
                                    Opdpatientdata),
                                homeCard(
                                    SvgPicture.asset('assets/ipd.svg',
                                        width: 30,
                                        height: 30,
                                        color: Colors.white),
                                    'IPD Patients',
                                    Ipdpatientdata),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/em.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'Emergency Patients',
                                    emergrncyddata),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/surgery.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'Surgery Performed',
                                    Surgeryperformeddata),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/pathology.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'Pathology',
                                    Pathologyperformeddata),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/radiology.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                      fit: BoxFit.fill,
                                    ),
                                    'Radiology',
                                    Radilogyperformeddata),
                                homeCard(
                                    SvgPicture.asset(
                                      'assets/live_consult.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                      fit: BoxFit.fill,
                                    ),
                                    'Live Consultation',
                                    Liveconsultantperformeddata),
                              ]),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 51, 204, 255),
                                width: 1,
                              ),
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: PieChart(
                                dataMap: dataMap,
                                chartRadius: width / 1.7,
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            top: 12,
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(),
                              color: Colors.white,

                              ),
                              padding: EdgeInsets.only(
                                  bottom: 5, left: 10, right: 10, top: 5),
                              child: Text(
                                'Pie Chart',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
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
    );
  }

  Card homeCard(Iconwidget, Namewidget, itemwidget) {
    return Card(
      elevation: 5, // Adjust the elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero, // Remove default padding
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkYellow,
            ),
            child: Align(
              alignment: Alignment.center, // Center the Iconwidget
              child: Iconwidget,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Namewidget,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10, // Increase the font size
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemwidget.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 16, // Increase the font size
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
