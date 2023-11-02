// // // ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names

// // import 'dart:convert';

// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/ViewReport.dart';
// // import 'package:TezHealthCare/utils/Api_Constant.dart';
// // import 'package:TezHealthCare/utils/colors.dart';
// // import 'package:TezHealthCare/utils/mediaqury.dart';
// // import 'package:TezHealthCare/widgets/loading_widget.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// // import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// // import 'package:get/get.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
// // import 'package:http/http.dart' as http;

// // class Certificate extends StatefulWidget {
// //   const Certificate({Key? key}) : super(key: key);

// //   @override
// //   State<Certificate> createState() => _CertificateState();
// // }

// // class _CertificateState extends State<Certificate> {
// //   double? _progress;
// //   String PatientId = '';
// //   String? _downloadedFilePath; // Store the downloaded file path

// //   LoadData() async {
// //     SharedPreferences sp = await SharedPreferences.getInstance();
// //     PatientId = sp.getString('patientidrecord') ?? '';
// //     print(PatientId);
// //     setState(() {});
// //   }

// //   loadSP() async {
// //     await LoadData();
// //   await fetchBirthAndDeathDetails();

// //   }

// //   @override
// //   void initState() {
// //     loadSP();
// //     super.initState();
// //   }

// //   Map<String, dynamic> birthDetails = {};
// //   Map<String, dynamic> deathDetails = {};

// // Future<void> fetchBirthAndDeathDetails() async {
// //   const String apiUrl = "https://uat.tez.hospital/xzy/webservice/generateCertificate";
// //   final Map<String, String> headers = {
// //     'Soft-service': 'TezHealthCare',
// //     'Auth-key': 'zbuks_ram859553467',
// //   };
// //   final Map<String, String> body = {
// //     // "patient_id": PatientId
// //     "patient_id": '10814'
// //   };

// //   final response = await http.post(
// //     Uri.parse(apiUrl),
// //     headers: headers,
// //     body: jsonEncode(body),
// //   );

// //   if (response.statusCode == 200) {
// //     final data = json.decode(response.body);

// //      birthDetails = data["birth"];
// //      deathDetails = data["death"];

// //     print("Birth Details: $birthDetails");
// //     print("Death Details: $deathDetails");

// //     // You can now access specific fields within birthDetails and deathDetails.
// //   } else {
// //     print("Failed to fetch data. Status code: ${response.statusCode}");
// //   }
// // }

// //   bool isRefreshing = false; // Track refresh state

// //     Future<void> _handleRefresh() async {
// //     setState(() {
// //       isRefreshing = true; // Set isRefreshing to true when refreshing
// //     });

// //     await fetchBirthAndDeathDetails();

// //     setState(() {
// //       isRefreshing = false; // Set isRefreshing to false after data is fetched
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.lightBlue[50],
// //       appBar: AppBar(
// //         title: Text('Certificate'.tr),
// //         centerTitle: true,
// //         backgroundColor: darkYellow,
// //       ),
// //       body: RefreshIndicator(
// //         onRefresh: _handleRefresh,
// //         child: FutureBuilder(
// //           future: fetchBirthAndDeathDetails(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting ||
// //                 isRefreshing) {
// //               return Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: Container(
// //                     height: 50,
// //                     width: 50,
// //                     color: Colors.transparent,
// //                     child: const LoadingIndicatorWidget(),
// //                   ),
// //                 ),
// //               );
// //             } else if (snapshot.hasError) {
// //               return Center(
// //                 child: Text('Error: ${snapshot.error}'),
// //               );
// //             } else if (!snapshot.hasData ) {
// //               return Center(
// //                 child: Container(
// //                   height: 150,
// //                   width: 150,
// //                   child: Lottie.asset(
// //                     'assets/No_Data_Found.json',
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               );
// //             } else {
// //               return ListView.builder(
// //                 itemCount: birthDetails.length,
// //                 itemBuilder: (context, index) {

// //                   return Card(
// //                     margin: const EdgeInsets.all(8.0),
// //                     child: Stack(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             ListTile(
// //                               title: Text(
// //                                   'Prescription ID: ${deathDetails['guardian_name']}'),
// //                               subtitle: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text('Date: ${deathDetails['date']}'),
// //                                   Text('Test Name: ${deathDetails['charge_name']}'),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         Positioned(
// //                           bottom: 0,
// //                           right: 0,
// //                           child: ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                               primary:
// //                                   yellow, // Change the background color here
// //                             ),
// //                             onPressed: () {
// //                               Get.to(
// //                                 () => Surgeryreport(
// //                                   prescripton_id: "${deathDetails['prescripton_id']}",
// //                                   prescription_report:
// //                                       "${deathDetails['prescription_report']}",
// //                                 ),
// //                               );
// //                             },
// //                             child: const Text('View Report'),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use, unused_element

