// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmbulanceRequest {
  final String id;
  final String patientName;
  final String address;
  final String vehicleModel;
  final String driverName;
  final String vehicleNo;
  final String amount;
  final String date;
  final String doctorName;
  final String mobileno;
  final String chargeName;

  AmbulanceRequest({
    required this.id,
    required this.patientName,
    required this.address,
    required this.vehicleModel,
    required this.driverName,
    required this.vehicleNo,
    required this.amount,
    required this.date,
    required this.doctorName,
    required this.mobileno,
    required this.chargeName,
  });
}

class Ambulance extends StatefulWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  late Future<List<AmbulanceRequest>> ambulanceRequests;
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
      ambulanceRequests = fetchAmbulanceRequests();
    });
  }

  Future<List<AmbulanceRequest>> fetchAmbulanceRequests() async {
    final apiUrl = Uri.parse(ApiLinks.getAmbulanceDetails);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      'patient_id': Patient_id,
    };
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ $Patient_id");
    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final ambulanceRequestList = jsonResponse['result'] as List<dynamic>;

      return ambulanceRequestList.map((request) {
        return AmbulanceRequest(
          id: request['id'],
          patientName: request['patient'],
          address: request['address'],
          vehicleModel: request['vehicle_model'],
          driverName: request['driver_name'],
          vehicleNo: request['vehicle_no'],
          amount: request['amount'],
          date: request['date'],
          doctorName: request['doctor_name'],
          mobileno: request['mobileno'],
          chargeName: request['charge_name'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load ambulance requests');
    }
  }

  bool isLoading = true;
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchAmbulanceRequests();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ambulance'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<AmbulanceRequest>>(
          future: ambulanceRequests,
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
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
              final ambulanceRequests = snapshot.data!;

              return ListView.builder(
                itemCount: ambulanceRequests.length,
                itemBuilder: (context, index) {
                  final request = ambulanceRequests[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Patient Name: ${request.patientName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address: ${request.address}'),
                          Text('Vehicle Model: ${request.vehicleModel}'),
                          Text('Driver Name: ${request.driverName}'),
                          Text('Vehicle No: ${request.vehicleNo}'),
                          Text('Amount: ${request.amount}'),
                          Text('Date: ${request.date}'),
                          Text('Doctor Name: ${request.doctorName}'),
                          Text('Mobile No: ${request.mobileno}'),
                          Text('Charge Name: ${request.chargeName}'),
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
