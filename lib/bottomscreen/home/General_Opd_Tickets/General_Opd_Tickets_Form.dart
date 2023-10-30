// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class General_Opd_Tickets_Form extends StatefulWidget {
  const General_Opd_Tickets_Form({Key? key}) : super(key: key);

  ///const General_Opd_Tickets_Form({super.key});

  @override
  State<General_Opd_Tickets_Form> createState() =>
      _General_Opd_Tickets_FormState();
}

class _General_Opd_Tickets_FormState extends State<General_Opd_Tickets_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController Opdticketdate = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController maritalstatusController = TextEditingController();
  TextEditingController BloodGroupController = TextEditingController();
  TextEditingController TicketdateController = TextEditingController();
  TextEditingController DobController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  late DateTime selectedDate;
  String selectedDepartment = '';
  String selectedMaritalstatus = '';
  String selectedBloodGroup = '';
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
    fetchMaritalStatusData();
    bloodGroupData();
  }

  //////////////////////////////////////////////////////////////////////////// For Marital Status
  List<String> maritalStatusList = [];
  Future<void> fetchMaritalStatusData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

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
List<String> bloodGroupList = [];
 Future<void> bloodGroupData() async {
  setState(() {
    isLoading = true;
  });

  try {
    final response = await http.post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data.containsKey('bloodgroup')) {
        final bloodGroupType = data['bloodgroup'];
        print('==========$bloodGroupType');
        setState(() {
          bloodGroupList = bloodGroupType.values.toList().cast<String>();
          print(bloodGroupList);
          isLoading = false;
        });
      } else {
      }
    } else {
      // Handle non-200 status codes
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load blood group data');
    }
  } catch (e) {
    // Handle network or parsing errors
    print('Error: $e');
    setState(() {
      isLoading = false;
    });
  }
}

//////////////////////////////////////////////////////////////////////////// For Marital Status
  Future<void> _selectTicketDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DobController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  // Function to send data to the API
 void fetchOpdTicket() async {
  const url = 'https://uat.tez.hospital/xzy/webservice/addopdticket'; // Replace with the actual URL
  final headers = {
    'Soft-service': 'TezHealthCare',
    'Auth-key': 'zbuks_ram859553467',
  };
  final body = {
          "name": firstNameController.text + lastNameController.text,
        "gender": selectedGender,
        "dob": dobController.text,
        "email": emailController.text,
        "address": addresscontroller.text,
        "mobileno": phoneController.text,
        "department_id": departmentController.text,
        "doctor_id": "1",
        "date": TicketdateController.text,
        "blood_group": BloodGroupController.text,
        "payment_mode": "Cash",
    };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body)
    //  body: {
    //     "name": "rinu",
    //     "gender": "female",
    //     "dob": "25-10-1998",
    //     "email": "a@gmail.com",
    //     "address": "birgunj",
    //     "mobileno": "9855014912",
    //     "department_id": "4",
    //     "doctor_id": "1",
    //     "date": "25-10-2023",
    //     "blood_group": "1",
    //     "payment_mode": "Cash",
    //   },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("opd_ticket")) {
        final opdTicket = data["opd_ticket"];
        print("opd_ticket: $opdTicket");
      } else {
        print("opd_ticket not found in the response.");
      }
    } else {
      print("Failed to fetch opd_ticket. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          title: const Text('OPD Ticket'),
          centerTitle: true,
          backgroundColor: darkYellow,
          actions: [
            IconButton(
                onPressed: () {
                  // Get.to(() => DoctorProfile(
                  //
                  // )
                  // );
                },
                icon: const Icon(Icons.info))
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
                                    _showBloodgroupSelection(context);
                                  },
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'Select Blood Group',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onTap: () {
                                _showBloodgroupSelection(context);
                                
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          controller: addresscontroller,
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          controller: emailController,
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
                        fetchOpdTicket();

                        if (_formKey.currentState!.validate()) {
                          // Form is valid, submit data to the API or perform other actions.
                          // postDataToApi();
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
        color: selectedGender == gender ? darkYellow : Colors.blue[50],
        width: width / 4,
        child: Card(
          color: Colors.white,
          elevation: 3,
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
                    fontSize: 15,
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Department',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                                            selectedDepartment;
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Marital Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

  void _showBloodgroupSelection(BuildContext context) {
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Blood Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      : bloodGroupList.isEmpty
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
                                itemCount: bloodGroupList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  int itemNumber = index + 1;
                                  return Card(
                                    color: Colors.white70.withOpacity(0.7),
                                    child: ListTile(
                                      title: Text(
                                        '$itemNumber. ${bloodGroupList[index]}',
                                      ),
                                      onTap: () {
                                        selectedBloodGroup =
                                            bloodGroupList[index];
                                        BloodGroupController.text =
                                            selectedBloodGroup;
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

  // void _showBloodgroupSelection(BuildContext context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
  //     ),
  //     context: context,
  //     builder: (BuildContext context) {
  //       final Map<String, String> BloodGroup = {
  //         "A+": "A+",
  //         "A-": "A-",
  //         "B+": "B+",
  //         "B-": "B-",
  //         "O+": "O+",
  //         "O-": "O-",
  //         "AB+": "AB+",
  //         "AB-": "AB-",
  //         "NA": "N/A",
  //       };

  //       return Container(
  //         height: MediaQuery.of(context).size.height * 0.5,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             const Padding(
  //               padding: EdgeInsets.all(8.0),
  //               child: Text(
  //                 'Select Your Blood Group',
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             Divider(),
  //             Expanded(
  //               child: ListView.builder(
  //                 itemCount: BloodGroup.length,
  //                 itemBuilder: (context, index) {
  //                   final statusKey = BloodGroup.keys.elementAt(index);
  //                   final statusValue = BloodGroup[statusKey];
  //                   int itemNumber = index + 1;
  //                   return Card(
  //                     color: Colors.white70.withOpacity(0.7),
  //                     child: ListTile(
  //                       title: Text("$itemNumber. $statusValue"),
  //                       onTap: () {
  //                         selectedBloodGroup = BloodGroup[statusKey]!;
  //                         BloodGroupController.text = selectedBloodGroup;
  //                         Navigator.of(context).pop();
  //                       },
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
