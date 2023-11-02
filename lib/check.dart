// // // // ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names

// // // import 'dart:convert';

// // // import 'package:TezHealthCare/utils/Api_Constant.dart';
// // // import 'package:TezHealthCare/utils/colors.dart';
// // // import 'package:TezHealthCare/utils/mediaqury.dart';
// // // import 'package:TezHealthCare/widgets/loading_widget.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// // // import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// // // import 'package:get/get.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'package:open_file/open_file.dart';
// // // import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
// // // import 'package:http/http.dart' as http;


// // // class Certificate extends StatefulWidget {
// // //   const Certificate({Key? key}) : super(key: key);

// // //   @override
// // //   State<Certificate> createState() => _CertificateState();
// // // }

// // // class _CertificateState extends State<Certificate> {
// // //   double? _progress;
// // //   String PatientId = '';
// // //   String? _downloadedFilePath; // Store the downloaded file path


// // //   LoadData() async {
// // //     SharedPreferences sp = await SharedPreferences.getInstance();
// // //     PatientId = sp.getString('patientidrecord') ?? '';
// // //     print(PatientId);
// // //     setState(() {});
// // //   }

// // //   loadSP() async {
// // //     await LoadData();
// // //   await fetchBirthAndDeathDetails();

// // //   }

// // //   @override
// // //   void initState() {
// // //     loadSP();
// // //     super.initState();
// // //   }

// //   // Map<String, dynamic> birthDetails = {};
// //   // Map<String, dynamic> deathDetails = {};
  

// // // Future<void> fetchBirthAndDeathDetails() async {
// // //   const String apiUrl = "https://uat.tez.hospital/xzy/webservice/generateCertificate";
// // //   final Map<String, String> headers = {
// // //     'Soft-service': 'TezHealthCare',
// // //     'Auth-key': 'zbuks_ram859553467',
// // //   };
// // //   final Map<String, String> body = {
// // //     // "patient_id": PatientId
// // //     "patient_id": '10814'
// // //   };

// // //   final response = await http.post(
// // //     Uri.parse(apiUrl),
// // //     headers: headers,
// // //     body: jsonEncode(body),
// // //   );

// // //   if (response.statusCode == 200) {
// // //     final data = json.decode(response.body);
  
// // //      birthDetails = data["birth"];
// // //      deathDetails = data["death"];

// // //     print("Birth Details: $birthDetails");
// // //     print("Death Details: $deathDetails");

// // //     // You can now access specific fields within birthDetails and deathDetails.
// // //   } else {
// // //     print("Failed to fetch data. Status code: ${response.statusCode}");
// // //   }
// // // }




// // // ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use, unused_element

// // import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/ViewReport.dart';
// // import 'package:TezHealthCare/utils/colors.dart';
// // import 'package:TezHealthCare/widgets/loading_widget.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get_utils/src/extensions/internacionalization.dart';
// // import 'package:get/route_manager.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // import 'package:shared_preferences/shared_preferences.dart';

// // class Certificate extends StatefulWidget {
// //   const Certificate({Key? key}) : super(key: key);

// //   @override
// //   State<Certificate> createState() =>
// //       _CertificateState();
// // }

// // class _CertificateState extends State<Certificate> {
// //   ///////////////////////////////////////////////////////////////

// //   late String patientID = '';
  

// //   LoadData() async {
// //     SharedPreferences sp = await SharedPreferences.getInstance();

// //     patientID = sp.getString('patientidrecord') ?? '';
   

// //     print(patientID);
// //     print(
// //         "======================================================================================$patientID");

// //     setState(() {});
// //   }
// // ///////////////////////////////////////////////////////////////////

// //   getData() async {
// //     await LoadData();
// //     fetchData();
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }

// // ///////////////////////////////////////////////////////////////////


// //   // Future<Map<String, dynamic>?>? _futureData;
// //   bool isRefreshing = false; // Track refresh state
// //   Map<String, dynamic> birthDetails = {};
// //   Map<String, dynamic> deathDetails = {};
// //   Future<Map<String, dynamic>?> fetchData() async {
    
// //       final Map<String, String> headers = {
// //         'Soft-service': 'TezHealthCare',
// //         'Auth-key': 'zbuks_ram859553467',
// //       };

// //       final Map<String, dynamic> requestBody = {
// //         "patient_id": '10814',
// //       };

// //       final response = await http.post(
// //         Uri.parse(
// //             'https://uat.tez.hospital/xzy/webservice/generateCertificate'),
// //         headers: headers,
// //         body: json.encode(requestBody),
// //       );

// //       if (response.statusCode == 200) {
// //     final data = json.decode(response.body);
  
// //      birthDetails = data["birth"];
// //      deathDetails = data["death"];

// //     print("Birth Details: $birthDetails");
// //     print("Death Details: $deathDetails");

// //     // You can now access specific fields within birthDetails and deathDetails.
// //   } else {
// //     print("Failed to fetch data. Status code: ${response.statusCode}");
// //   }
// //       return null;
// // }
   

// //   Future<void> _handleRefresh() async {
// //     setState(() {
// //       isRefreshing = true; // Set isRefreshing to true when refreshing
// //     });

// //     await fetchData();

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
// //       body:
// //                 isRefreshing?
// //                Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: Container(
// //                     height: 50,
// //                     width: 50,
// //                     color: Colors.transparent,
// //                     child: const LoadingIndicatorWidget(),
// //                   ),
// //                 ),
// //               ):
            
