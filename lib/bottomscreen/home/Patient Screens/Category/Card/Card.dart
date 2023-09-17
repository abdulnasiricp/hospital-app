// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class PdfListScreen extends StatefulWidget {
  const PdfListScreen({Key? key}) : super(key: key);

  @override
  _PdfListScreenState createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {
  double progress=0;
  // late InAppWebViewController InAppWebViewController;




//    Map<String, dynamic>? DataMap;
//   Map<String, dynamic>? DoneDataMap;
//   List<dynamic>? pdfUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     hitCardApi();
//   }
// Future hitCardApi() async {
//     final response = await http.post(
//         Uri.parse('https://uat.tez.hospital/xzy/webservice/generateIdcard'),
//         body: {
//               "patient_id":"10380"
//         },
//         headers: {
//           'Soft-service': 'TezHealthCare',
//           'Auth-key': 'zbuks_ram859553467'
//         });
//     if (response.statusCode == 200) {
//       setState(() {
//         DataMap = jsonDecode(response.body);
//         DoneDataMap = DataMap!['card_url'];
//         print(DoneDataMap);
//       });
//     } else {
//       print('Error getting Products: ${response.statusCode}');
//     }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF List'),
      ),
      body: Stack(children:[
       InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://uat.tez.hospital/xzy/webservice/generateIdcard')),
       )

      ]),
      // ListView.builder(
      //   itemCount: DoneDataMap?.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       color: Colors.amber[50],
      //       child: ListTile(
      //         leading: const Icon(Icons.picture_as_pdf),
          
              
              
      //         title: const Text('Card '),
      //         onTap: () {
      //           Get.to(()=>PdfViewerScreen(pdfUrl: DoneDataMap.toString()),
      //             );
                
      //         },
      //       ),
      //     );
      //   },
      // ),
    );
  }
}







class PdfViewerScreen extends StatelessWidget {
  final String pdfUrl;

  const PdfViewerScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfUrl, // Provide the PDF URL here
        enableSwipe: true, // Enable swipe gestures for navigation
        swipeHorizontal: true, // Enable horizontal swipe
        pageFling: true, // Enable page-flinging animation
        pageSnap: true, // Enable snapping to pages
        defaultPage: 0, // Specify the initial page
        fitPolicy: FitPolicy.BOTH, // Adjust the view mode (zoom-in/zoom-out)
      ),
    );
  }
}
