// ignore_for_file: avoid_print, sized_box_for_whitespace, file_names, deprecated_member_use, non_constant_identifier_names, unused_field

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Certificate/view_certificate.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {

   late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

  loadSP() async {
    await LoadData();
    await fetchData();
  }

  List<dynamic>? deathData = [];
  List<dynamic>? birthData = [];

  @override
  void initState() {
    super.initState();
    loadSP();
  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        "https://uat.tez.hospital/xzy/webservice/generateCertificate");
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = jsonEncode({'patient_id': patient});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        isLoading = false;
        deathData = data['death'];
        birthData = data['birth'];
      });
    } else {
      // Handle the error
    }
  }

  bool isLoading = true;

  //refresh screen
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
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text("Certificate".tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
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
            : deathData!.isEmpty
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
                : ListView(
                    children: [
                      DataListWidget(
                        dataList: deathData,
                        title: 'Death',
                      ),
                      DataListWidget(
                        dataList: birthData,
                        title: 'Birth',
                      ),
                    ],
                  ),
      ),
    );
  }
}

class DataListWidget extends StatefulWidget {
  final List<dynamic>? dataList;
  final String title;

  const DataListWidget({
    Key? key,
    required this.dataList,
    required this.title,
  }) : super(key: key);

  @override
  State<DataListWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  @override
  @override
  void initState() {
    LoadData();

    super.initState();
  }

  double? _progress;
  String patientId = '';
  String? _downloadedFilePath; // Store the downloaded file path

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patientId = sp.getString('patientidrecord') ?? '';
    print(patientId);
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.dataList != null) // Check if dataList is not null
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.dataList?.length,
            itemBuilder: (context, index) {
              final item = widget.dataList?[index];
              return Card(
                child: Stack(
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name:  ${item['patient_name'] ?? 'N/A'}'),
                          Text('Gender:  ${item['gender'] ?? 'N/A'}'),
                          Text('Address:  ${item['address'] ?? 'N/A'}'),
                        ],
                      ), // Use null-aware operator
                      subtitle: Text(
                          'Date: ${item['death_date'] ?? 'N/A'}'), // Use null-aware operator
                      onTap: () {
                        Get.to(() => ViewCertificate(
                              certificateLink:
                                  item['death_certificate'] ?? 'N/A',
                            ));
                      },
                      trailing: Container(
                        height: 30,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(darkYellow),
                          ),
                          onPressed: () async {
                            final status = await Permission.storage.request();
                            if (status.isGranted) {
                              FileDownloader.downloadFile(
                                name: 'Tez_Health_Care-$patientId.pdf',
                                url: item['death_certificate'] ?? 'N/A',
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
                          child: const Text('Download'),
                        ),
                      ),
                    ),
                    CornerBanner(title: widget.title),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}

class CornerBanner extends StatelessWidget {
  final String title;

  const CornerBanner({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        left: -30,
        child: Transform.rotate(
          angle: -1.5708,
          child: Container(
            width: 70,
            color: title == 'Birth'
                ? Colors.blue
                : Colors.red, // Customize the colors as needed
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
