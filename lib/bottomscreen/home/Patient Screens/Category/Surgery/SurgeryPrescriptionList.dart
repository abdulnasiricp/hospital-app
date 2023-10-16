// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/ViewReport.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurgeryPrescriptionList extends StatefulWidget {
  const SurgeryPrescriptionList({Key? key}) : super(key: key);

  @override
  State<SurgeryPrescriptionList> createState() =>
      _SurgeryPrescriptionListState();
}

class _SurgeryPrescriptionListState extends State<SurgeryPrescriptionList> {
  ///////////////////////////////////////////////////////////////

  late String patientID = '';
  late String IPDID = '';

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';
    IPDID = sp.getString('ipdId') ?? '';

    print(patientID);
    print(
        "======================================================================================$IPDID");

    setState(() {});
  }
///////////////////////////////////////////////////////////////////

  getData() async {
    await LoadData();
    await getpatientDetails();
    _futureData = fetchData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

///////////////////////////////////////////////////////////////////
// get Patinent Detials
  late String ipdData = '';

  Future<void> getpatientDetails() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': patientID,
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
        ipdData = data['result']['ipdid'];

        final sp = await SharedPreferences.getInstance();
        sp.setString('ipdId', ipdData);

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

  /////////////////////////////////////////////

  Future<List<Map<String, dynamic>>?>? _futureData;
  bool isRefreshing = false; // Track refresh state

  Future<List<Map<String, dynamic>>?> fetchData() async {
    try {
      final Map<String, String> headers = {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
      };

      final Map<String, dynamic> requestBody = {
        "ipd_id": ipdData,
        "patient_id": patientID,
      };

      final response = await http.post(
        Uri.parse(
            ApiLinks.surgery),
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map && data.containsKey('getIpdOperation')) {
          final prescriptions =
              List<Map<String, dynamic>>.from(data['getIpdOperation']);
          if (prescriptions.isNotEmpty) {
            return prescriptions;
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isRefreshing = true; // Set isRefreshing to true when refreshing
    });

    await fetchData();

    setState(() {
      isRefreshing = false; // Set isRefreshing to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surgery'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<Map<String, dynamic>>?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                isRefreshing) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                    child: const LoadingIndicatorWidget(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset(
                    'assets/No_Data_Found.json',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                  'Prescription ID: ${item['prescripton_id']}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date: ${item['date']}'),
                                  Text('Test Name: ${item['charge_name']}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  yellow, // Change the background color here
                            ),
                            onPressed: () {
                              Get.to(
                                () => Surgeryreport(
                                  prescripton_id: "${item['prescripton_id']}",
                                  prescription_report:
                                      "${item['prescription_report']}",
                                ),
                              );
                            },
                            child: const Text('View Report'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
