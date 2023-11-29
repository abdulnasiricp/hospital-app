// ignore_for_file: file_names, camel_case_types, unnecessary_null_comparison, non_constant_identifier_names, avoid_print, sized_box_for_whitespace
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Operation_Report extends StatefulWidget {
  const Operation_Report({Key? key}) : super(key: key);

  //const Operation_Report({super.key});

  @override
  State<Operation_Report> createState() => _Operation_ReportState();
}

class _Operation_ReportState extends State<Operation_Report> {
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
    await fetchBedHistory();
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
  
    // Set the body
    final body = {
      'patient_id': 10909,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getpatientDetails),
        headers: ApiLinks.MainHeader,
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
  List<Map<String, dynamic>> bedHistory = [];
  bool isLoading = true;

  // Function to fetch bed history data from the API
  Future<void> fetchBedHistory() async {
    final apiUrl = Uri.parse(ApiLinks.getipdVitals);
   
    final body = {
      "ipd_id": ipdData,
      "patient_id": patientID,
    };

    final response =
        await http.post(apiUrl, headers: ApiLinks.MainHeader, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final bedHistoryList = jsonResponse['bed_history'] as List<dynamic>;

      setState(() {
        bedHistory = bedHistoryList.map((historyItem) {
          return {
            "ward": historyItem['ward'],
            "bed_name": historyItem['bed_name'],
            "floor_name": historyItem['floor_name'],
            "from_date": historyItem['from_date'],
            "to_date": historyItem['to_date'],
            "is_active": historyItem['is_active'],
          };
        }).toList();
        isLoading = false; // Set loading indicator to false
      });
    } else {
      throw Exception('Failed to load bed history');
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

    await fetchBedHistory();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Operation'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: isLoading
            ? buildLoadingIndicator() // Show loading indicator if data is loading
            : bedHistory.isEmpty || bedHistory == null
                ? buildNoDataFound() // Show "No Data Found" message if data is empty
                : ListView.builder(
                    itemCount: bedHistory.length,
                    itemBuilder: (context, index) {
                      final historyItem = bedHistory[index];
// Determine the status text based on "is_active" value
                      final statusText = historyItem["is_active"] == "yes"
                          ? "active"
                          : "inactive";
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
                              Text(
                                  'To Date: ${historyItem["to_date"] ?? 'N/A'}'),
                            ],
                          ),
                          trailing: Text(
                            'Status: $statusText', // Use the determined status text
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

