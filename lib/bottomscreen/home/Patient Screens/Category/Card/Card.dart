import 'dart:io';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  double? _progress;
  String PatientId = '';
  String? _downloadedFilePath;
  bool isError = false;

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
    checkStatusCodeAndDownload();
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
                  final result = await OpenFile.open(_downloadedFilePath!);
                  if (result.type == ResultType.done) {
                    print('File opened with success');
                  } else {
                    print('Error opening file: ${result.message}');
                  }
                  await launch('${ApiLinks.generateIdcard}/$PatientId');
                }
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  Future<void> checkStatusCodeAndDownload() async {
    try {
      final statusCode = await checkStatusCode();
      if (statusCode == 500) {
        setState(() {
          isError = true;
        });
      } else {
        FileDownloader.downloadFile(
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
              _downloadedFilePath = path;
            });
            showDownloadedFilePath(path);
          },
        );
      }
    } on HttpException catch (e) {
      print('Http error: $e');
      setState(() {
        isError = true;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isError = true;
      });
    }
  }

  Future<int> checkStatusCode() async {
    await Future.delayed(Duration(seconds: 2));
    return 500; // Replace with the actual status code checking logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              checkStatusCodeAndDownload();
            },
            icon: const Icon(Icons.download),
          )
        ],
        title: Text('card'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: isError
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
          : _progress != null
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
                          child: const LoadingIndicatorWidget(),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
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
}
