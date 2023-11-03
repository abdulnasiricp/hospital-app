// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
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
                      '${ApiLinks.generateIdcard}/$PatientId'); // Replace with your desired URL
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
          IconButton(
            onPressed: () async {
              final status = await Permission.storage.request();
              if (status.isGranted) {
                FileDownloader.downloadFile(
                  name: 'Tez_Health_Care-$PatientId.pdf',
                  url: '${ApiLinks.generateIdcard}/$PatientId',
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
        title: Text('card'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: _progress != null
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
                    '${ApiLinks.generateIdcard}/$PatientId',
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
