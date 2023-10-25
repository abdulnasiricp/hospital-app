// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use, avoid_unnecessary_containers, unused_element, unnecessary_null_comparison

import 'dart:convert';
import 'package:TezHealthCare/Services/notificationServies.dart';

import 'package:TezHealthCare/Payment_gateway/Select_Payment_Method.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/About_us.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/All_doctors.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Ambulance/Ambulance.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Bedhistory/Bedhistory.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Blood_Bank/Blood_Bank.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Card/Card.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Certificate/Certificate.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Directbill/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/IPD.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Liveconsultation/Liveconsultation.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Physiotherapy/Physiotherapy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Radiology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/SurgeryPrescriptionList.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/USG/usg.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:badges/badges.dart' as badges;

class PatientHomePage extends StatefulWidget {
  final String payload;

  final String? patientId;
  const PatientHomePage({Key? key, this.patientId, required this.payload})
      : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  /////////////////////////////////////////
  //convert rupess to paisa
  late num rupeesAmount = totalDues;
  late num pathalogyAmount = pathodues;

  num rupeesToPaisa(num rupees) {
    return rupees * 100.0;
  }

  late int paisaAmount = rupeesToPaisa(rupeesAmount).round();

  ///////////////////////////////////////////////////////////////
  // show more catogory
  bool _showMore = false;

  void toggleShowMore() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  ///////////////////////////////////////////////////////////////
// init state data and dispose

  getdata() async {
    await LoadData();

    await getDues();
    // rupeesToPaisa();
  }

  @override
  void initState() {
    super.initState();
    _loadNotifications();

    getdata();

    hitApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

///////////////////////////////////////////////////////////////////
  //get Shared preferance data

  String role = '';
  String caseId = '';
  String username = '';
  String record = '';
  String genderrecord = '';
  bool isLoading = true;
  String Patient_id = '';

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      role = sharedPreferences.getString('role') ?? '';
      username = sharedPreferences.getString('usernamerecord') ?? '';
      record = sharedPreferences.getString('record') ?? '';
      genderrecord = sharedPreferences.getString('genderrecord') ?? '';
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
      caseId = sharedPreferences.getString('caseId') ?? '';
    });
  }

///////////////////////////////////////////////////////////////////
// get Due amount
  late num totalDues = 0;
  late num blooddues = 0;
  late num ambulancedues = 0;
  late num pharmadues = 0;
  late num diredues = 0;
  late num radiodues = 0;
  late num pathodues = 0;

  Future<void> getDues() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': Patient_id,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getDues),
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        // Get the total_dues and patho_dues values
        totalDues = data['result']['total_dues'];
        diredues = data['result']['dire_dues'];
        pharmadues = data['result']['pharma_dues'];
        pathodues = data['result']['patho_dues'];
        radiodues = data['result']['radio_dues'];
        blooddues = data['result']['blood_dues'];
        ambulancedues = data['result']['ambulance_dues'];

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }
///////////////////////////////////////////////////////

// get All Doctors
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  Future<void> hitApi() async {
    try {
      final response = await http.post(
        Uri.parse(ApiLinks.getAllDoctor),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
      );

      if (response.statusCode == 200) {
        setState(() {});
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['doctors'];
        isLoading = false; // Set isLoading to false after successful response
      } else if (response.statusCode == 500) {
        print('Internal Server Error: ${response.statusCode}');
        setState(() {
          isLoading = false; // Set isLoading to false in case of an error
        });
      } else {
        print('Error getting doctors: ${response.statusCode}');
        setState(() {
          isLoading = false; // Set isLoading to false in case of an error
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false; // Set isLoading to false in case of an exception
      });
    }
  }

//////////////////////////////////////////////////////////////////////////////////////
// Refresh function

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await hitApi();
    await getDues();
    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

//////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////
  NotificationServies notificationServies = NotificationServies();
   Set<int> readNotifications = Set<int>();
  List<String> notifications = [];
  // int _badgeCount = 0;
  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final storedNotifications = prefs.getStringList('notifications') ?? [];
  final readIndices = prefs.getStringList('readNotifications')?.map(int.parse).toSet() ?? Set<int>();

    
    setState(() {
      notifications = storedNotifications;
      // _badgeCount = notifications.length;
    readNotifications = readIndices;

    });
  }
  Future<void> _saveReadNotifications() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('readNotifications', readNotifications.map((i) => i.toString()).toList());
}

