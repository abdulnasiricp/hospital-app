// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_print, unused_import

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Blood_Bank extends StatefulWidget {
  const Blood_Bank({Key? key}) : super(key: key);

  @override
  State<Blood_Bank> createState() => _Blood_BankState();
}

class _Blood_BankState extends State<Blood_Bank> {
  List<dynamic> bloodIssueData = [];
  List<dynamic> bloodComponentData = [];
  bool isLoading = true;
  String errorMessage = '';
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
    super.initState();
    loadSP();

    loadSP().then((_) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/getbloodbankDetails';
    final Map<String, String> headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final Map<String, dynamic> body = {
      "patient_id": PatientId,
    };
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $PatientId");

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          bloodIssueData = data['bloodissue'];
          bloodComponentData = data['bloodcomponent'];
          isLoading = false;
        });
      } else if (response.statusCode == 500) {
        setState(() {
          errorMessage = 'Internal Server Error';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred while fetching data.';
        isLoading = false;
      });
      print('Error: $e');
    }
  }

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
      appBar: AppBar(
        title: Text('bloodBank'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: <Widget>[
              if (isLoading)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                    child: const LoadingIndicatorWidget(),
                  ),
                ),
              if (errorMessage.isNotEmpty)
                Center(
                  child: Text(errorMessage),
                ),
              if (!isLoading && errorMessage.isEmpty)
                Expanded(
                  child: (bloodIssueData.isEmpty && bloodComponentData.isEmpty)
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
                      : Card(
                          child: ListView.builder(
                            itemCount: bloodIssueData.length +
                                bloodComponentData.length,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> item =
                                  index < bloodIssueData.length
                                      ? bloodIssueData[index]
                                      : bloodComponentData[
                                          index - bloodIssueData.length];

                              // Customize the displayed information here
                              final String id = item['id'];
                              final String dateOfIssue = item['date_of_issue'];
                              final String reference = item['reference'];
                              final String netAmount = item['net_amount'];
                              final String gender = item['gender'];
                              final String patientName = item['patient_name'];
                              final String donorName = item['donor_name'];
                              final String volume = item['volume'];
                              final String transactionId =
                                  item['transaction_id'];

                              return Card(
                                child: ListTile(
                                  title: Text(
                                    'ID: $id',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text('Date of Issue: '),
                                          Text(
                                            '$dateOfIssue',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Reference: '),
                                          Text('$reference',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Net Amount: '),
                                          Text('$netAmount',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Gender: '),
                                          Text('$gender',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Patient Name: '),
                                          Text('$patientName',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Donor Name: '),
                                          Text('$donorName',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Volume: '),
                                          Text('$volume',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Transaction ID: '),
                                          Text('$transactionId',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
