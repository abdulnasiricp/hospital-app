// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use, avoid_unnecessary_containers, unused_element, unnecessary_null_comparison, prefer_collection_literals, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:TezHealthCare/Payment_gateway/Select_Payment_Method.dart';
import 'package:TezHealthCare/Services/notificationServies.dart';
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
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Opdhistory/Opd_History.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pathology/Pathology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Pharmacy/Pharmacy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Physiotherapy/Physiotherapy.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Radiology/Radiology.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/SurgeryPrescriptionList.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Transaction_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/USG/usg.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Re-OPD/Re_Opd_with_General/Generalreopd.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Re-OPD/Re_Opd_With_Insurance/Re_Opd_Insurance_visibility.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
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
//=====================================================================
// // internet connection checker
//   late StreamSubscription subscription;
//   bool isDeviceConnected = false;
//   bool isAlertSet = false;

//   getConnectivity() =>
//       subscription = Connectivity().onConnectivityChanged.listen(
//         (ConnectivityResult result) async {
//           isDeviceConnected = await InternetConnectionChecker().hasConnection;
//           if (!isDeviceConnected && isAlertSet == false) {
//             showDialogBox();
//             setState(() => isAlertSet = true);
//           }
//         },
//       );

//   showDialogBox() => showCupertinoDialog<String>(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: Column(
//             children: [
//               SvgPicture.asset(
//                 'assets/nointernet.svg',
//                 width: 30,
//                 height: 30,
//               ),
//               const Text('No Connection'),
//             ],
//           ),
//           content: const Text('Please check your internet connectivity'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () async {
//                 Navigator.pop(context, 'Cancel');
//                 setState(() => isAlertSet = false);
//                 isDeviceConnected =
//                     await InternetConnectionChecker().hasConnection;
//                 if (!isDeviceConnected && isAlertSet == false) {
//                   showDialogBox();
//                   setState(() => isAlertSet = true);
//                 }
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
//=====================================================================

  TextEditingController InsurancetypeController = TextEditingController();
  String selectedInsurancetypename = '';
  String selectedInsurancetypeId = '';
  List<Organization> organizations = [];

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/db_table'),
      headers: ApiLinks.MainHeader,
      body: jsonEncode({
        "table": "organisation",
      }),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data['result'];
      setState(() {
        organizations = List<Organization>.from(
            result.map((org) => Organization.fromJson(org)));
      });
    }
  }

  /////////////////////////////////////////
  //convert rupess to paisa
  late num rupeesAmount = totalDues;
  late int rupeesAmountInt = rupeesAmount.toInt();

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
    // await getConnectivity();
    await LoadData();

    await getDues();
    await notificationListLength();
    await loadNotifications();
  }

  @override
  void initState() {
    super.initState();
    // Create a timer to check for an increase in the data length every 1 minute.
    Timer timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      print('============ timer');
      await getdata();
    });
    getdata();
    hitApi();
    fetchData();
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
    // Set the body
    final body = {
      'patient_id': Patient_id,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getDues),
        headers: ApiLinks.MainHeader,
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
      final response = await http.post(Uri.parse(ApiLinks.getAllDoctor),
          headers: ApiLinks.MainHeader);

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

  //////////////////////////////////////////////////
  List<NotificationItem> notifications = [];
  int unreadCount = 0;

  Future<void> loadNotifications() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final List<String> notificationList =
        sharedPreferences.getStringList('notifications') ?? [];
    int newUnreadCount = 0; // Initialize a temporary variable

    notifications = notificationList.reversed.map((message) {
      final parts = message.split(": ");
      final timestamp = DateTime.parse(parts[0]);
      final isRead = sharedPreferences
              .getBool('isRead_${parts[1]}:${timestamp.toString()}') ??
          false;
      if (!isRead) {
        newUnreadCount++; // Increment temporary unread count for each unread notification
      }
      return NotificationItem(parts[1], timestamp, isRead);
    }).toList();

    setState(() {
      unreadCount = newUnreadCount; // Update the unreadCount variable
    });
  }

  ///

  Future<void> notificationListLength() async {
    // Set the body
    final body = {
      'patient_id': Patient_id,
    };

    // Make the POST request
    final response = await http.post(
      Uri.parse(ApiLinks.getNotificationlistcount),
      headers: ApiLinks.MainHeader,
      body: jsonEncode(body),
    );
// Check if the response was successful
    if (response.statusCode == 200) {
      // Decode the JSON response
      final data = jsonDecode(response.body);

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
      // NepaliDateFormat dateFormat =NepaliDateFormat('yyyy-MM-dd HH:mm:a');

      Map<String, int> notificationLengths = {
        'Pathology Bill': data['pathology']['length'],
        'Pharmacy Bill': data['pharmacy']['length'],
        'Radiology Bill': data['radiology']['length'],
        'Direct Bill': data['direct']['length'],
        'Blood_bank Bill': data['blood_bank']['length'],
        'Ambulance Bill': data['ambulance']['length'],
      };

      // Check if the length of any category has changed
      for (var key in notificationLengths.keys) {
        final int newLength = notificationLengths[key]!;
        final int storedLength = sharedPreferences.getInt(key) ?? 0;

        if (newLength > storedLength) {
          // Notification message with date and time as a unique identifier
          String notificationMessage = '';
          switch (key) {
            case 'Pathology Bill':
              notificationMessage =
                  'New data are added please check your Pathology Bill';
              break;
            case 'Pharmacy Bill':
              notificationMessage =
                  'New data are added please check your Pharmacy Bill';
              break;
            case 'Radiology Bill':
              notificationMessage =
                  'New data are added please check your Radiology Bill';
              break;
            case 'Direct Bill':
              notificationMessage =
                  'New data are added please check your Direct Bill';
              break;
            case 'Blood_bank Bill':
              notificationMessage =
                  'New data are added please check your Blood_bank Bill';
              break;
            case 'Ambulance Bill':
              notificationMessage =
                  'New data are added please check your Ambulance Bill';
              break;
          }

          // Generate a unique identifier using the current date and time
          String uniqueId = formatter.format(DateTime.now());

          // Save the new length in SharedPreferences
          sharedPreferences.setInt(key, newLength);

          // Store the notification message with the unique identifier
          final notifications =
              sharedPreferences.getStringList('notifications') ?? [];
          // Store the notification message with the unique identifier

          notifications.add("$uniqueId: $notificationMessage");
          sharedPreferences.setStringList('notifications', notifications);

          // Show the notification
          NotificationService().showNotification(
            id: 1,
            title: key,
            body: notificationMessage,
            payLoad: 'navigate_to_${key}_bill',
          );
        }
      }

      // Set the state to rebuild the widget
      setState(() {});
    }
  }
