// // ignore_for_file: sized_box_for_whitespace

// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';

// class ViewBillDetiles extends StatefulWidget {
//   final String billNo;

//   const ViewBillDetiles({Key? key, required this.billNo}) : super(key: key);

//   @override
//   State<ViewBillDetiles> createState() => _ViewBillDetilesState();
// }

// class _ViewBillDetilesState extends State<ViewBillDetiles> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bill Details '),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: width / 5,
//                 height: height / 10,
//                 child: Image.asset('assets/hospital_logo.png'),
//               ),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'मधेश प्रदेश सरकार',
//                     style: TextStyle(fontSize: 10, color: Colors.red),
//                   ),
//                   Text('सामाजिक विकास मन्त्रालय\n      स्वास्थ्य निर्देशनालय',
//                       style: TextStyle(fontSize: 10)),
//                 ],
//               ),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('वेबसाइट : gaurhospital.p2.com.np',
//                       style: TextStyle(fontSize: 10)),
//                   Text('फोन नम्बर : 051520153', style: TextStyle(fontSize: 10)),
//                   Text('इमेल : gaurhospital@gmail.com',
//                       style: TextStyle(fontSize: 10)),
//                 ],
//               ),
//             ],
//           ),
//           const Column(
//             children: [
//               Text(
//                 'प्रादेशिक अस्पताल सिराह',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'सि रहा , नेपा ल',
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Service Bill(Copy of original)',
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//               Divider(color: Colors.black, thickness: 2),
//             ],
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Patient: Sita (10825)',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'HIS No. :',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Bill No: DB2852',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Doctor :Ramjinish Prasad Kushwaha (982188)',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Date: 15/09/2023 03:04 PM/ 2080/5/29',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Age : 25 Y 2M',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           //
//           const Divider(height: 3, color: Colors.black, thickness: 2),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     'S.No. ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '1 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '2 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Services',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Ortho Tram',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'UGI ENDOSCOPY(PRO03)',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Date ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '15/09/2023  ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '15/09/2023  ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Qty ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '1 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '1 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Charge',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '6000.00 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '1500.00 ',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Amount (RS.)',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '6000.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '6000.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Divider(height: 3, color: Colors.black, thickness: 2),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Gross Amount',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Net Amount',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Paid',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Total Due',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'RS.7500.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'RS.7500.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'RS.7500.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'RS.0.00',
//                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           const Divider(height: 3, color: Colors.black, thickness: 2),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'In Words: SEVEN THOUSAND FIVE HUNDRED ONLY ',
//                 style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Billed by :Ramjinish Prasad Kushwaha',
//                 style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const Divider(height: 3, color: Colors.black, thickness: 2),
//            Column(
//             children: [
//               Text(
//                 widget.billNo,
//                 style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//               ),
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class ViewBillDetiles extends StatefulWidget {
  final String billNo;
  final String billname;

  const ViewBillDetiles(
      {Key? key, required this.billNo, required this.billname})
      : super(key: key);

  @override
  State<ViewBillDetiles> createState() => _ViewBillDetilesState();
}

class _ViewBillDetilesState extends State<ViewBillDetiles> {
  double? _progress;
  String PatientId = '';
  String? _downloadedFilePath; // Store the downloaded file path

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    PatientId = sp.getString('patientidrecord') ?? '';
    print(PatientId);
    setState(() {});
  }

  loadSP() async {
    await LoadData();
  }

  @override
  void initState() {
    loadSP();
    super.initState();
  }

  // Function to show a popup with the PDF file path
  void showDownloadedFilePath(String path) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Download Completed'),
          content: Text('The PDF file is downloaded at: $path'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (_downloadedFilePath != null) {
                  // Open the downloaded PDF file using open_file package
                  final result = await OpenFile.open(_downloadedFilePath!);
                  if (result.type == ResultType.done) {
                    print('File opened with success');
                  } else {
                    print('Error opening file: ${result.message}');
                  }

                  // Launch a URL using url_launcher package
                  // await launch('https://uat.tez.hospital/xzy/webservice/generateIdcard/$PatientId'); // Replace with your desired URL
                  await launch(
                      'https://uat.tez.hospital/xzy/webservice/generateBillPrint/${widget.billNo}/${widget.billname}'); // Replace with your desired URL
                }
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // _progress != null
          //     ? const Center(
          //   child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: CircularProgressIndicator(),
          //   ),
          // )
          //     :
          IconButton(
            onPressed: () {
              FileDownloader.downloadFile(
                url:
                    'https://uat.tez.hospital/xzy/webservice/generateBillPrint/${widget.billNo}/${widget.billname}',
                onProgress: (name, progress) {
                  setState(() {
                    _progress = progress;
                  });
                },
                onDownloadCompleted: (path) {
                  print('Downloaded path: $path');
                  setState(() {
                    _progress = null;
                    _downloadedFilePath =
                        path; // Store the downloaded file path
                  });

                  // Show the downloaded file path in a popup
                  showDownloadedFilePath(path);
                },
              );
            },
            icon: const Icon(Icons.download),
          )
        ],
        title: Text("Bill No ${widget.billNo}"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: _progress != null
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: height / 7,
                      width: width / 1.5,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Downloading....',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Lottie.asset('assets/loading1.json'),
                        ],
                      ))),
            )
          :

          // _progress != null ? Center(child: Lottie.asset('assets/loading1.json'))
          //     :
          Container(
              color: darkYellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: const PDF(
                    swipeHorizontal: true,
                  ).cachedFromUrl(
                    'https://uat.tez.hospital/xzy/webservice/generateBillPrint/${widget.billNo}/${widget.billname}',
                  ),
                ),
              ),
            ),
    );
  }
}
