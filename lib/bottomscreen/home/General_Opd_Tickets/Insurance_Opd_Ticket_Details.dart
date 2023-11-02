import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/OPD_Ticket_Booking_Successful_Insurance.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Insurance_Opd_Ticket_Details extends StatefulWidget {
  final String DepartmentId;
  final String ticketDate;
  final String name;
  final String selectedDepartment;
  final String dob;
  final String gender;
  final String InsuranceorSSFid;
  final String balance;
  final String Phone;
  final String contractDate;
  final String pataddress;
  final String email;
  const Insurance_Opd_Ticket_Details({
    Key? key,
    required this.DepartmentId,
    required this.pataddress,
    required this.email,
    required this.contractDate,
    required this.balance,
    required this.name,
    required this.gender,
    required this.ticketDate,
    required this.dob,
    required this.selectedDepartment,
    required this.InsuranceorSSFid,
    required this.Phone,
  }) : super(key: key);

  @override
  State<Insurance_Opd_Ticket_Details> createState() =>
      _Insurance_Opd_Ticket_DetailsState();
}

class _Insurance_Opd_Ticket_DetailsState
    extends State<Insurance_Opd_Ticket_Details> {
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
// await changeStringToInt();
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

    final response = await http
        .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

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
        title: const Text('OPT Ticket Details'),
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
                      height: 100,
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Department',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Insurance Or SSf Id',
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
                                    widget.ticketDate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    widget.selectedDepartment,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    widget.InsuranceorSSFid,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
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
                      height: 160,
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
                                    'email'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientGender'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'patientDOB'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Address'.tr,
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
                                  Text(widget.name.isEmpty
                                      ? 'N/A'
                                      : widget.name),
                                  Text(widget.Phone.isEmpty
                                      ? 'N/A'
                                      : widget.Phone),
                                  Text(widget.email.isEmpty
                                      ? 'N/A'
                                      : widget.email),
                                  Text(widget.gender.isEmpty
                                      ? 'N/A'
                                      : widget.gender),
                                  Text(widget.dob.isEmpty ? 'N/A' : widget.dob),
                                  Text(widget.pataddress.isEmpty
                                      ? 'N/A'
                                      : widget.pataddress),
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
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => OPD_Ticket_Booking_Successful_Insurance(
                          ticketDate: widget.ticketDate,
                          DepartmentId: widget.DepartmentId,
                          InsuranceorSSFid: widget.InsuranceorSSFid,
                          Phone: widget.Phone,
                          name: widget.name,
                          dob: widget.dob,
                          gender: widget.gender,
                          pataddress: widget.pataddress,
                          email: widget.email,
                          balance: widget.balance,
                          contractDate: widget.contractDate,
                            )
                        );
                      },
                      child: Container(
                        width: width / 1,
                        height: 50,
                        decoration: BoxDecoration(
                            color: darkYellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Confirmation',
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