// import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/ViewReport.dart';
// import 'package:TezHealthCare/utils/Api_Constant.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/widgets/loading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:get/route_manager.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Certificate extends StatefulWidget {
//   const Certificate({Key? key}) : super(key: key);

//   @override
//   State<Certificate> createState() => _CertificateState();
// }

// class _CertificateState extends State<Certificate> {
//   ///////////////////////////////////////////////////////////////

//   late String patientID = '';

//   LoadData() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();

//     patientID = sp.getString('patientidrecord') ?? '';

//     print(patientID);
//     print(
//         "======================================================================================$patientID");

//     setState(() {});
//   }
// ///////////////////////////////////////////////////////////////////

//   getData() async {
//     await LoadData();
//     fetchData();
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

// ///////////////////////////////////////////////////////////////////

//   // Future<Map<String, dynamic>?>? _futureData;
//   bool isRefreshing = false; // Track refresh state
//   Map<String, dynamic> birthDetails = {};
//   Map<String, dynamic> deathDetails = {};
//   Future<Map<String, dynamic>?> fetchData() async {
//     final Map<String, String> headers = {
//       'Soft-service': 'TezHealthCare',
//       'Auth-key': 'zbuks_ram859553467',
//     };

//     final Map<String, dynamic> requestBody = {
//       "patient_id": '10814',
//     };

//     final response = await http.post(
//       Uri.parse('https://uat.tez.hospital/xzy/webservice/generateCertificate'),
//       headers: headers,
//       body: json.encode(requestBody),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       birthDetails = data["birth"];
//       deathDetails = data["death"];

//       print("Birth Details: $birthDetails");
//       print("Death Details: $deathDetails");

//       // You can now access specific fields within birthDetails and deathDetails.
//     } else {
//       print("Failed to fetch data. Status code: ${response.statusCode}");
//     }
//     return null;
//   }

//   Future<void> _handleRefresh() async {
//     setState(() {
//       isRefreshing = true; // Set isRefreshing to true when refreshing
//     });

//     await fetchData();

//     setState(() {
//       isRefreshing = false; // Set isRefreshing to false after data is fetched
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.lightBlue[50],
//         appBar: AppBar(
//           title: Text('Certificate'.tr),
//           centerTitle: true,
//           backgroundColor: darkYellow,
//         ),
//         body: isRefreshing
//             ? Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     color: Colors.transparent,
//                     child: const LoadingIndicatorWidget(),
//                   ),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: deathDetails.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.all(8.0),
//                     child: Stack(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ListTile(
//                               title: Text(
//                                   'Prescription ID: ${deathDetails['id']}'),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Date: ${deathDetails['date']}'),
//                                   Text(
//                                       'Test Name: ${deathDetails['charge_name']}'),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary:
//                                   yellow, // Change the background color here
//                             ),
//                             onPressed: () {
//                               Get.to(
//                                 () => Surgeryreport(
//                                   prescripton_id: "${deathDetails['id']}",
//                                   prescription_report:
//                                       "${deathDetails['death_certificate']}}",
//                                 ),
//                               );
//                             },
//                             child: const Text('View Report'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ));
//   }
// }

// ignore_for_file: avoid_print, sized_box_for_whitespace, file_names

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/ViewReport.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  Future<Map<String, dynamic>>? _data;

  @override
  void initState() {
    super.initState();
    _data = _makePostRequest();
  }

  Future<Map<String, dynamic>> _makePostRequest() async {
    const url = 'https://uat.tez.hospital/xzy/webservice/generateCertificate';

    // Define the request headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Define the request body
    final body = {
      "patient_id": "10814",
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['death'];
        return data;
      } else {
        throw Exception('Failed to make the request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Certificate'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: const LoadingIndicatorWidget(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final responseJson = snapshot.data!;
            return Container(
              height: 100,
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('Prescription ID: ${responseJson['id']}'.isEmpty?"N/A":'Prescription ID: ${responseJson['id']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date: ${responseJson['created_at']}'),
                              Text('Patient Name: ${responseJson['patient_name']}'.isEmpty?"N/A":'Patient Name: ${responseJson['patient_name']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 5,
                      top: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                        ),
                        onPressed: () {
                          Get.to(
                            () => Surgeryreport(
                              prescripton_id: "${responseJson['id']}",
                              prescription_report: "${responseJson['death_certificate']}",
                            ),
                          );
                        },
                        child: const Text('View Report'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container(); // Return an empty container by default
        },
      ),
    );
  }
}
