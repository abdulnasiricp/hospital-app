// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/opd_tickets_details.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class General_Opd_Tickets_Form extends StatefulWidget {
  const General_Opd_Tickets_Form({Key? key}) : super(key: key);

  @override
  State<General_Opd_Tickets_Form> createState() =>
      _General_Opd_Tickets_FormState();
}

class _General_Opd_Tickets_FormState extends State<General_Opd_Tickets_Form> {
  final double _progress = 0.0; // Declare _progress here
  InAppWebViewController? webView; // Declare webView here
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController Opdticketdate = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController maritalstatusController = TextEditingController();

  TextEditingController TicketdateController = TextEditingController();
  TextEditingController DobController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  TextEditingController BloodGroupController = TextEditingController();
  TextEditingController TickettypeController = TextEditingController();
  late DateTime selectedDate;
  String selectedDepartment = '';
  String selectedMaritalstatus = '';
  String selectedBloodGroup = '';
  String selectedBloodGroupId = '';
  String selectedTicketType = '';
  String selectedTicketTypeId = '';
  String selectedDepartmentId = '';

  String Maritalstatus = '';
  String selectedGender = ''; // Stores the selected gender.

  // Function to handle gender selection.
  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

////////////////////////////// for select departmet

  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? maritalStatus;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];

  bool isLoading = true;
  Future<void> fetchDepartmentData() async {
    final response = await http.post(Uri.parse(ApiLinks.OPDTicketList));

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
    fetchMaritalStatusData();
    fetchBloodgroupData();
  }

  //////////////////////////////////////////////////////////////////////////// For Marital Status
  List<String> maritalStatusList = [];
  Future<void> fetchMaritalStatusData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(Uri.parse(ApiLinks.OPDTicketList));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final maritalStatus = data['marital_status'];
      setState(() {
        maritalStatusList = maritalStatus.values.toList().cast<String>();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load marital status data');
    }
  }

