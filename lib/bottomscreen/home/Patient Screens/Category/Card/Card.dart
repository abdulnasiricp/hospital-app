// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, unnecessary_string_interpolations

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  double? _progress;
  String PatientId = '';
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
        appBar: AppBar(
          actions: [
           _progress!=null?const Center(child: Padding(
             padding: EdgeInsets.all(8.0),
             child: CircularProgressIndicator(),
           )): IconButton(
                onPressed: () {
                  FileDownloader.downloadFile(
                      url:
                          'https://uat.tez.hospital/xzy/webservice/generateIdcard/$PatientId',
                      onProgress: (name, progress) {
                       setState(() {
                          _progress=progress;
                       });
                      },
                      onDownloadCompleted: (path) {
                        print('$path');
                        setState(() {
                          _progress=null;
                        });
                        
                      }
                      );
                },
                icon: const Icon(Icons.download))
          ],
          backgroundColor: darkYellow,
          title: const Text('Card'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SfPdfViewer.network('https://uat.tez.hospital/xzy/webservice/generateIdcard/$PatientId/'
              
              // 'https://uat.tez.hospital/xzy/webservice/generateIdcard/10819'
              ),
        ));
  }
}