int getUnreadNotificationCount() {
  return notifications.length - readNotifications.length;
}

  ///

  @override
  Widget build(BuildContext context) {
    // int paisaAmount = convertRupeesToPaisa();

    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
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
                  Get.to(() => const Notif(
                        payload: '',
                        
                      ));
                },
                icon: Stack(
                  children: [
                    badges.Badge(
                      badgeContent: Text(
                        getUnreadNotificationCount() > 99 ? '99+' : "${getUnreadNotificationCount()}",
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.orangeAccent,
                      ),
                      position:
                          badges.BadgePosition.custom(start: 15, bottom: 3),
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
        body:
            //  ConnectivityBuilder(
            //     interval: const Duration(seconds: 5),
            //     builder: (ConnectivityStatus status) {
            //       if (status == ConnectivityStatus.online) {
            //         return
            RefreshIndicator(
          onRefresh: _handleRefresh,
          child: isLoading
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.transparent,
                          child: const LoadingIndicatorWidget())),
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
                                    '${'patientId'.tr} $Patient_id',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy_Bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${'hisNo'.tr} $caseId'.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gilroy_Bold',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        ///   if (totalDues > 0)   ////  we will use this
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          // EnString.hospitaldueBalance,
                                          "hospitaldueBalance".tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: darkYellow,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30.0),
                                          child: Text(
                                            // 'Rs. $rupeesAmount',
                                            "Rs. $totalDues",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        notificationServies.showNotification(
                                            2,
                                            'Due bill amount',
                                            'please check your due bill amount',
                                            'DueAmount');

                                        // Store the notification data in shared preferences
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        final notifications =
                                            prefs.getStringList(
                                                    'notifications') ??
                                                [];
                                        notifications.add(
                                            'please check your due bill amount'); // Replace with your notification message
                                        prefs.setStringList(
                                            'notifications', notifications);

                                        Get.off(
                                          () => SelectPaymentMethod(
                                            totalAmountInRs: rupeesAmount,
                                            totalAmountInpaisa: paisaAmount,
                                            ambulance_Amount: ambulancedues,
                                            total_Amount: totalDues,
                                            blood_Amount: blooddues,
                                            direct_amount: diredues,
                                            path_Amount: pathodues,
                                            phrma_Amount: pharmadues,
                                            radio_Amount: radiodues,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Colors.green, // Text color
                                        elevation: 0, // Elevation
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10), // Padding
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Button border radius
                                        ),
                                      ),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Colors.grey,
                                        child: Text(
                                          'payNow'.tr,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GridView.count(
                                crossAxisCount: 5,
                                shrinkWrap:
                                    true, // Set to true to make the GridView scrollable within the Column
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => const TransactionBill());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/transaction.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('transactionBill'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
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
                                              height: 7,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/card.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('card'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const IPD());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/ipd.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(EnString.idp,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const Direct_bill());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/directbill.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('Directbill'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => const Pathalogy());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/pathology.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('pathology'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => const Radiology());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/radiology.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('radiology'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => const Pharmacy());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/pharmacy.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('pharmacy'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const USGScreen());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/usg.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(EnString.usg,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          const SurgeryPrescriptionList());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/surgery.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('surgery'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const Blood_Bank());
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
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                  'assets/blood_bank.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('bloodBank'.tr,
                                                style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Visibility(
                              //   visible: !_showMore,
                              //   child: Container(
                              //     height: 30,
                              //     //color: darkYellow,
                              //     alignment: Alignment
                              //         .centerRight, // Align child to the right
                              //     child: TextButton(
                              //       onPressed: toggleShowMore,
                              //       child: Text(
                              //         'Show More',
                              //         style: TextStyle(color: darkYellow),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Visibility(
                                /// visible: _showMore,
                                child: GridView.count(
                                  crossAxisCount: 5,
                                  shrinkWrap:
                                      true, // Set to true to make the GridView scrollable within the Column
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const Ambulance());
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
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                    'assets/ambulance.svg',
                                                    width: 15,
                                                    height: 15,
                                                    color: darkYellow),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('ambulance'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.offAll(() => const Physiotherapy(
                                              payload: '',
                                            ));
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
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                    'assets/therapy.svg',
                                                    width: 15,
                                                    height: 15,
                                                    color: darkYellow),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('physioTherapy'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const Certificate());
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
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                    'assets/certificate.svg',
                                                    width: 15,
                                                    height: 15,
                                                    color: darkYellow),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('certificates'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const Bedhistory());
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
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                    'assets/bed_history.svg',
                                                    width: 15,
                                                    height: 15,
                                                    color: darkYellow),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('bedHistory'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const Liveconsultation());
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
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                    'assets/live_consult.svg',
                                                    width: 15,
                                                    height: 15,
                                                    color: darkYellow),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text('liveConsultations'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 7,
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('doctors'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    InkWell(
                                      onTap: () {
                                        Get.offAll(
                                            () => const AllDoctorsList());
                                      },
                                      child: Text('viewAll'.tr,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
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
                                                  'assets/tez_spin.json'),
                                            ));
                                          } else {
                                            return InkWell(
                                              onTap: () {
                                                Get.to(() => SelectDateScreen(
                                                      workExp:
                                                          DoneListData![index]
                                                              ['work_exp'],
                                                      doctorId:
                                                          DoneListData![index]
                                                              ['id'],
                                                      doctorImage:
                                                          DoneListData![index]
                                                              ['image'],
                                                      doctorName: DoneListData![
                                                              index]['name'] +
                                                          DoneListData![index]
                                                              ['surname'],
                                                      doctorSpecialization:
                                                          DoneListData![index][
                                                              'specialization'],
                                                    ));
                                              },
                                              child: Container(
                                                width: width,
                                                child: Card(
                                                    color: Colors.white
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
                                                                '${DoneListData![index]['image']}', // Replace with your image URL
                                                                width:
                                                                    200.0, // Set the width (optional)
                                                                height:
                                                                    200.0, // Set the height (optional)
                                                                fit: BoxFit
                                                                    .cover, // Set the BoxFit (optional)
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
                                                                'Dr. ${DoneListData![index]['name']} ${DoneListData![index]['surname']}',
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
                                                                '${DoneListData![index]['specialization']}',
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
                                                                '${DoneListData![index]['email']}',
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
                                              ),
                                            );
                                          }
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
                ),
        )

        // else if (status == ConnectivityStatus.offline) {
        //   return const NoInternetScreen();
        // } else {
        //   // status == ConnectivityStatus.checking;
        //   return Center(
        //     child: SizedBox(
        //       width: 100,
        //       height: 100,
        //       child: Lottie.asset('assets/loading1.json'),
        //     ),
        //   );
        // }
        //       }}
        //      )

        );
  }
}
