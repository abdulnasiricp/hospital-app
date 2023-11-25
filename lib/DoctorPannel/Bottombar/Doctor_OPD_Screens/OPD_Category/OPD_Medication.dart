// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison, file_names, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../../../utils/Api_Constant.dart';

class OPD_Medication extends StatefulWidget {
  final String? opdID;
  final String? status;
  final String? employee_id;
  const OPD_Medication({Key? key, this.opdID, this.status, this.employee_id})
      : super(key: key);
  @override
  State<OPD_Medication> createState() => _OpdInvestigationState();
}

class _OpdInvestigationState extends State<OPD_Medication> {
  List<Widget> medicineRow = [];
  TextEditingController pharmacyController = TextEditingController();
  TextEditingController pharmacyDoseController = TextEditingController();
  TextEditingController pharmacyIntervalController = TextEditingController();
  TextEditingController pharmacyDurationController = TextEditingController();
  TextEditingController pharmacyRouteController = TextEditingController();
  TextEditingController pharmacyQtyController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Step 1: Add a listener to pharmacyController
    pharmacyController.addListener(() {
      // Step 2: When the text changes, create a new row
      addNewRowPharmacy();
    });
  }

//=================================================================================
  bool ispharmacyDataFetched = false; // Add this flag
  bool isLoading = false; // Add this flag

  List<dynamic>? pharmacydata = [];
  List<dynamic>? pharmacyfilteredData = [];
  Future<void> fetchPharmacyData() async {
    if (ispharmacyDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "pharmacy"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        pharmacydata = dataMap['result'];
        pharmacyfilteredData = pharmacydata;
        isLoading = false;
        // ispharmacyDataFetched = true;
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

  void pharmacyfilterData(String query) {
    setState(() {
      pharmacyfilteredData = pharmacydata
          ?.where((element) =>
              element['medicine_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> makePostRequest() async {
    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';
    Map<String, dynamic> requestBody = {
      // "table": "Visit_details",
      "opd_id": "${widget.opdID}",
      "generated_by": "${widget.employee_id}",
      "fields": {
        "status": "${widget.status}",
      }
    };
    print('---------------+++++++++++-$requestBody');
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestBody),
        headers: ApiLinks.MainHeader,
      );

      if (response.statusCode == 200) {
        // Successful response
        print('Response: ${response.body}');
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Status: ${responseData["staus"]}');
        print('Message: ${responseData["message"]}');
        print('ID: ${responseData["id"]}');
        setState(() {
          Fluttertoast.showToast(
            msg: '${responseData["message"]}',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        });
      } else {
        setState(() {
          Fluttertoast.showToast(
            msg: '${response.reasonPhrase}',
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        });
      }
    } catch (e) {
      setState(() {
        Fluttertoast.showToast(
          msg: '$e',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }
  }

//=================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medicine',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: width / 1.3,
                      child: Center(
                        child: InkWell(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            readOnly: true,
                            controller: pharmacyController,
                            maxLines: null, // Allow multiple lines
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 30,
                                ),
                                onPressed: () {
                                  _showPharmacySelection(
                                    context,
                                    pharmacyController,
                                    pharmacyDoseController,
                                    pharmacyIntervalController,
                                    pharmacyDurationController,
                                    pharmacyRouteController,
                                    pharmacyQtyController,
                                  );
                                },
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Select Medicine',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              _showPharmacySelection(
                                context,
                                pharmacyController,
                                pharmacyDoseController,
                                pharmacyIntervalController,
                                pharmacyDurationController,
                                pharmacyRouteController,
                                pharmacyQtyController,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width / 5.5,
                      child: Center(
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                addNewRowPharmacy();
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: whitecolor,
                            ),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.green[300],
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Dose',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Interval',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Duration',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Route',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Qty',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '4 tab',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Twice a day ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '4 days',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' oral',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' 12 pc',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: medicineRow.isNotEmpty ? null : 0,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: medicineRow.length,
                itemBuilder: (context, index) {
                  return medicineRow[index];
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    makePostRequest();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(yellow),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  //=======================================================================================
  TextEditingController pharmacySearchController = TextEditingController();
  String selectedpharmacy = '';
  String selectedpharmacyId = '';

  void _showPharmacySelection(
      BuildContext context,
      TextEditingController pharmacyController,
      TextEditingController pharmacyDoseController,
      TextEditingController pharmacyIntervalController,
      TextEditingController pharmacyDurationController,
      TextEditingController pharmacyRouteController,
      TextEditingController pharmacyQtyController) {
    TextEditingController localpharmacyController = TextEditingController();
    TextEditingController localpharmacyDoseController = TextEditingController();
    TextEditingController localpharmacyIntervalController =
        TextEditingController();
    TextEditingController localpharmacyDurationController =
        TextEditingController();
    TextEditingController localpharmacyRouteController =
        TextEditingController();
    TextEditingController localpharmacyQtyController = TextEditingController();
    String localSelectedpharmacydata = '';
    String localSelectedpharmacyId = '';

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
                            'Select Data',
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
                        controller: pharmacySearchController,
                        onChanged: (query) {
                          setState(() {
                            pharmacyfilterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Search here...',
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: fetchPharmacyData(),
                    builder: (context, snapshot) {
                      return isLoading
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
                          : pharmacyfilteredData!.isEmpty
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
                                    itemCount: pharmacyfilteredData?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int itemNumber = index + 1;
                                      return Card(
                                        color: Colors.white70.withOpacity(0.7),
                                        child: ListTile(
                                          title: Text(
                                            '$itemNumber. ${pharmacyfilteredData?[index]['medicine_name'] ?? ''}',
                                          ),
                                          onTap: () {
                                            localSelectedpharmacydata =
                                                pharmacyfilteredData?[index]
                                                        ['medicine_name'] ??
                                                    '';
                                            localSelectedpharmacyId =
                                                pharmacyfilteredData?[index]
                                                        ['id'] ??
                                                    '';

                                            localpharmacyController.text =
                                                '($localSelectedpharmacyId) $localSelectedpharmacydata';

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        pharmacyController.text = localpharmacyController.text;
        pharmacyDoseController.text = localpharmacyDoseController.text;
        pharmacyIntervalController.text = localpharmacyIntervalController.text;
        pharmacyDurationController.text = localpharmacyDurationController.text;
        pharmacyRouteController.text = localpharmacyRouteController.text;
        pharmacyQtyController.text = localpharmacyQtyController.text;
      });
    });
  }

  //=======================================================================================

////////////////////////////////////////////////////////////////////////////
  Widget medicineBuildRow(TextEditingController pharmacyController) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            width: width,
            child: Center(
              child: InkWell(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  readOnly: true,
                  controller: pharmacyController,
                  maxLines: null, // Allow multiple lines
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                      ),
                      onPressed: () {
                        _showPharmacySelection(
                          context,
                          pharmacyController,
                          pharmacyDoseController,
                          pharmacyIntervalController,
                          pharmacyDurationController,
                          pharmacyRouteController,
                          pharmacyQtyController,
                        );
                      },
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Select Medicine',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onTap: () {
                    _showPharmacySelection(
                      context,
                      pharmacyController,
                      pharmacyDoseController,
                      pharmacyIntervalController,
                      pharmacyDurationController,
                      pharmacyRouteController,
                      pharmacyQtyController,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' 4 tab',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Twice a day ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '4 days ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'oral ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: width / 6,
                      height: 50,
                      child: Center(
                        child: InkWell(
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          // Set this to true to disable the keyboard
                          // controller: diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '12 pc',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: width / 9,
                      // height: 40,
                      child: Center(
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  // Remove the row when the "Cancel" button is clicked
                                  medicineRow.removeLast();
                                });
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: whitecolor,
                              )),
                          // radius: 17,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//////////////////////////////////////////////////////////////////////
  List<Map<String, TextEditingController>> pharmacyControllersList = [];

  void addNewRowPharmacy() {
    TextEditingController newpharmacyController = TextEditingController();

    Map<String, TextEditingController> newpharmacyControllersMap = {
      'pharmacy': newpharmacyController,
    };

    setState(() {
      medicineRow.add(medicineBuildRow(
        newpharmacyController,
      ));
      pharmacyControllersList.add(newpharmacyControllersMap);
    });
  }
////////////////////////////////////////////////////////////////////////
}
