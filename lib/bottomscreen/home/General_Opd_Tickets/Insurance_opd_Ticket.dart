// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

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

class Insurance_opd_Ticket extends StatefulWidget {
  const Insurance_opd_Ticket({Key? key}) : super(key: key);

  @override
  State<Insurance_opd_Ticket> createState() => _Insurance_opd_TicketState();
}

class _Insurance_opd_TicketState extends State<Insurance_opd_Ticket> {
  // For organizations list
  List<Organization> organizations = [];
  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/db_table'),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
        'Content-Type': 'application/json',
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

  // For processing indicator
  bool isLoading = false;
  String statusMessage = '';

  Future<void> fetchInsuranceDetails() async {
    setState(() {
      isLoading = true;
    });

    const url = 'https://uat.tez.hospital/xzy/webservice/get_insurance_details';
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
      'Content-Type': 'application/json',
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
        final status = result['status'];

        if (status == '1') {
          print('Insurance Details: $result');
          // Parse the result and update the UI if needed
        } else if (status == '0') {
          statusMessage = 'Some issues found in your insurance and SSF';
        }
      } else {
        statusMessage = 'Error: Failed to fetch insurance details';
      }
    } catch (e) {
      print('Error fetching insurance details: $e');
      statusMessage = 'An error occurred while fetching insurance details';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                Center(
                  child: Container(
                    width: width,
                    height: height / 15,
                    child: ElevatedButton(
                      child: Text('proceed'.tr),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          fetchInsuranceDetails();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(yellow),
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  const CircularProgressIndicator(),
                if (statusMessage.isNotEmpty)
                  Text(
                    statusMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to display the selection modal
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
                  isLoading
                      ? Expanded(
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
                      : organizations.isEmpty
                      ? Expanded(
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
                      : Expanded(
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
}
