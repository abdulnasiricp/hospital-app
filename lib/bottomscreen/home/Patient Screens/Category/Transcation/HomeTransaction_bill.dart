// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unused_element, unnecessary_null_comparison

import 'dart:async';

import 'package:TezHealthCare/Services/notificationServies.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
import 'package:TezHealthCare/main.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';

class HomeTransactionBill extends StatefulWidget {
  const HomeTransactionBill({Key? key}) : super(key: key);

  @override
  _HomeTransactionBillState createState() => _HomeTransactionBillState();
}

class _HomeTransactionBillState extends State<HomeTransactionBill> {
  bool isLoading = true;
  String totalAmount = "0.0"; // Initialize with a default value

  ////////////////////////////////////////////////////////////////////
  // get shared prefernce data
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

//////////////////////////////////////////////////////////////////////
// call init state
  getData() async {
    await LoadData();
    await fetchData().then((data) {
      setState(() {
        apiData = data;
        // Parse and update the total amount
        if (data.containsKey("total")) {
          totalAmount = "${data["total"]}";
        }
      });
    }).catchError((error) {
      // Handle errors here
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
///////////////////////////////////////////////////////////////////////

     // Schedule a periodic task to check the API every minute
    const duration = Duration(minutes: 1);
    Timer.periodic(duration, (Timer t) {
      checkForNewData();
    });
  }

@override
void dispose() {
  // Cancel timers or dispose of resources here
  super.dispose();
}
  void checkForNewData() async {
    try {
      final newData = await fetchData();

      if (newData.length > previousDataLength) {
        notificationServies.showNotification();
        previousDataLength = newData.length; // Update the previous length
      }
    } catch (error) {
      print('Error while checking for new data: $error');
    }
  }

/////////////////////////////////////////////////////////////////////////////
//  get all transaction bill
int previousDataLength = 0;

  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse(ApiLinks.getAllTransaction);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  ///////////////////////////////////////////////////////////////////////
// call refresh
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }
  /////////////////////////////////////////////////////////////////////////////////////

  TextEditingController searchController = TextEditingController();

  Map<String?, dynamic> apiData = {};
////////////////////////////////////////////////////////////////////////////////////////

// Function to handle notification click and navigate to the screen
Future<void> _navigateToScreen(String payload) async {
  if (payload != null && payload == 'your_payload_here') {
    // Get.toNamed('HomeTransactionBill');
    Navigator.pushNamed(context, '/home_transaction_bill');
  }
}
// Modify your fetchData function to keep track of the previous data length
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // showNotification();

    return Future.value(true);
  });
}

  // // show notification
  // void showNotification() async {
  //   AndroidNotificationDetails androidDetiles =
  //       const AndroidNotificationDetails(
  //     'Notification',
  //     'Tez health Care',
  //     priority: Priority.max,
  //     importance: Importance.max,
  //   );

  //   DarwinNotificationDetails iosDetiles = const DarwinNotificationDetails(
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );
  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidDetiles,
  //     iOS: iosDetiles,
  //   );

  //    // Define the payload when creating the notification
  // const String payload = 'your_payload_here';

  //   await notificationsPlugin.show(
  //       1000, 'New Data', 'New data are added', notificationDetails,payload:  payload);
  // }


NotificationServies notificationServies=NotificationServies();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
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
                isBackButtonVisible: false,
                  centerTitle: 'HometransactionBill'.tr,
                  centerTitleStyle: TextStyle(color: whitecolor, fontSize: 20),
                  searchIconColor: whitecolor,
                  searchFieldDecoration: BoxDecoration(
                      color: whitecolor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  closeIconColor: whitecolor,
                  searchTextEditingController: searchController,
                  horizontalPadding: 5,
                  onChanged: (String value) {
                    setState(() {
                      // Update the search query
                      searchController.text = value;
                    });
                  }),
            ))),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(children: [
            Container(
              color: Colors.grey,
              width: width,
              height: height / 20,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'tid'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'section'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'billno'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'amount'.tr,
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
                  : apiData.isEmpty
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
                          itemCount: apiData.length,
                          itemBuilder: (context, index) {
                            final transaction = apiData[index.toString()];
                            if (transaction != null &&
                                transaction.containsKey('id')) {
                              if (searchController.text.isEmpty ||
                                  "${transaction['id']}".toLowerCase().contains(
                                      searchController.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => ViewBillDetiles(
                                        pdf:
                                            "${transaction['pdf']}", // Use 'id' as the transaction ID
                                        billname: '',
                                        billNo: "${transaction['bill_no']}",
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 5, right: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white70, // Background color
                                            border: Border.all(
                                              color:
                                                  Colors.grey, // Border color
                                              width: 1.0, // Border width
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                2.0), // Border radius
                                          ),
                                          width: width,
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: width / 5,
                                                      child: Text(
                                                        "${transaction['id']}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: width / 6,
                                                      child: Text(
                                                        "${transaction['section']}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: width / 6,
                                                      child: Text(
                                                        "${transaction['bill_no']}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: width / 6,
                                                      child: Text(
                                                        "${transaction['amount']}",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    ],
                                  ),
                                );
                              }
                            }
                            return Container();
                          }),
            ),
          ]),
        ),
        bottomSheet: apiData.isEmpty
            ? null // Set bottomSheet to null when apiData is empty
            : Card(
                child: Container(
                  height: height / 15,
                  width: width,
                  color: darkYellow,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('total'.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Text("Rs.$totalAmount",
                              // $totalSum",
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
