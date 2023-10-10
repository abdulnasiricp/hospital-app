import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
class BloodIssue {
  final String id;
  final String patientName;
  final String gender;
  final String dateOfIssue;
  final String bloodGroup;
  final String donorName;
  final String bagNo;
  final String volume;
  final String unit;
  final String amount;

  BloodIssue({
    required this.id,
    required this.patientName,
    required this.gender,
    required this.dateOfIssue,
    required this.bloodGroup,
    required this.donorName,
    required this.bagNo,
    required this.volume,
    required this.unit,
    required this.amount,
  });
}
class Blood_Bank extends StatefulWidget {
 //const Blood_Bank({super.key});

  @override
  State<Blood_Bank> createState() => _Blood_BankState();
}

class _Blood_BankState extends State<Blood_Bank> {
  final List<BloodIssue> bloodIssues = [
    BloodIssue(
      id: "17",
      patientName: "rinku devi",
      gender: "Female",
      dateOfIssue: "2023-09-11 12:08:00",
      bloodGroup: "B+",
      donorName: "Bikrant Tiwari",
      bagNo: "1234",
      volume: "1",
      unit: "1",
      amount: "150.00",
    ),
    // Add more BloodIssue objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boodbank'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: ListView.builder(
        itemCount: bloodIssues.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Patient Name: ${bloodIssues[index].patientName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gender: ${bloodIssues[index].gender}'),
                  Text('Date of Issue: ${bloodIssues[index].dateOfIssue}'),
                  Text('Blood Group: ${bloodIssues[index].bloodGroup}'),
                  Text('Donor Name: ${bloodIssues[index].donorName}'),
                  Text('Bag No: ${bloodIssues[index].bagNo}'),
                  Text('Volume: ${bloodIssues[index].volume}'),
                  Text('Unit: ${bloodIssues[index].unit}'),
                  Text('Amount: ${bloodIssues[index].amount}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}