//////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
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
                  Get.to(() => const Notif());
                },
                icon: Stack(
                  children: [
                    badges.Badge(
                      badgeContent: Text(
                        '$unreadCount',
                        // notifications.where((item) => !item.isRead).length > 90
                        //     ? '99+'
                        //     : notifications
                        //         .where((item) => !item.isRead)
                        //         .length
                        //         .toString(),
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
                                    '${'patientId'.tr} $Patient_id'.isEmpty
                                        ? "N/A"
                                        : '${'patientId'.tr} $Patient_id',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy_Bold',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${'hisNo'.tr} $caseId'.toString().isEmpty
                                        ? 'N/A'
                                        : '${'hisNo'.tr} $caseId'.toString(),
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
                                        Get.off(
                                          () => SelectPaymentMethod(
                                            totalAmountInRs: rupeesAmountInt,
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
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                shrinkWrap:
                                    true, // Set to true to make the GridView scrollable within the Column
                                children: [
                                  patientHomeCategory(() {
                                    Get.offAll(() => const TransactionBill());
                                  },
                                      SvgPicture.asset(
                                        'assets/transaction.svg',
                                        width: 30,
                                        height: 30,
                                        color: Colors.white,
                                      ),
                                      'Transaction Bill'.tr),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const CardScreen());
                                    },
                                    SvgPicture.asset(
                                      'assets/card.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'card'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const IPD());
                                    },
                                    SvgPicture.asset(
                                      'assets/ipd.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'IPD'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Direct_bill());
                                    },
                                    SvgPicture.asset(
                                      'assets/directbill.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'Directbill'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.offAll(() => const Pathalogy());
                                    },
                                    SvgPicture.asset(
                                      'assets/pathology.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'pathology'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.offAll(() => const Radiology());
                                    },
                                    SvgPicture.asset(
                                      'assets/radiology.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'radiology'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.offAll(() => const Pharmacy());
                                    },
                                    SvgPicture.asset(
                                      'assets/pharmacy.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'pharmacy'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const USGScreen());
                                    },
                                    SvgPicture.asset(
                                      'assets/usg.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'USG'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() =>
                                          const SurgeryPrescriptionList());
                                    },
                                    SvgPicture.asset(
                                      'assets/surgery.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'surgery'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Blood_Bank());
                                    },
                                    SvgPicture.asset(
                                      'assets/blood_bank.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'bloodBank'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Ambulance());
                                    },
                                    SvgPicture.asset(
                                      'assets/ambulance.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'ambulance'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.offAll(() => const Physiotherapy());
                                    },
                                    SvgPicture.asset(
                                      'assets/therapy.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'physioTherapy'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Certificate());
                                    },
                                    SvgPicture.asset(
                                      'assets/certificate.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'certificates'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Bedhistory());
                                    },
                                    SvgPicture.asset(
                                      'assets/bed_history.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'bedHistory'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Liveconsultation());
                                    },
                                    SvgPicture.asset(
                                      'assets/live_consult.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    'liveConsultations'.tr,
                                  ),
                                  patientHomeCategory(
                                    () {
                                      Get.to(() => const Opd_History());
                                    },
                                    SvgPicture.asset(
                                      'assets/opd.svg',
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    "opdHistory".tr,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7,
                                                width: width,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Text(
                                                              'Select Criteria',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: const Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Card(
                                                      child: ListTile(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        tileColor:
                                                            Colors.yellow,
                                                        title: const Text(
                                                          "General Opd",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          "Tap to book an appointment",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        leading: Icon(
                                                          Icons.local_hospital,
                                                          color: darkYellow,
                                                          size: 40,
                                                        ),
                                                        trailing: Icon(
                                                          Icons.arrow_forward,
                                                          color: darkYellow,
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          Get.to(() =>
                                                              const Re_OPD());
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    if (isLoading)
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                const LoadingIndicatorWidget(),
                                                          ),
                                                        ),
                                                      )
                                                    else if (organizations
                                                        .isEmpty)
                                                      const Center(
                                                        child: Text(
                                                          'No data found',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    else
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              organizations
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final organization =
                                                                organizations[
                                                                    index];

                                                            return Card(
                                                              color: Colors
                                                                  .teal, // Set the background color of the card
                                                              elevation:
                                                                  8, // Add a shadow to the card
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: ListTile(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16), // Add padding inside the ListTile
                                                                title: Text(
                                                                  organization
                                                                      .organisationName,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white, // Text color
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold, // Make the text bold
                                                                  ),
                                                                ),
                                                                trailing:
                                                                    const Icon(
                                                                  Icons
                                                                      .arrow_forward, // Add an arrow icon on the right side
                                                                  color: Colors
                                                                      .white, // Icon color
                                                                ),
                                                                onTap: () {
                                                                  selectedInsurancetypename =
                                                                      organization
                                                                          .organisationName;
                                                                  selectedInsurancetypeId =
                                                                      organization
                                                                          .id;
                                                                  InsurancetypeController
                                                                          .text =
                                                                      selectedInsurancetypename;
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  print(
                                                                      'selectedInsurancetypeId: $selectedInsurancetypeId');

                                                                  Get.offAll(() =>
                                                                      Re_Opd_Insurance_visibility(
                                                                        selectedInsurancetypename:
                                                                            selectedInsurancetypename,
                                                                        selectedInsurancetypeId1:
                                                                            selectedInsurancetypeId,
                                                                      ));
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // Background color
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: darkYellow,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    'assets/reopd.svg',
                                                    width: 30,
                                                    height: 30,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "reopd".tr,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors
                                                    .black, // Adjust the text color
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                        // itemCount: DoneListData!.length,
                                        itemCount: 5,
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
                                                      department_id:
                                                          DoneListData![index]
                                                              ['department_id'],
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
                                                              child: '${DoneListData![index]['image']}' !=
                                                                          null &&
                                                                      '${DoneListData![index]['image']}' !=
                                                                          ''
                                                                  ? Image
                                                                      .network(
                                                                      '${DoneListData![index]['image']}',
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .fill,
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
                                                                    )
                                                                  : Center(
                                                                      child: SvgPicture.asset(
                                                                          'assets/Noimagedoctor.svg',
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              200.0,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          color:
                                                                              darkYellow),
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
                                                                'Dr. ${DoneListData?[index]['name']} ${DoneListData![index]['surname'] ?? ""}'
                                                                        .isEmpty
                                                                    ? "N/A"
                                                                    : 'Dr. ${DoneListData?[index]['name']} ${DoneListData![index]['surname']}',
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
                                                                '${DoneListData?[index]['specialization'] ?? ""}'
                                                                        .isEmpty
                                                                    ? "N/A"
                                                                    : ' ${DoneListData?[index]['specialization']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${DoneListData?[index]['email'] ?? ""}'
                                                                        .isEmpty
                                                                    ? "N/A"
                                                                    : ' ${DoneListData?[index]['email']}',
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
                                                                    '${DoneListData?[index]['qualification'] ?? ""}'
                                                                            .isEmpty
                                                                        ? "N/A"
                                                                        : ' ${DoneListData?[index]['qualification']}',
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
                                                                    '${DoneListData?[index]['work_exp'] ?? ""}'
                                                                            .isEmpty
                                                                        ? "N/A"
                                                                        : ' ${DoneListData?[index]['work_exp']}',
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
        ));
  }

  Padding patientHomeCategory(ontap, iconWidget, iconName) {
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
