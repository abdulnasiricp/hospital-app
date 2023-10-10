import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
  // const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  final List<AmbulanceRequest> ambulanceRequests = [
    AmbulanceRequest(
      id: "13",
      patientName: "pooja kushwaha",
      address: "birgunj nepal",
      vehicleModel: "78",
      driverName: "tftrdrfx",
      vehicleNo: "01145ad",
      amount: "500.00",
      date: "2023-07-28 17:35:00",
      doctorName: "Rahul Patel (65695)",
      mobileno: "9824210111",
      chargeName: "USG",
    ),
    // Add more AmbulanceRequest objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedhistory'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: ListView.builder(
        itemCount: ambulanceRequests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title:
                  Text('Patient Name: ${ambulanceRequests[index].patientName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address: ${ambulanceRequests[index].address}'),
                  Text('Vehicle Model: ${ambulanceRequests[index].vehicleModel}'),
                  Text('Driver Name: ${ambulanceRequests[index].driverName}'),
                  Text('Vehicle No: ${ambulanceRequests[index].vehicleNo}'),
                  Text('Amount: ${ambulanceRequests[index].amount}'),
                  Text('Date: ${ambulanceRequests[index].date}'),
                  Text('Doctor Name: ${ambulanceRequests[index].doctorName}'),
                  Text('Mobile No: ${ambulanceRequests[index].mobileno}'),
                  Text('Charge Name: ${ambulanceRequests[index].chargeName}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
