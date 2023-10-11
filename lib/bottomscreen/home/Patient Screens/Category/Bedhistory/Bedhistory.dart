// ignore_for_file: file_names, avoid_print, non_constant_identifier_names, unnecessary_null_comparison, sized_box_for_whitespace

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Bedhistory extends StatefulWidget {
  const Bedhistory({Key? key}) : super(key: key);

  @override
  State<Bedhistory> createState() => _BedhistoryState();
}

class _BedhistoryState extends State<Bedhistory> {
  //////////////////////////////////////////////////////////////////////////////////
// get Shared Prefernce data

  late String patientID = '';
  late String iPDID = '';

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';
    iPDID = sp.getString('ipdId') ?? '';

    print(patientID);
    setState(() {});
  }
///////////////////////////////////////////////////////////////////

  getData() async {
    await LoadData();

    await fetchVitalsData().then((data) {
      setState(() {
        bedHistory = data['bed_history'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
///////////////////////////////////////////////////////////////////

  late List<dynamic> bedHistory = [];

  Future<Map<String, dynamic>> fetchVitalsData() async {
    final response = await http.post(
      Uri.parse(ApiLinks.getipdVitals), // Replace with your API URL
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
      },
      body: jsonEncode({
        "ipd_id": iPDID,
        "patient_id": patientID,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load vitals data');
    }
  }
  //////////////////////////////////////////////////////////////////////////////
  ///refresh screen call
   bool isLoading = true;
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchVitalsData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }
  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedhistory'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: bedHistory == null
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
          : RefreshIndicator(
            onRefresh: _handleRefresh,
            child: ListView.builder(
                itemCount: bedHistory.length,
                itemBuilder: (context, index) {
                  final historyItem = bedHistory[index];
                  return Card(
                    margin: const EdgeInsets.all(10.0),
                    elevation: 5.0,
                    child: ListTile(
                      title: Text('Bed Name: ${historyItem["bed_name"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ward: ${historyItem["ward"]}'),
                          Text('Floor Name: ${historyItem["floor_name"]}'),
                          Text('From Date: ${historyItem["from_date"]}'),
                          Text('To Date: ${historyItem["to_date"] ?? 'N/A'}'),
                        ],
                      ),
                      trailing: Text(
                        'Status: ${historyItem["is_active"]}',
                        style: TextStyle(
                          color: historyItem["is_active"] == "yes"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }
}
