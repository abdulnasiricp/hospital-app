// ignore_for_file: unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Re-OPD/Re_Opd_with_General/ReOPDselect_payment_method.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReOPDTicketDetails extends StatefulWidget {
  final String ticketDate;
  final String selectedDepartment;
  final String selectedTicketType;

  const ReOPDTicketDetails({
    Key? key,
    required this.selectedTicketType,
    required this.ticketDate,
    required this.selectedDepartment,
  }) : super(key: key);

  @override
  State<ReOPDTicketDetails> createState() => _ReOPDTicketDetailsState();
}

class _ReOPDTicketDetailsState extends State<ReOPDTicketDetails> {
  bool isLoading = true; // Add a loading indicator variable
  late num opdticketcharge = 0;
  //convert rupess to paisa
  late num OPdRupeesAmount = opdticketcharge;
  late int rupeesAmountInt = OPdRupeesAmount.toInt();

  num rupeesToPaisa(num rupees) {
    return rupees * 100.0;
  }

  late int OpdPaisaAmount = rupeesToPaisa(OPdRupeesAmount).round();
///////////////////////////////////////////////////////////////////
  //get Shared preferance data
  var profileData;

  String Patient_id = '';
  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  Future<void> ProfileApi() async {
    const apiUrl = ApiLinks.getPatientprofile;
  

    final requestBody = jsonEncode({"patientId": Patient_id});

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: ApiLinks.MainHeader, body: requestBody);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profileJson =
            responseBody[0]; // Assuming your API returns a list with one item
        setState(() {
          profileData = ProfileData.fromJson(profileJson);
        });
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Request error: $e');
    }
  }

  getData() async {
    await LoadData();
    await ProfileApi();
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
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the previous page when the back button is pressed
        Get.to(() => ReOPDTicketDetails(
          selectedTicketType: widget.selectedTicketType,
          ticketDate: widget.ticketDate,
          selectedDepartment: widget.selectedDepartment,
        ));
        return false; // Return true to allow the back button press, or false to intercept it
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: Text('Re-OPD Ticket Details'.tr),
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ticket Type'.tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Ticket Date'.tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Department'.tr,
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
                                    Text(
                                      widget.selectedTicketType.isEmpty
                                          ? "N/A"
                                          : widget.selectedTicketType,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      widget.ticketDate.isEmpty
                                          ? "N/A"
                                          : widget.ticketDate,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      widget.selectedDepartment.isEmpty
                                          ? "N/A"
                                          : widget.selectedDepartment,
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
                                    Text(
                                      'Marital Status'.tr,
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
                                    Text(
                                      (profileData?.patientName ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.patientName,
                                    ),
                                    Text(
                                      (profileData?.mobileNo ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.mobileNo,
                                    ),
                                    Text(
                                      (profileData?.email ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.email,
                                    ),
                                    Text(
                                      (profileData?.gender ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.gender,
                                    ),
                                    Text(
                                      (profileData?.bloodGroup ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.bloodGroup,
                                    ),
                                    Text(
                                      (profileData?.dob ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.dob,
                                    ),
                                    Text(
                                      (profileData?.address ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.address,
                                      overflow: TextOverflow.fade,
                                    ),
                                    Text(
                                      (profileData?.maritalStatus ?? '').isEmpty
                                          ? 'N/A'
                                          : profileData!.maritalStatus,
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
                          Get.offAll(() => ReOPdCheckSelectPaymentMethod(
                                selectedTicketTypeId: '',
                                totalAmountInRs: rupeesAmountInt,
                                total_AmountPaisa: OpdPaisaAmount,
                                BloodgroupId: '',
                                Bloodgroupname: '',
                                DepartmentId: '',
                                bloodGroup: profileData?.bloodGroup,
                                maritalStatus: profileData?.maritalStatus,
                                patientAddress: profileData?.address,
                                patientDOB: profileData?.dob,
                                patientEmail: profileData?.email,
                                patientGender: profileData?.gender,
                                patientMobile: profileData?.mobileNo,
                                patientName: profileData?.patientName,
                                selectedDepartment: widget.selectedDepartment,
                                ticketDate: widget.ticketDate,
                                selectedTicketType: widget.selectedTicketType,
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
      ),
    );
  }
}
