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

class Maternity extends StatefulWidget {
  const Maternity({Key? key}) : super(key: key);

  @override
  State<Maternity> createState() => _MaternityState();
}

class _MaternityState extends State<Maternity> {
  late String patientID = '';
  late String IPDID = '';
  List<Map<String, dynamic>> apiData = [];
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
    await fetchdaignosis();
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
  List<Map<String, dynamic>> bedHistory = [];
  bool isLoading = true;

  // Function to fetch bed history data from the API
  Future<void> fetchdaignosis() async {
    final apiUrl = Uri.parse(ApiLinks.getipdVitals);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "ipd_id": ipdData,
      "patient_id": patientID,
    };

    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final diagnosisList = jsonResponse['daignosis'] as List<dynamic>?;

      // Check if the diagnosisList is not null before processing
      if (diagnosisList != null) {
        setState(() {
          apiData = diagnosisList.map((item) {
            return {
              "diagnosis": item,
            };
          }).toList();
          isLoading = false; // Set loading indicator to false
        });
      } else {
        setState(() {
          apiData = []; // Set apiData to an empty list
          isLoading = false;
        });
      }
    } else {
      throw Exception('Failed to load diagnosis data');
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

    await fetchdaignosis();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('daignosis'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: isLoading
              ? buildLoadingIndicator() // Show loading indicator if data is loading
              : apiData.isEmpty || apiData == null
                  ? buildNoDataFound() // Show "No Data Found" message if data is empty
                  : Card(
                      child: ListView.builder(
                        itemCount: apiData.length,
                        itemBuilder: (context, index) {
                          final diagnosis = apiData[index]['diagnosis'];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$diagnosis.', // Add a period after the diagnosis
                              style: TextStyle(
                                fontSize: 16,
                                // You can adjust other styles as needed
                              ),
                            ),
                          );
                        },
                      ),
                    )),
    );
  }
}
