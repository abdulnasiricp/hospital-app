// ignore: file_names
// ignore_for_file: unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, file_names, duplicate_ignore, camel_case_types

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Doctor_book_Opd/CheckSelectPaymentMethod.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Doctor_Book_Details extends StatefulWidget {
  final String patientName;
  final String DepartmentId;
  final String BloodgroupId;
  final String Bloodgroupname;
  final String patientGender;
  final String patientAddress;
  final String patientDOB;
  final String patientMobile;
  final String ticketDate;
  final String maritalStatus;
  final String bloodGroup;
  final String patientEmail;
  final String selectedDepartmentname;
  final String doctorName;
  final String department_id;
  final String doctorId;

  const Doctor_Book_Details({
    Key? key,
    required this.patientName,
    required this.DepartmentId,
    required this.patientGender,
    required this.patientAddress,
    required this.patientDOB,
    required this.patientMobile,
    required this.ticketDate,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.patientEmail,
    required this.BloodgroupId,
    required this.Bloodgroupname,
    required this.selectedDepartmentname,
    required this.doctorName,
    required this.department_id,
    required this.doctorId,
  }) : super(key: key);
  @override
  State<Doctor_Book_Details> createState() => _Doctor_Book_DetailsState();
}

class _Doctor_Book_DetailsState extends State<Doctor_Book_Details> {
  bool isLoading = true; // Add a loading indicator variable
  late num opdticketcharge = 0;
  //convert rupess to paisa
  late num OPdRupeesAmount = opdticketcharge;
  late int rupeesAmountInt = OPdRupeesAmount.toInt();
  num rupeesToPaisa(num rupees) {
    return rupees * 100.0;
  }

  late int OpdPaisaAmount = rupeesToPaisa(OPdRupeesAmount).round();
  getData() async {
    await fetchOpdTicketCharge();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> fetchOpdTicketCharge() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.post(Uri.parse(ApiLinks.OPDTicketList));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      opdticketcharge = data['opd_ticket_charge'];
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load marital status data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text(' Ticket Details'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: const LoadingIndicatorWidget(),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ticketinfo'.tr,
                      style: TextStyle(
                          color: Colors.orange[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: width,
                      height: height / 6,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ticket Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Department',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Doctor Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Doctor Id',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 40, top: 10, left: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.ticketDate.isEmpty
                                        ? "N/A"
                                        : widget.ticketDate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    widget.selectedDepartmentname.isEmpty
                                        ? "N/A"
                                        : widget.selectedDepartmentname,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    widget.doctorName.isEmpty
                                        ? "N/A"
                                        : widget.doctorName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    widget.doctorId.isEmpty
                                        ? "N/A"
                                        : widget.doctorId,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
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
                    Text('patientInformation'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      width: width,
                      height: 200,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'patientName'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientMobile'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientEmail'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientGender'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientBloodGroup'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientDOB'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientAddress'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 40, top: 10, left: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.patientName.isEmpty
                                      ? "N/A"
                                      : widget.patientName),
                                  Text(widget.patientMobile.isEmpty
                                      ? "N/A"
                                      : widget.patientMobile),
                                  Text(widget.patientEmail.isEmpty
                                      ? "N/A"
                                      : widget.patientEmail),
                                  Text(widget.patientGender.isEmpty
                                      ? "N/A"
                                      : widget.patientGender),
                                  Text(widget.Bloodgroupname.isEmpty
                                      ? "N/A"
                                      : widget.Bloodgroupname),
                                  Text(widget.patientDOB.isEmpty
                                      ? "N/A"
                                      : widget.patientDOB),
                                  Text(
                                    widget.patientAddress.isEmpty
                                        ? "N/A"
                                        : widget.patientAddress,
                                    overflow: TextOverflow.fade,
                                  ),
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
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Rs. $opdticketcharge",
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
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SelectPaymentmethodfordoctorbooking(
                              totalAmountInRs: rupeesAmountInt,
                              total_AmountPaisa: OpdPaisaAmount,
                              BloodgroupId: widget.BloodgroupId.isEmpty
                                  ? "N/A"
                                  : widget.BloodgroupId,
                              Bloodgroupname: widget.Bloodgroupname.isEmpty
                                  ? "N/A"
                                  : widget.Bloodgroupname,
                              DepartmentId: widget.DepartmentId.isEmpty
                                  ? "N/A"
                                  : widget.DepartmentId,
                              bloodGroup: widget.bloodGroup,
                              maritalStatus: widget.maritalStatus.isEmpty
                                  ? "N/A"
                                  : widget.maritalStatus,
                              patientAddress: widget.patientAddress.isEmpty
                                  ? "N/A"
                                  : widget.patientAddress,
                              patientDOB: widget.patientDOB.isEmpty
                                  ? "N/A"
                                  : widget.patientDOB,
                              patientEmail: widget.patientEmail.isEmpty
                                  ? "N/A"
                                  : widget.patientEmail,
                              patientGender: widget.patientGender.isEmpty
                                  ? "N/A"
                                  : widget.patientGender,
                              patientMobile: widget.patientMobile.isEmpty
                                  ? "N/A"
                                  : widget.patientMobile,
                              patientName: widget.patientName.isEmpty
                                  ? "N/A"
                                  : widget.patientName,
                              selectedDepartment: widget.department_id.isEmpty
                                  ? "N/A"
                                  : widget.department_id,
                              ticketDate: widget.ticketDate,
                              doctorId: widget.doctorId,
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
