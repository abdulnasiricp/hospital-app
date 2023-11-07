
// ignore_for_file: avoid_print, sized_box_for_whitespace, file_names

import 'dart:convert';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  List<dynamic> deathData = [];
  List<dynamic> birthData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        "https://uat.tez.hospital/xzy/webservice/generateCertificate");
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = jsonEncode({'patient_id': '10814'});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        deathData = data['death'];
        birthData = data['birth'];
      });
    } else {
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text("Certificate"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: ListView(
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
    );
  }
}

class DataListWidget extends StatelessWidget {
  final List<dynamic> dataList;
  final String title;
  const DataListWidget({Key? key, required this.dataList, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            final item = dataList[index];
            return Card(
              child: Stack(
                children: [
                  ListTile(
                    title: Text(item['patient_name']),
                    subtitle: Text('Date: ${item['death_date']}'),
                    onTap: () {},
                  ),
                  CornerBanner(title: title),
                  // Add corner banner here
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
      top: 0,
      left: 0,
      child: Banner(
        message: title,
        location: BannerLocation.topStart,
        color: title == 'Birth'
            ? Colors.blue
            : Colors.red, // Customize the colors as needed
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
