// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class USGScanreportview extends StatefulWidget {
  final String id;
  final String scan_report_link;
  const USGScanreportview({
    Key? key,
    required this.id,
    required this.scan_report_link,
  }) : super(key: key);

  @override
  State<USGScanreportview> createState() => _USGScanreportviewState();
}

class _USGScanreportviewState extends State<USGScanreportview> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final status = await Permission.storage.request();
              if (status.isGranted) {
                FileDownloader.downloadFile(
                  name: 'Tez_Health_Care-usg-Scan$PatientId.pdf',
                  url: widget.scan_report_link,
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

                    // Automatically open the downloaded file
                    _openDownloadedFile(path);
                  },
                );
              } else {
                print('Permission denied');
                // Handle permission denial here
              }
            },
            icon: const Icon(Icons.download),
          )
        ],
        title: Text("Bill No ${widget.id}"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: _progress != null
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.transparent,
                      child: const LoadingIndicatorWidget())),
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
                      widget.scan_report_link // Use the provided PDF URL here
                      ),
                ),
              ),
            ),
    );
  }

  void _openDownloadedFile(String filePath) async {
    if (_downloadedFilePath != null) {
      final result = await OpenFile.open(
        filePath,
        type: 'application/pdf', // Specify the content type as PDF
      );

      if (result.type == ResultType.done) {
        print('File opened with success');
      } else {
        print('Error opening file: ${result.message}');
      }
    }
  }
}
