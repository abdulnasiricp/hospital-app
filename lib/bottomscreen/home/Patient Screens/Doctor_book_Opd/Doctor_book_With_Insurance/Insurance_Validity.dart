// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, prefer_const_constructors_in_immutables

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/Insurance_opd_form.dart';
import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Organization {
  final String id;
  final String organisationName;
  final String code;
  final String contactNo;
  final String address;
  final String contactPersonName;
  final String contactPersonPhone;
  final String accesscodeUsername;
  final String accesscodePassword;
  final String link;
  final String username;
  final String password;
  final String header;
  final String remoteUser;
  final String createdAt;
  Organization({
    required this.id,
    required this.organisationName,
    required this.code,
    required this.contactNo,
    required this.address,
    required this.contactPersonName,
    required this.contactPersonPhone,
    required this.accesscodeUsername,
    required this.accesscodePassword,
    required this.link,
    required this.username,
    required this.password,
    required this.header,
    required this.remoteUser,
    required this.createdAt,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      organisationName: json['organisation_name'],
      code: json['code'],
      contactNo: json['contact_no'],
      address: json['address'],
      contactPersonName: json['contact_person_name'],
      contactPersonPhone: json['contact_person_phone'],
      accesscodeUsername: json['accesscode_username'],
      accesscodePassword: json['accesscode_password'],
      link: json['link'],
      username: json['username'],
      password: json['password'],
      header: json['header'],
      remoteUser: json['remote_user'],
      createdAt: json['created_at'],
    );
  }
}

class Insurance_Validity extends StatefulWidget {
  final String doctorName;
  final String Departmentname;
  final String ticketDate;
  final String department_id;
  final String doctorId;
  const Insurance_Validity({
    Key? key,
    required this.doctorName,
    required this.Departmentname,
    required this.ticketDate,
    required this.department_id,
    required this.doctorId,
  }) : super(key: key);
  @override
  State<Insurance_Validity> createState() => _Insurance_ValidityState();
}

class _Insurance_ValidityState extends State<Insurance_Validity> {
  List<Organization> organizations = [];
  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/db_table'),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
      },
      body: jsonEncode({
        "table": "organisation",
      }),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data['result'];
      setState(() {
        organizations = List<Organization>.from(
            result.map((org) => Organization.fromJson(org)));
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController InsurancetypeController = TextEditingController();
  TextEditingController InsurancenumberController = TextEditingController();
  String selectedInsurancetypename = '';
  String selectedInsurancetypeId = '';
  bool isLoading = false;
  String statusMessage = '';
  Map<String, dynamic> insuranceDetails = {};
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const Bottomhome());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: const Text('Check Status Of Insurance'),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Get.to(() => const Bottomhome());
              },
              child: const Icon(Icons.arrow_back)),
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
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Insurance Type",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  readOnly: true,
                                  controller: InsurancetypeController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        _showInsurancetypeSelection(context);
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Select Insurance Type',
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  onTap: () {
                                    _showInsurancetypeSelection(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: selectedInsurancetypename == 'SSF'
                                          ? "SSF Id"
                                          : "Insurance  Id",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                controller: InsurancenumberController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: selectedInsurancetypename == 'SSF'
                                      ? 'Enter SSF Id'
                                      : 'Enter Insurance Id',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (insuranceDetails.containsKey('status') &&
                            insuranceDetails['status'] != "1")
                          Center(
                              child: Container(
                                  height: 20,
                                  child: const Text(
                                    "Insurance details not available.",
                                    style: TextStyle(color: Colors.red),
                                  ))),
                        if (insuranceDetails.containsKey('status') &&
                            insuranceDetails['status'] == "1")
                          InsuranceDetailsWidget(
                              insuranceDetails: insuranceDetails),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: !(insuranceDetails.containsKey('status') &&
                              insuranceDetails['status'] == "1"),
                          child: Center(
                            child: Container(
                              width: width,
                              height: height / 15,
                              child: ElevatedButton(
                                child: const Text("Check Status"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    fetchInsuranceDetails();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(yellow),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: insuranceDetails.containsKey('status') &&
                              insuranceDetails['status'] == "1",
                          child: Center(
                            child: Container(
                              width: width,
                              height: height / 15,
                              child: ElevatedButton(
                                child: Text('proceed'.tr),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    fetchInsuranceDetails().then((_) {
                                      if (insuranceDetails
                                              .containsKey('status') &&
                                          insuranceDetails['status'] == "1") {
                                        // Navigate to the InsuranceOpdFormScreen and pass the data
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            Insurance_opd_form(
                                              dob: insuranceDetails['dob'] ??
                                                  "N/A",
                                              gender:
                                                  insuranceDetails['gender'] ??
                                                      "N/A",
                                              name: insuranceDetails['name'] ??
                                                  "N/A",
                                              contractDate: insuranceDetails[
                                                      'contract_date'] ??
                                                  "N/A",
                                              Phone:
                                                  insuranceDetails['phone'] ??
                                                      "N/A",
                                              pataddress:
                                                  insuranceDetails['address'] ??
                                                      "N/A",
                                              email:
                                                  insuranceDetails['phone'] ??
                                                      "N/A",
                                              balance:
                                                  insuranceDetails['balance'] ??
                                                      "N/A",
                                              InsuranceorSSFid:
                                                  InsurancenumberController
                                                      .text,
                                            
                                            ),
                                               
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(yellow),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void _showInsurancetypeSelection(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Insurance Type',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  if (isLoading)
                    Expanded(
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
                  else if (organizations.isEmpty)
                    Expanded(
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Lottie.asset(
                            'assets/No_Data_Found.json',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: organizations.length,
                        itemBuilder: (context, index) {
                          final organization = organizations[index];
                          return Card(
                            color: Colors.white70.withOpacity(0.7),
                            child: ListTile(
                              title: Text(organization.organisationName),
                              onTap: () {
                                selectedInsurancetypename =
                                    organization.organisationName;
                                selectedInsurancetypeId = organization.id;
                                InsurancetypeController.text =
                                    selectedInsurancetypename;
                                Navigator.of(context).pop();
                                print(
                                    'selectedInsurancetypeId: $selectedInsurancetypeId');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> fetchInsuranceDetails() async {
    setState(() {
      isLoading = true;
    });

    const url =
        'https://uat.tez.hospital/xzy/webservice/get_insurance_details'; // Replace with your API endpoint
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final body = jsonEncode({
      "insurance_type": selectedInsurancetypeId,
      "insurance_id": InsurancenumberController.text,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final result = data['result'];
        setState(() {
          insuranceDetails = result;
        });
      }
    } catch (e) {
      print('Error fetching insurance details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class InsuranceDetailsWidget extends StatelessWidget {
  final Map<String, dynamic> insuranceDetails;

  const InsuranceDetailsWidget({Key? key, required this.insuranceDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height / 4.5,
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
                        'Date of Birth:'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Gender'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Name'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Contract Date'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Balance'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                      Text("${insuranceDetails['dob']}"),
                      Text(" ${insuranceDetails['gender']}"),
                      Text("${insuranceDetails['name']}"),
                      Text("${insuranceDetails['contract_date']}"),
                      Text("${insuranceDetails['balance']}")
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
            Text("Rs. FREE",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.orange[900])),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
            "The OPD amount will be deducted from your insurance balance, ensuring a seamless and convenient process for your healthcare expenses.",
            style: TextStyle(color: Colors.orange[900])),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  "You are eligible for buy Ticket with Insurance .\n If you want to buy ticket click on PROCEED",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}
