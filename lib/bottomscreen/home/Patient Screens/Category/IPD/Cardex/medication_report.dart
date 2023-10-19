// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicationReport extends StatefulWidget {
  const MedicationReport({Key? key}) : super(key: key);

  @override
  State<MedicationReport> createState() => _MedicationReportState();
}

class _MedicationReportState extends State<MedicationReport> {
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
    await fetchMedicationreport();
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Map<String, dynamic>> Medicationreport = [];
  bool isLoading = true;

  // Function to fetch Medication data from the API
  Future<void> fetchMedicationreport() async {
    final apiUrl = Uri.parse(ApiLinks.Cardex);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "ipd_id": ipdData,
    };

    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final MedicationreportList =
          jsonResponse['medication_report'] as List<dynamic>;

      setState(() {
        Medicationreport = MedicationreportList.map((MedicationItem) {
          return {
            "id": MedicationItem['id'],
            "patient_id": MedicationItem['patient_id'],
            "case_id": MedicationItem['case_id'],
            "ipd_id": MedicationItem['ipd_id'],
            "pharmacy_id": MedicationItem['pharmacy_id'],
            "created_at": MedicationItem['created_at'],
            "updated_at": MedicationItem['updated_at'],
            "medicine_name": MedicationItem['medicine_name'],
            "dosage": MedicationItem['dosage'],
          };
        }).toList();
        isLoading = false; // Set loading indicator to false
      });
    } else {
      throw Exception('Failed to load Medication Report');
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget buildLoadingIndicator() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: 50,
              width: 50,
              color: Colors.transparent,
              child: const LoadingIndicatorWidget())),
    );
  }

  Widget buildNoDataFound() {
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
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchMedicationreport();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: isLoading
            ? buildLoadingIndicator() // Show loading indicator if data is loading
            : Medicationreport.isEmpty || Medicationreport == null
                ? buildNoDataFound() // Show "No Data Found" message if data is empty
                : ListView.builder(
                    itemCount: Medicationreport.length,
                    itemBuilder: (context, index) {
                      final MedicationItem = Medicationreport[index];

                      return Card(
                        margin: const EdgeInsets.all(10.0),
                        elevation: 1.0,
                        child: ListTile(
                          title: Text(
                              'Patient Id: ${MedicationItem["patient_id"]}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${MedicationItem["id"]}'),
                              Text('Dosage: ${MedicationItem["dosage"]}'),
                              Text(
                                  'Created At: ${MedicationItem["created_at"]}'),
                              Text(
                                  'Updated At: ${MedicationItem["updated_at"] ?? 'N/A'}'),
                              Text(
                                  'Medicine Name: ${MedicationItem["medicine_name"] ?? 'N/A'}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
