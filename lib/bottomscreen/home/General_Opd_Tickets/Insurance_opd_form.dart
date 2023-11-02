// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/Insurance_Opd_Ticket_Details.dart';
import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/opd_tickets_details.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Insurance_opd_form extends StatefulWidget {
  final String dob;
  final String gender;
  final String name;
  final String Phone;
  final String contractDate;
  final String balance;
  final String InsuranceorSSFid;
  final String email;
  final String pataddress;

  Insurance_opd_form({
    required this.dob,
    required this.email,
    required this.gender,
    required this.name,
    required this.Phone,
    required this.contractDate,
    required this.balance,
    required this.InsuranceorSSFid,
    required this.pataddress,
  });

  @override
  State<Insurance_opd_form> createState() => _Insurance_opd_formState();
}

class _Insurance_opd_formState extends State<Insurance_opd_form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  TextEditingController TicketdateController = TextEditingController();
  late DateTime selectedDate;
  String selectedDepartment = '';
  String selectedDepartmentId = '';

////////////////////////////// for select departmet

  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? maritalStatus;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];

  bool isLoading = true;
  Future<void> fetchDepartmentData() async {
    final response = await http
        .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        data = dataMap['department'];
        filteredData = data;
        isLoading = false;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  void handleNonJsonResponse() {
    print('Non-JSON response or API error');
    setState(() {
      isLoading = false;
    });
  }
  ////////////////////

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
              element['name'].toLowerCase().contains(query.toLowerCase()) ||
              element['id'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  /////////////////////////////
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    fetchDepartmentData();
    searchController = TextEditingController();
    data = [];
    filteredData = [];
  }

//////////////////////////////////////////////////////////////////////////// For Marital Status
  Future<void> _selectTicketDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        TicketdateController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insurance OPD Ticket'),
          centerTitle: true,
          backgroundColor: darkYellow,
          actions: [
            IconButton(
              onPressed: () {
                ///_opdTicketInfo(context);
                //  Get.to(() => Ticket());
              },
              icon: SvgPicture.asset(
                'assets/info1.svg',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
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
                                text: "Select Department",
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
                          readOnly:
                              true, // Set this to true to disable the keyboard
                          controller: departmentController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                              onPressed: () {
                                _showDepartmentSelection(context);
                              },
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Select department',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () {
                            _showDepartmentSelection(context);
                          },
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Select Ticket Date",
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
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            controller: TicketdateController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_month),
                                    onPressed: () {
                                      _selectTicketDate(context);
                                    }),
                                border: const OutlineInputBorder(),
                                hintText: 'Select Ticket Date',
                                fillColor: Colors.white,
                                filled: true),
                            readOnly: true,
                            onTap: () => _selectTicketDate(context),
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
                          Get.to(() => Insurance_Opd_Ticket_Details(
                                selectedDepartment: departmentController.text,
                                ticketDate: TicketdateController.text,
                                DepartmentId: selectedDepartmentId,
                                InsuranceorSSFid: widget.InsuranceorSSFid,
                                Phone: widget.Phone,
                                name: widget.name,
                                dob: widget.dob,
                                gender: widget.gender,
                            pataddress: widget.pataddress,
                            email: widget.email,
                                balance: widget.balance,
                                contractDate: widget.contractDate,
                              ));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(yellow),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }

  ///////////////////////////// for select department
  void _showDepartmentSelection(BuildContext context) {
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
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items at the ends
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Department',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close), // Close icon
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      width: width / 0.8,
                      height: 50,
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (query) {
                          setState(() {
                            filterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search Department',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
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
                        ))
                      : filteredData!.isEmpty
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
                            ))
                          : Expanded(
                              child: ListView.builder(
                                itemCount: filteredData?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  int itemNumber = index + 1;
                                  return Card(
                                    color: Colors.white70.withOpacity(0.7),
                                    child: ListTile(
                                      title: Text(
                                        '$itemNumber. ${filteredData?[index]['name'] ?? ''}',
                                      ),
                                      onTap: () {
                                        selectedDepartment =
                                            filteredData?[index]['name'] ?? '';
                                        selectedDepartmentId =
                                            filteredData?[index]['id'] ?? '';
                                        departmentController.text =
                                            '($selectedDepartmentId) $selectedDepartment';

                                        Navigator.of(context).pop();
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