// //                ListView.builder(
// //                 itemCount: deathDetails.length,
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
// //                                   'Prescription ID: ${deathDetails['id']}'),
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
// //                                   prescripton_id: "${deathDetails['id']}",
// //                                   prescription_report:
// //                                       "${deathDetails['death_certificate']}}",
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
// //               ));
// //             }
          
        
      
    
// //   }







// // //   void showDownloadedFilePath(String path) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: const Text('Download Completed'),
// // //           content: Text('The PDF file is downloaded at: $path'),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () async {
// // //                 Navigator.of(context).pop();
// // //                 if (_downloadedFilePath != null) {
// // //                   // Open the downloaded PDF file using open_file package
// // //                   final result = await OpenFile.open(_downloadedFilePath!);
// // //                   if (result.type == ResultType.done) {
// // //                     print('File opened with success');
// // //                   } else {
// // //                     print('Error opening file: ${result.message}');
// // //                   }
// // //                   // Launch a URL using url_launcher package
// // //                   await launch(
// // //                       ''); // Replace with your desired URL
// // //                 }
// // //               },
// // //               child: const Text('Open'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.lightBlue[50],
// // //       appBar: AppBar(
        
// // //         actions: [
// // //           IconButton(
// // //             onPressed: () {
// // //               FileDownloader.downloadFile(
// // //                 url: '${ApiLinks.generateIdcard}/$PatientId',
// // //                 onProgress: (name, progress) {
// // //                   setState(() {
// // //                     _progress = progress;
// // //                   });
// // //                 },
// // //                 onDownloadCompleted: (path) {
// // //                   print('Downloaded path: $path');
// // //                   setState(() {
// // //                     _progress = null;
// // //                     _downloadedFilePath =
// // //                         path; // Store the downloaded file path
// // //                   });

// // //                   // Show the downloaded file path in a popup
// // //                   showDownloadedFilePath(path);
// // //                 },
// // //               );
// // //             },
// // //             icon: const Icon(Icons.download),
// // //           )
// // //         ],
// // //         title: Text('Certificate'.tr),
// // //         // title: Text('${deathDetails['death_certificate']}'),
// // //         centerTitle: true,
// // //         backgroundColor: darkYellow,
// // //       ),
// // //       body: _progress != null
// // //           ? Center(
// // //               child: Padding(
// // //                   padding: const EdgeInsets.all(10.0),
// // //                   child: Center(
// // //                     child: Padding(
// // //                         padding: const EdgeInsets.all(10.0),
// // //                         child: Container(
// // //                             height: 50,
// // //                             width: 50,
// // //                             color: Colors.transparent,
// // //                             child: const LoadingIndicatorWidget())),
// // //                   )),
// // //             )
// // //           :

// // //           // _progress != null ? Center(child: Lottie.asset('assets/loading1.json'))
// // //           //     :
// // //           SingleChildScrollView(
// // //             child: Column(
// // //               children: [
// // //                 const Text('Death certification',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// // //                 Container(
// // //                   height: height/2.5,
// // //                     color: darkYellow,
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.all(8.0),
// // //                       child: Center(
// // //                         child: const PDF(
// // //                           swipeHorizontal: true,
// // //                         ).cachedFromUrl(
// // //                           '${deathDetails['death_certificate']}',
                          
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20,),
// // //                     Container(
// // //                       height: height/2.5,
// // //                     color: darkYellow,
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.all(8.0),
// // //                       child: Center(
// // //                         child: const PDF(
// // //                           swipeHorizontal: true,
// // //                         ).cachedFromUrl(
// // //                           '${deathDetails['death_certificate']}',
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //               ],
// // //             ),
// // //           ),
// // //     );
// // //   }
// // // }
// // // // 

// // 

//  ListView.builder(
//          itemCount: data?.length,
//          itemBuilder: (context, index) {
//            return  InkWell(
//          onTap: () {
//            Get.to(() => const OldorNewPatientScreen());
//          },
//          child: Card(
//            color: Colors.white,
//            child: Container(
//              width: width,
//              height: 80,
//              child: Row(
//                children: [
//                  Container(
//                      height: height,
//                      width: width / 5,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                          Text('14',
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: darkYellow,
//                                  fontSize: 30)),
//                          const Text('  Thuesday'),
//                        ],
//                      )),
//                  const SizedBox(
//                    width: 40,
//                  ),
//                  const Padding(
//                    padding: EdgeInsets.only(top: 20),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(
//                          '[14/09/2023]  [14/09/2030] ',
//                          style: TextStyle(fontWeight: FontWeight.bold),
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        Text(
//                          '           (4 token left)',
//                          style: TextStyle(color: Colors.red),
//                        )
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        );
           
//          }),
        
    
//     );
//   }
// }




// // child: Padding(
// //           padding: const EdgeInsets.all(10.0),
// //           child: Column(
// //             children: [
// //               Card(
// //                 color: Colors.white,
// //                 child: Container(
// //                   width: width,
// //                   height: 100,
// //                   child: Row(
// //                     children: [
// //                       Container(
// //                         height: height,
// //                         width: 100,
// //                         child: Image.network(
// //                           widget.doctorImage,
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                       const SizedBox(
// //                         width: 10,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(top: 20),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               widget.doctorName,
// //                               style:
// //                                   const TextStyle(fontWeight: FontWeight.bold),
// //                             ),
// //                             Text(widget.doctorSpecialization),
// //                             Text(widget.doctorId)
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               const Divider(),