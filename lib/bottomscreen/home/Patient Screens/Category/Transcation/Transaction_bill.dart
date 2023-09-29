// // // ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

// // ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, file_names, avoid_print

// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/bill_model.dart';
// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
// import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:TezHealthCare/stringfile/All_string.dart';

// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shimmer/shimmer.dart';

// class TransactionBill extends StatefulWidget {
//   const TransactionBill({Key? key}) : super(key: key);

//   @override
//   _TransactionBillState createState() => _TransactionBillState();
// }

// class _TransactionBillState extends State<TransactionBill> {
// 

//   // List<BillItem> billItems = [];
//   getAllData() async {
//     await LoadData();

//     await fetchData();
//   }

//   @override
//   void initState() {
//     getAllData();
//     super.initState();
//   }

//    List<Map<String, dynamic>> apiData = [];

//   // @override
//   // void initState() {
//   //   getAllData();

//   //   super.initState();
//   //   fetchData();
//   // }

//   Future<void> fetchData() async {
//     final url = Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllTransaction');
//     final headers = {
// 'Soft-service': 'TezHealthCare',
// 'Auth-key': 'zbuks_ram859553467',
//     };
//     final body = {'patient_id': '10380'};

//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       final decodedResponse = json.decode(response.body);
//       setState(() {
//         apiData = List.generate(
//           decodedResponse.length - 1,
//           (index) => decodedResponse[index.toString()],
//         );
//         print(apiData);
//       }
//       );
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   // Future<void> fetchData() async {
//   //   final response = await http.post(
//   //     Uri.parse(ApiLinks.getAllPayment),
//   //     headers: {
//   //       'Soft-service': 'TezHealthCare',
//   //       'Auth-key': 'zbuks_ram859553467',
//   //       // Adjust content type if needed
//   //     },
//   //     body: jsonEncode({
//   //       "patient_id": patient,
//   //     }),
//   //   );

//   //   if (response.statusCode == 200) {
//   //     final data = jsonDecode(response.body);
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //     if (data['pathology_bill'] != null) {
//   //       for (var item in data['pathology_bill']) {
//   //         billItems.add(PathologyBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     if (data['radiology_bill'] != null) {
//   //       for (var item in data['radiology_bill']) {
//   //         billItems.add(RadiologyBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     if (data['pharmacy_bill'] != null) {
//   //       for (var item in data['pharmacy_bill']) {
//   //         billItems.add(PharmacyBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     if (data['direct_bill'] != null) {
//   //       for (var item in data['direct_bill']) {
//   //         billItems.add(DirectBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     if (data['ambulance_bill'] != null) {
//   //       for (var item in data['ambulance_bill']) {
//   //         billItems.add(AmbulanceBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     if (data['bloodbank'] != null) {
//   //       for (var item in data['bloodbank']) {
//   //         billItems.add(BloodbankBillItem(
//   //           id: item['id'],
//   //           total: double.tryParse(item['total'].toString()) ?? 0.0,
//   //           patientId: item['patient_id'],
//   //           name: 'name',
//   //         ));
//   //       }
//   //     }
//   //     // Add similar code for other bill types if needed
//   //     // Calculate the total sum
//   //     totalSum = billItems.map((item) => item.total).fold(0.0, (a, b) => a + b);

//   //     // Save the totalSum in SharedPreferences with a unique key
//   //     final sp = await SharedPreferences.getInstance();
//   //     final patientSpecificKey ='totalSum_$patient'; // Include the patient ID or username in the key
//   //     sp.setDouble(patientSpecificKey, totalSum);

//   //     setState(() {});
//   //   } else {
//   //     throw Exception('Failed to load data');
//   //   }
//   // }

//   // String getListName(BillItem item) {
//   //   if (item is PathologyBillItem) {
//   //     return 'pathology';
//   //   } else if (item is RadiologyBillItem) {
//   //     return 'radiology';
//   //   } else if (item is PharmacyBillItem) {
//   //     return 'pharmacy';
//   //   } else if (item is DirectBillItem) {
//   //     return 'direct';
//   //   } else if (item is AmbulanceBillItem) {
//   //     return 'ambulance';
//   //   } else if (item is BloodbankBillItem) {
//   //     return 'bloodbank';
//   //   } else {
//   //     return 'Unknown'; // Handle other types if needed
//   //   }
//   // }

// Future<void> _handleRefresh() async {
//   setState(() {
//     isLoading = true; // Set isLoading to true when refreshing
//   });

//   await LoadData();

