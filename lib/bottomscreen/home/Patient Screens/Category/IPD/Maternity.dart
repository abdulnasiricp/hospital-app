// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names, unnecessary_string_interpolations, unused_field

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:http/http.dart' as http;

class Maternity extends StatefulWidget {
  const Maternity({Key? key}) : super(key: key);

  @override
  State<Maternity> createState() => _MaternityState();
}

class _MaternityState extends State<Maternity> {
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
    await getpatientDetails();
    await getMternityData();
    print("==============> $maternityReport");
    print("==============> $ipdData");
  }

  @override
  void initState() {
    loadSP();

    super.initState();
  }

  ////////////////////////////////////////////////////////////////////////////
  late String ipdData = '';

  Future<void> getpatientDetails() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': PatientId,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getpatientDetails),
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        // Get the total_dues and patho_dues values
        ipdData = data['result']['ipdid'];

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

  /////////////////////////////////////////////////////////////////////////
  // get meternity data
  late String maternityReport = '';

  Future<void> getMternityData() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'ipd_id': ipdData,
      'patient_id': PatientId,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.Maternity),
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        // Get the total_dues and patho_dues values
        maternityReport = data['result']['report'];

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

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
                  await launch(
                      '$maternityReport'); // Replace with your desired URL
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
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FileDownloader.downloadFile(
                url: '$maternityReport',
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
        title: Text('Maternity'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: maternityReport.isEmpty
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.transparent,
                            child: const LoadingIndicatorWidget())),
                  )),
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
                    '$maternityReport',
                  ),
                ),
              ),
            ),
    );
  }
}
