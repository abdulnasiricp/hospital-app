// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransactionBill extends StatefulWidget {
  const TransactionBill({Key? key}) : super(key: key);

  @override
  _TransactionBillState createState() => _TransactionBillState();
}

class _TransactionBillState extends State<TransactionBill> {
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
  }

/////////////////////////////////////////////////////////////////////////////
//  get all transaction bill
  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse(ApiLinks.getAllTransaction);
   
    final body = {
      "patient_id": patient,
    };

    final response = await http.post(
      url,
      headers: ApiLinks.MainHeader,
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

////////////////////////////////////////////////////////////////////////////////////////
// filter data
  Map<String?, dynamic> apiData = {};
////////////////////////////////////////////////////////////////////////////////////////

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
                  previousScreen: const Bottomhome(),
                  isBackButtonVisible: true,
                  backIconColor: whitecolor,
                  centerTitle: 'transactionBill'.tr,
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
              width: double.infinity,
              height: 40,
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
                                            "${transaction['pdf']}".isEmpty?"N/A":"${transaction['pdf']}", // Use 'id' as the transaction ID
                                        billname: '',
                                        billNo: "${transaction['bill_no']}".isEmpty?"N/A":"${transaction['bill_no']}",
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: Colors.white70.withOpacity(0.7),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 5,
                                                    child: Text(
                                                      "${transaction['id']}".isEmpty?"N/A":"${transaction['id']}",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 6,
                                                  child: Text(
                                                    "${transaction['section']}".isEmpty?"N/A":"${transaction['section']}",
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
                                                  width: width / 4,
                                                  child: Text(
                                                    "${transaction['bill_no']}".isEmpty?"N/A":"${transaction['bill_no']}",
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
                                                    "${transaction['amount']}".isEmpty?"N/A":"${transaction['amount']}",
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
                                      ],
                                    ),
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
                  height: 50,
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
                          child: Text("Rs.$totalAmount".isEmpty?"N/A":"Rs.$totalAmount",
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