/////////////////////////////////////

  List<String> BloodgroupList = [];
  Future<void> fetchBloodgroupData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(Uri.parse(ApiLinks.OPDTicketList));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final maritalStatus = data['bloodgroup'];
      setState(() {
        BloodgroupList = maritalStatus.values.toList().cast<String>();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load marital status data');
    }
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

  Future<void> _selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DobController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
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
                            text: "Ticket Type",
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
                      controller: TickettypeController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                          ),
                          onPressed: () {
                            _showTicketstypeSelection(context);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Select Ticket Type',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        _showTicketstypeSelection(context);
                      },
                    )),
                  ],
                ),
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
                height: 5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Marital Status",
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
                          controller: maritalstatusController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                              onPressed: () {
                                _showMaritalSelection(context);
                              },
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Select Marital Status',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () {
                            _showMaritalSelection(context);
                          },
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Blood Group",
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
                          controller: BloodGroupController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                              onPressed: () {
                                _showbloodgroupSelection(context);
                              },
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Select Blood Group',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () {
                            _showbloodgroupSelection(context);
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "First Name",
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
                        TextFormField(
                          controller: firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter First Name',
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Last Name",
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
                        TextFormField(
                          controller: lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Last Name',
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              // Other form fields...
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: " Gender",
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildGenderCard(
                        icon: Icons.male,
                        label: 'Male',
                        gender: 'male',
                      ),
                      buildGenderCard(
                        icon: Icons.female,
                        label: 'Female',
                        gender: 'female',
                      ),
                      buildGenderCard(
                        icon: Icons.circle_outlined,
                        label: 'Other',
                        gender: 'other',
                      ),
                    ],
                  ),
                  if (selectedGender.isEmpty) // Add this condition
                    const Text(
                      'Please select a gender', // Error message
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
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
                            text: "Date of Birth",
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
                        controller: DobController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                  _selectDob(context);
                                }),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter Date of Births',
                            fillColor: Colors.white,
                            filled: true),
                        readOnly: true,
                        onTap: () => _selectDob(context),
                      ),
                    ),
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
                            text: "Phone Number",
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required'; // Display a message when the field is empty
                        } else if (value.length != 10) {
                          return 'Phone number must be 10 digits'; // Display a message for incorrect length
                        } else {
                          return null; // No error when the field has a valid 10-digit value
                        }
                      },
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      controller: phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter phone Number',
                          fillColor: Colors.white,
                          filled: true),
                    ),
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
                    const Text(' Email Address (optional)',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email Address',
                          fillColor: Colors.white,
                          filled: true),
                    ),
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
                            text: "Address",
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      controller: addresscontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Full Address',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
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
                      Get.to(() => OPDTicketDetails(
                            selectedDepartment: departmentController.text,
                            ticketDate: TicketdateController.text,
                            maritalStatus: maritalstatusController.text,
                            bloodGroup: selectedBloodGroupId,
                            patientName: firstNameController.text +
                                " " +
                                lastNameController.text,
                            patientGender: selectedGender,
                            patientDOB: DobController.text,
                            patientMobile: phoneController.text,
                            patientEmail: emailController.text,
                            patientAddress: addresscontroller.text,
                            Bloodgroupname: selectedBloodGroup,
                            BloodgroupId: selectedBloodGroupId,
                            DepartmentId: selectedDepartmentId,
                            selectedTicketType: selectedTicketType,
                            selectedTicketTypeId: selectedTicketTypeId,
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

  Widget buildGenderCard(
      {required IconData icon, required String label, required String gender}) {
    return GestureDetector(
      onTap: () {
        selectGender(gender);
      },
      child: Container(
        color: selectedGender == gender ? darkYellow : Colors.white,
        width: width / 4,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: selectedGender == gender ? darkYellow : Colors.grey,
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: selectedGender == gender ? darkYellow : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

//////////////////////////////////////////////
///////////////////////////// for select marital status

  void _showMaritalSelection(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items at the ends
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Marital Status',
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
                  isLoading
                      ? Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.transparent,
                              child: const LoadingIndicatorWidget(),
                            ),
                          ),
                        ))
                      : maritalStatusList.isEmpty
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
                                itemCount: maritalStatusList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  int itemNumber = index + 1;
                                  return Card(
                                    color: Colors.white70.withOpacity(0.7),
                                    child: ListTile(
                                      title: Text(
                                        '$itemNumber. ${maritalStatusList[index]}',
                                      ),
                                      onTap: () {
                                        selectedMaritalstatus =
                                            maritalStatusList[index];
                                        maritalstatusController.text =
                                            selectedMaritalstatus;
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

  void _showbloodgroupSelection(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items at the ends
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Your Blood Group',
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
                  isLoading
                      ? Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.transparent,
                              child: const LoadingIndicatorWidget(),
                            ),
                          ),
                        ))
                      : BloodgroupList.isEmpty
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
                                itemCount: BloodgroupList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String bloodGroup =
                                      BloodgroupList[index]; // Get the value
                                  String bloodGroupId = (index + 1)
                                      .toString(); // Create a key (e.g., 1-based index)
                                  return Card(
                                    color: Colors.white70.withOpacity(0.7),
                                    child: ListTile(
                                      title: Text('$bloodGroupId. $bloodGroup'),
                                      onTap: () {
                                        selectedBloodGroupId = bloodGroupId;
                                        selectedBloodGroup = bloodGroup;
                                        BloodGroupController.text =
                                            '$selectedBloodGroupId. $selectedBloodGroup';
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  );
                                },
                              ),
                            )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showTicketstypeSelection(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Create a list with "Emergency" and "General" only
            List<Map<String, dynamic>> combinedData = [
              {"id": 1, "name": "Emergency"},
              {"id": 0, "name": "General"},
            ];

            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Your Blood Group',
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
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.transparent,
                                child: const LoadingIndicatorWidget(),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: combinedData.length,
                            itemBuilder: (BuildContext context, int index) {
                              int id = combinedData[index]["id"];
                              String item = combinedData[index]["name"];
                              return Card(
                                color: Colors.white70.withOpacity(0.7),
                                child: ListTile(
                                  title: Text(
                                    '$item',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    selectedTicketTypeId =
                                        id != null ? id.toString() : item;
                                    selectedTicketType = item;
                                    TickettypeController.text =
                                        '$selectedTicketType';
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
