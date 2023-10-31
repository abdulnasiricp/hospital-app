// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/Payment_gateway/Select_Payment_Method.dart';
import 'package:TezHealthCare/check.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OPDTicketDetails extends StatefulWidget {
  final String patientName;
  final String patientGender;
  final String patientAddress;
  final String patientDOB;
  final String patientMobile;
  final String ticketDate;
  final String maritalStatus;
  final String bloodGroup;
  final String patientEmail;
  final String selectedDepartment;

  const OPDTicketDetails(
      {Key? key,
      required this.patientName,
      required this.patientGender,
      required this.patientAddress,
      required this.patientDOB,
      required this.patientMobile,
      required this.ticketDate,
      required this.maritalStatus,
      required this.bloodGroup,
      required this.patientEmail,
      required this.selectedDepartment})
      : super(key: key);

  @override
  State<OPDTicketDetails> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<OPDTicketDetails> {
  @override
  void initState() {
    getOpdTicketCharge();
    super.initState();
  }

  bool isLoading = true;

  String opdcharge = '0';
  Future<void> getOpdTicketCharge() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      opdcharge = data['opd_ticket_charge'];

      print('==========$opdcharge');
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load opd ticket charge');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text('OPT Ticket Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  height: 200,
                  width: width,
                  // color: Colors.white,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'hospitalVisitAppointment'.tr,
                            style: TextStyle(
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset('assets/drtwo.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.patientName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(widget.selectedDepartment),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            child: Row(
                              children: [
                                Text('date'.tr),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(widget.ticketDate)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('patientInformation'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: width,
                height: 150,
                child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'patientName'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'patientMobile'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'patientGender'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'patientDOB'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'patientAddress'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 40, top: 10, left: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.patientName),
                            Text(widget.patientMobile),
                            Text(widget.patientGender),
                            Text(widget.patientDOB),
                            Text(widget.patientAddress),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('patientPaymentAmount'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$opdcharge",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[900])),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('confirmationDesc'.tr,
                  style: TextStyle(color: Colors.orange[900])),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text('selectPaymentMethod'.tr,
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const CheckSelectPaymentMethod(
                        ambulance_Amount: 0, radio_Amount: 0,
                        total_Amount: 0,
                        totalAmountInRs:0,
                        totalAmountInpaisa: 0,
                      ));
                },
                child: Container(
                  width: width / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      color: darkYellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'selectPaymentMethod'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
