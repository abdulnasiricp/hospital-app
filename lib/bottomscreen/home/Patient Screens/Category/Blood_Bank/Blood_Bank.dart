import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodIssue {
  final String id;
  final String patientId;
  final String dateOfIssue;
  final String hospitalDoctor;
  final String reference;
  final String amount;
  final String bloodGroup;
  final String patientName;
  final String gender;
  final String donorName;
  final String bagNo;
  final String volume;
  final String unit;

  BloodIssue({
    required this.id,
    required this.patientId,
    required this.dateOfIssue,
    required this.hospitalDoctor,
    required this.reference,
    required this.amount,
    required this.bloodGroup,
    required this.patientName,
    required this.gender,
    required this.donorName,
    required this.bagNo,
    required this.volume,
    required this.unit,
  });
}

class Blood_Bank extends StatefulWidget {
  //const Blood_Bank({super.key});

  @override
  State<Blood_Bank> createState() => _Blood_BankState();
}

class _Blood_BankState extends State<Blood_Bank> {
  late Future<List<BloodIssue>> bloodIssues;

  String Patient_id = '';

  // Separate method for loading data asynchronously
  Future<void> loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the loadData method here
    loadData();
    // Now, you can call fetchAmbulanceRequests once the data is loaded
    loadData().then((_) {
      bloodIssues = fetchBloodIssues();
    });
  }

  Future<List<BloodIssue>> fetchBloodIssues() async {
    final apiUrl = Uri.parse(
        ApiLinks.getbloodbankDetails);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
      
    };
    final body = {
      "patient_id": Patient_id,
    };

    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final bloodIssueList = jsonResponse['bloodissue'] as List<dynamic>;

      return bloodIssueList.map((issue) {
        return BloodIssue(
          id: issue['id'],
          patientId: issue['patient_id'],
          dateOfIssue: issue['date_of_issue'],
          hospitalDoctor: issue['hospital_doctor'],
          reference: issue['reference'],
          amount: issue['amount'],
          bloodGroup: issue['blood_group'],
          patientName: issue['patient_name'],
          gender: issue['gender'],
          donorName: issue['donor_name'],
          bagNo: issue['bag_no'],
          volume: issue['volume'],
          unit: issue['unit'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load blood issues');
    }
  }

  bool isLoading = true;
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchBloodIssues();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloodbank'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<BloodIssue>>(
          future: bloodIssues,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.transparent,
                        child: const LoadingIndicatorWidget())),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Container(
                    height: 150,
                    width: 150,
                    child: Lottie.asset(
                      'assets/No_Data_Found.json',
                      fit: BoxFit.cover,
                    )),
              );
            } else {
              final bloodIssues = snapshot.data!;

              return ListView.builder(
                itemCount: bloodIssues.length,
                itemBuilder: (context, index) {
                  final issue = bloodIssues[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Patient Name: ${issue.patientName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gender: ${issue.gender}'),
                          Text('Date of Issue: ${issue.dateOfIssue}'),
                          Text('Blood Group: ${issue.bloodGroup}'),
                          Text('Donor Name: ${issue.donorName}'),
                          Text('Bag No: ${issue.bagNo}'),
                          Text('Volume: ${issue.volume}'),
                          Text('Unit: ${issue.unit}'),
                          Text('Amount: ${issue.amount}'),
                        ],
                      ),
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