//   setState(() {
//     isLoading = false; // Set isLoading to false after data is fetched
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//         title: const Text(EnString.transactionBill),
//         centerTitle: true,
//         backgroundColor: darkYellow,
//       ),
//       body: RefreshIndicator(
//         onRefresh: _handleRefresh,
//         child: Column(children: [
//           Container(
//             color: Colors.grey,
//             width: width,
//             height: height / 20,
//             child: const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     EnString.tid,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   Text(
//                     EnString.section,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   Text(
//                     EnString.billno,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   Text(
//                     EnString.amount,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? ListView.builder(
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                       return Shimmer.fromColors(
//                         baseColor: Colors.grey,
//                         highlightColor: Colors.blue.shade100,
//                         child: ListTile(
//                           leading: Container(
//                             width: 60,
//                             height: 60,
//                             color: Colors.white,
//                           ),
//                           title: Container(
//                             width: 150,
//                             height: 20,
//                             color: Colors.white,
//                           ),
//                           subtitle: Container(
//                             width: 100,
//                             height: 10,
//                             color: Colors.white,
//                           ),
//                           trailing: Container(
//                             width: 60,
//                             height: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : apiData.isEmpty
//                     ? Center(
//                         child: Container(
//                           height: 150,
//                           width: 150,
//                           child: Lottie.asset(
//                             'assets/No_Data_Found.json',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       )
//                     : ListView.builder(
//                         itemCount: apiData.length,
//                         itemBuilder: (context, index) {
//                            final data = apiData[index];
//                           // final listName = getListName(item);
//                           return InkWell(
//                             onTap: () {},
//                               // Get.to(
//                               //   () => ViewBillDetiles(
//                               //     // billNo: ${data['bill_no']}
//                               //     // billname: listName,
//                               //   ),

//                               // print(listName);

//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 5.0, left: 5, right: 5),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white70, // Background color
//                                       border: Border.all(
//                                         color: Colors.grey, // Border color
//                                         width: 1.0, // Border width
//                                       ),
//                                       borderRadius: BorderRadius.circular(
//                                           10.0), // Border radius
//                                     ),
//                                     width: width,
//                                     height: height / 15,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(5.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             {index + 1}.toString(),
//                                             style: const TextStyle(),
//                                           ),
//                                           Text(
//                                             // listName,
//                                             "${data['bill_no']}",
//                                             style: const TextStyle(),
//                                           ),
//                                           Text(
//                                             // item.id.toString(),
//                                             "${data['bill_no']}",
//                                             style: const TextStyle(),
//                                           ),
//                                           Text(
//                                             // 'Rs.${item.total}',
//                                             "${data['bill_no']}",
//                                             style: const TextStyle(
//                                               color: Colors.red,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//           ),
//         ]),

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class TransactionBill extends StatefulWidget {
  const TransactionBill({Key? key}) : super(key: key);

  @override
  _TransactionBillState createState() => _TransactionBillState();
}

class _TransactionBillState extends State<TransactionBill> {
  bool isLoading = true;
  String totalAmount = "0.0"; // Initialize with a default value
  Map<String?, dynamic> apiData = {};

  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

 

getData()async{
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

  Future<Map<String, dynamic>> fetchData() async {
    final url =
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllTransaction');
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

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(EnString.transactionBill),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(children: [
          Container(
            color: Colors.grey,
            width: width,
            height: height / 20,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    EnString.tid,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.section,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.billno,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    EnString.amount,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                          if (transaction != null && transaction.containsKey('id')){
                          return InkWell(
                            onTap: () {},
                            // Get.to(
                            //   () => ViewBillDetiles(
                            //     // billNo: ${data['bill_no']}
                            //     // billname: listName,
                            //   ),

                            // print(listName);

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 5, right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white70, // Background color
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Border radius
                                    ),
                                    width: width,
                                    height: height / 15,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${transaction['id']}",
                                            style: const TextStyle(),
                                          ),
                                          Text(
                                            // listName,
                                            "${transaction['section']}",
                                            style: const TextStyle(),
                                          ),
                                          Text(
                                            // item.id.toString(),
                                            "${transaction['bill_no']}",
                                            style: const TextStyle(),
                                          ),
                                          Text(
                                            // 'Rs.${item.total}',
                                            "${transaction['amount']}",
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
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
                        }),
          ),
        ]),
      ),
      bottomSheet: Card(
        child: Container(
          height: height / 15,
          width: width,
          color: darkYellow,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(EnString.total,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text("Rs.$totalAmount",
                      // $totalSum",
                      style: const TextStyle(color: Colors.red, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

