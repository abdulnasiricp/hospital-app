// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use, unnecessary_null_comparison, unnecessary_string_interpolations

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Re-OPD/Re_Opd_with_General/GeneralReOPDdetails.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Re_OPD extends StatefulWidget {
  const Re_OPD({Key? key}) : super(key: key);
  @override
  State<Re_OPD> createState() => _Re_OPDState();
}

class _Re_OPDState extends State<Re_OPD> {
  final double _progress = 0.0; // Declare _progress here
  InAppWebViewController? webView; // Declare webView here
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController Opdticketdate = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController TicketdateController = TextEditingController();
  TextEditingController TickettypeController = TextEditingController();
  late DateTime selectedDate;
  String selectedDepartment = '';
  String selectedDepartmentId = '';
  String selectedTicketType = '';
  String selectedTicketTypeId = '';

////////////////////////////// for select departmet
  Map<String, dynamic>? DataMap;
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
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('reopd'.tr),
            centerTitle: true,
            backgroundColor: darkYellow,
            leading: IconButton(
                onPressed: () {
                  Get.offAll(() => const Bottomhome());
                },
                icon: const Icon(Icons.arrow_back)),
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
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Ticket Type".tr,
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
                          InkWell(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required'.tr;
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
                              hintText: 'Select Ticket Type'.tr,
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
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Select Department".tr,
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
                          InkWell(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required'.tr;
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
                              hintText: 'Select department'.tr,
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
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Select Ticket Date".tr,
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
                          InkWell(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required'.tr;
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
                                  hintText: 'Select Ticket Date'.tr,
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
                            Get.to(() => ReOPDTicketDetails(
                                  selectedDepartment: departmentController.text,
                                  ticketDate: TicketdateController.text,
                                  selectedTicketType: selectedTicketType,
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
          )),
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
                      Expanded(
                        child: Center(
                          child: Text(
                            'Select Department'.tr,
                            style: const TextStyle(
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
                        decoration: InputDecoration(
                          hintText: 'Search Department'.tr,
                          border: const OutlineInputBorder(),
                          suffixIcon: const Icon(Icons.search),
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
                      Expanded(
                        child: Center(
                          child: Text(
                            'Select Your Ticket Type'.tr,
                            style: const TextStyle(
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
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
