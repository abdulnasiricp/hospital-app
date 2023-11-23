// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, avoid_print, deprecated_member_use, sized_box_for_whitespace


import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/api_call.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class Doctor_Home_Page extends StatefulWidget {
  const Doctor_Home_Page({Key? key}) : super(key: key);
  @override
  State<Doctor_Home_Page> createState() => _Doctor_Home_PageState();
}

class _Doctor_Home_PageState extends State<Doctor_Home_Page> {
  Map<String, double> dataMap = {
    "Total patient": 1233,
    "OPD Patient": 133,
    "IPD Patient": 223,
    "Emergency": 133,
    "Pathology": 120,
    "Surgery Performed": 13,
    "Radiology": 120,
    "Live Consultation": 10,
  };

  String welcomeMessage = 'Welcome to Doctor Home Page';
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
  String Surgeryperformeddata = '';
  Future<void> fetchSurgeryData() async {
    Surgeryperformeddata = await Dasboarddataapicall.fetchData("surgery");
    setState(() {});
    print(
        "====================================================$Surgeryperformeddata");
  }

  String Opdpatientdata = '';
  Future<void> fetchOpdpatientdata() async {
    Opdpatientdata = await Dasboarddataapicall.fetchData("visit_details");
    setState(() {});
  }

  String Ipdpatientdata = '';
  Future<void> fetchIpdpatientdata() async {
    Ipdpatientdata = await Dasboarddataapicall.fetchData("ipd_details");
    setState(() {});
  }

  String Pathologyperformeddata = '';
  Future<void> fetchPathologyperformeddata() async {
    Pathologyperformeddata =
        await Dasboarddataapicall.fetchData("pathology_billing");
    setState(() {});
  }

  String Radilogyperformeddata = '';
  Future<void> fetchRadilogyperformeddata() async {
    Radilogyperformeddata =
        await Dasboarddataapicall.fetchData("radiology_billing");
    setState(() {});
  }

  String Liveconsultantperformeddata = '';
  Future<void> fetchLiveconsultantperformeddata() async {
    Liveconsultantperformeddata =
        await Dasboarddataapicall.fetchData("conferences");
    setState(() {});
  }

  String emergrncyddata = '';
  Future<void> fetchemergrncyddata() async {
    emergrncyddata = await Dasboarddataapicall.fetchData("emergency");
    setState(() {});
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

  String calculateTotalPatients() {
    try {
      int ipdCount = int.parse(Ipdpatientdata);
      int opdCount = int.parse(Opdpatientdata);
      int emgCount = int.parse(emergrncyddata);

      // Perform the addition and return the result
      return (ipdCount + opdCount + emgCount).toString();
    } catch (e) {
      // Handle parsing errors, return a default value, or show an error message
      print('Error calculating total patients: $e');
      return 'N/A';
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
                      Column(
                        children: [
                          Center(
                            child: PieChart(
                              dataMap: dataMap,
                              chartRadius: width / 1.7,
                              chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                            ),
                          )
                        ],
                      )
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
      child: Container(
        padding: const EdgeInsets.all(16), // Add padding for better spacing
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white, // Set a background color
        ),
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                itemwidget,
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
    );
  }
}
