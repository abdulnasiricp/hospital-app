// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison, file_names, unused_local_variable, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_element

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Medication.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../../../utils/Api_Constant.dart';

class OpdInvestigation extends StatefulWidget {
  final String? opdID;
  final String? status;
  final String? employee_id;
  const OpdInvestigation({Key? key, this.opdID, this.status, this.employee_id})
      : super(key: key);
  @override
  State<OpdInvestigation> createState() => _OpdInvestigationState();
}

class _OpdInvestigationState extends State<OpdInvestigation> {
  List<Widget> opdOthertestRow = [];
  List<Widget> radiologyRow = [];
  List<Widget> surgeryRow = [];
  List<Widget> medicineRow = [];
  List<String> selectedDiagnosisOptions = [];

  TextEditingController diagnosisController = TextEditingController();
  TextEditingController pathologyController = TextEditingController();
  TextEditingController pharmacyController = TextEditingController();
  TextEditingController pharmacyDoseController = TextEditingController();
  TextEditingController pharmacyIntervalController = TextEditingController();
  TextEditingController pharmacyDurationController = TextEditingController();
  TextEditingController pharmacyRouteController = TextEditingController();
  TextEditingController pharmacyQtyController = TextEditingController();
  TextEditingController radiologyController = TextEditingController();
  TextEditingController followAdviceController = TextEditingController();

//==========================================================================
  String selectedpathologyItemsId = '';
  String selectedpathologyItemsName = '';
  List<String> selectedpathologyItems = [];

  List<dynamic>? pathologydata = [];
  List<dynamic>? pathologyfilteredData = [];

  bool isPathologyDataFetched = false; // Add this flag
  bool isLoading = false;
  Future<void> fetchpathologyData() async {
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "pathology"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        pathologydata = dataMap['result'];
        pathologyfilteredData = pathologydata;
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

  void pathologyfilterData(String query) {
    setState(() {
      pathologyfilteredData = pathologydata
          ?.where((element) =>
              element['test_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

//=================================================================================
  List<Map<String, TextEditingController>> surgeryControllersList = [];
  bool isSurgeryDataFetched = false;

  List<dynamic>? surgerydata = [];
  List<dynamic>? surgeryfilteredData = [];

  Future<void> fetchsurgeryData() async {
    if (isSurgeryDataFetched) {
      return;
    }

    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "radio"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        surgerydata = dataMap['result'];
        surgeryfilteredData = surgerydata;
        isLoading = false;

        isSurgeryDataFetched = true;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  void surgeryfilterData(String query) {
    setState(() {
      surgeryfilteredData = surgerydata
          ?.where((element) =>
              element['test_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  TextEditingController surgeryController = TextEditingController();
  // List<Widget> surgeryRows = [];
//=================================================================================
  bool isotherDataFetched = false; // Add this flag
  List<dynamic>? otherdata = [];
  List<dynamic>? otherfilteredData = [];

  Future<void> fetchotherData() async {
    if (isotherDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "radio"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        otherdata = dataMap['result'];
        otherfilteredData = otherdata;
        isLoading = false;

        isotherDataFetched = true; // Set the flag to true after fetching data
      });
    } else {
      handleNonJsonResponse();
    }
  }

  ////////////////////

  void otherfilterData(String query) {
    setState(() {
      otherfilteredData = otherdata
          ?.where((element) =>
              element['test_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

//=================================================================================
  bool ispharmacyDataFetched = false; // Add this flag

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

//================================================================================= Radiology
  bool isRadiologyDataFetched = false; // Add this flag
  String selectedradiology = '';
  String selectedradiologyId = '';
  List<dynamic>? radiologydata = [];
  List<dynamic>? radiologyfilteredData = [];

  Future<void> fetchRadiologyData() async {
    if (isRadiologyDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "radio"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        radiologydata = dataMap['result'];
        radiologyfilteredData = radiologydata;
        isLoading = false;
        isRadiologyDataFetched = true;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  //========================================

  void radiologyfilterData(String query) {
    setState(() {
      radiologyfilteredData = radiologydata
          ?.where((element) =>
              element['test_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

//================================================================================= for Diagnosis
  // TextEditingController DiagnosisController = TextEditingController();
  String selecteddiagnosisItemsId = '';
  String selecteddiagnosisItemsName = '';
  List<String> selecteddiagnosisItems = [];
  List<String> selecteddiagnosisItemsID = [];

  List<dynamic>? diagnosisdata = [];
  List<dynamic>? diagnosisfilteredData = [];

  bool isDiagnosisDataFetched = false; // Add this flag
  Future<void> fetchdiagnosisData() async {
    if (isDiagnosisDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "finding"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        diagnosisdata = dataMap['result'];
        diagnosisfilteredData = diagnosisdata;
        isLoading = false;
        isDiagnosisDataFetched = true;
      });
    } else {
      handleNonJsonResponse();
    }
  }

  void DiagnosisfilterData(String query) {
    setState(() {
      diagnosisfilteredData = diagnosisdata
          ?.where((element) =>
              element['name'].toLowerCase().contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

//=================================================================================post data to api

  TextEditingController radiologyQtyController = TextEditingController();
  TextEditingController radiologyNoteController = TextEditingController();
  TextEditingController surgeryNoteController = TextEditingController();

  Future<void> makePostRequest() async {
    final String mainSurgery = surgeryController.text;
    final String mainSurgeryNote = surgeryNoteController.text;
    final String otherTest = otherController.text;
    final String radiology = radiologyController.text;
    final String radiologyQty = radiologyQtyController.text;
    final String radiologyNote = radiologyNoteController.text;
    final String surgery = surgeryController.text;
    final String surgeryNote = surgeryNoteController.text;
    final String followAdvice= followAdviceController.text;
//-----------------------------------------------------------------------------othertest
    List<dynamic> additionalothertestRowsData = [];
    for (var otherControllerMap in otherControllersList) {
      String rowOthertest = otherControllerMap['otherTest']?.text ?? '';

      // Check if both fields in the row have data
      if (rowOthertest.isNotEmpty) {
        additionalothertestRowsData.add(
          rowOthertest,
        );
      }
    }
// //-----------------------------------------------------------------------------radiology
    List<dynamic> additionalRadiologyRowsData = [];

    for (var radiologyControllerMap in radiologyControllersList) {
      String rowRadiology = radiologyControllerMap['radiology']?.text ?? '';
      String rowRadiologyQty =
          radiologyControllerMap['radiologyQty']?.text ?? '';
      String rowRadiologyNote =
          radiologyControllerMap['radiologyNote']?.text ?? '';

      // Check if both fields in the row have data
      if (rowRadiology.isNotEmpty &&
          rowRadiologyQty.isNotEmpty &&
          rowRadiologyNote.isNotEmpty) {
        additionalRadiologyRowsData.add({rowRadiologyQty, rowRadiologyNote});
      }
    }
//-----------------------------------------------------------------------------surgery
    List<dynamic> additionalRowsData = [];

    for (var controllerMap in surgeryControllersList) {
      String rowSurgery = controllerMap['surgery']?.text ?? '';
      String rowNote = controllerMap['note']?.text ?? '';

      // Check if both fields in the row have data
      if (rowSurgery.isNotEmpty && rowNote.isNotEmpty) {
        additionalRowsData.add({
          
          rowNote,
        });
      }
    }

    Map<dynamic, dynamic> requestRadiologyList = {
      '0': selectedRadiologyIds,
      '1': {radiologyQty, radiologyNote, additionalRadiologyRowsData}
    };
    Map<dynamic, dynamic> requestSurgeryList = {
      '0': selectedSurgeryIds,
      '1': { surgeryNote, additionalRowsData}
    };

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_investigation';
    Map<String, dynamic> requestBody = {
      "table": "Visit_details",
      "opd_id": "${widget.opdID}",
      "generated_by": "${widget.employee_id}",
      "fields": {
        "status": "${widget.status}",
        "Diagnosis": "$selecteddiagnosisItemsId",
        "Pathology": "$selectedpathologyItemsId",
        "Other_Test": "$selectedOtherIds",
        "Radiology": "$requestRadiologyList",

        "Surgery": "$requestSurgeryList",
        "F_Advice": "$followAdvice",
      }
    };
    print('---------------+++++++++++-$requestBody');

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(requestBody),
      headers: ApiLinks.MainHeader,
    );
try{
    if (response.statusCode == 200) {
      // Successful response
      print('Response: ${response.body}');
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('Status: ${responseData["status"]}');
      print('Message: ${responseData["message"]}');
      print('ID: ${responseData["id"]}');
    setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OPD_Medication()),
          );
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
          title: const Text("Investigation"),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: isLoading
            ? Center(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.transparent,
                        child: const LoadingIndicatorWidget())),
              )
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diagnosis',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width / 2.2,
                        height: 30,
                        color: Colors.green[300],
                        child: const Center(
                            child: Text(
                          'Diagnosis',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width / 2.2,
                        child: InkWell(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            readOnly: true,
                            controller: diagnosisController,
                            maxLines: null, // Allow multiple lines
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 40,
                                ),
                                onPressed: () {
                                  _showdiagnosisSelection(context);
                                },
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Select Diagnosis',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              _showdiagnosisSelection(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pathology',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width / 2.2,
                        height: 30,
                        color: Colors.green[300],
                        child: const Center(
                            child: Text(
                          'Pathology',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width / 2.2,
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
                              controller: pathologyController,
                              maxLines: null, // Allow multiple lines
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _showPathologySelection(context);
                                  },
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'Select Pathology',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onTap: () {
                                _showPathologySelection(context);
                                (context);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Other Test',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.green[300],
                    child: const Center(
                        child: Text(
                      'Select Other Test',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width / 1.25,
                        height: 55,
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
                              controller: otherController,
                              maxLines: null,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _showOtherSelection(
                                        context, otherController);
                                  },
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'Select Other test',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onTap: () {
                                _showOtherSelection(context, otherController);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 9,
                        // height: 40,
                        child: Center(
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  addNewRowOtherTest();
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
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: opdOthertestRow.isNotEmpty ? null : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: opdOthertestRow.length,
                  itemBuilder: (context, index) {
                    return opdOthertestRow[index];
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Radiology',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          Text(
                            'Radiology',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          // SizedBox(width: 10,),
                          Text(
                            'Qty',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          // SizedBox(width: 10,),

                          Text(
                            'Radiology Note',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                    children: [
                      Container(
                        width: width / 3.2,
                        height: 55,
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
                              controller: radiologyController,
                              maxLines: null,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    _showRadiologySelection(
                                        context,
                                        radiologyController,
                                        radiologyQtyController,
                                        radiologyNoteController);
                                  },
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'Select radiology',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onTap: () {
                                _showRadiologySelection(
                                    context,
                                    radiologyController,
                                    radiologyQtyController,
                                    radiologyNoteController);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 6,
                        height: 60,
                        child: Center(
                          child: InkWell(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            controller: radiologyQtyController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select options',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 3.5,
                        height: 60,
                        child: Center(
                          child: InkWell(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            controller: radiologyNoteController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Additional note',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 9,
                        height: 40,
                        child: Center(
                          child: CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    addNewRowRadiology();
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: whitecolor,
                                )),
                            radius: 20,
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
                    height: radiologyRow.isNotEmpty ? null : 0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: radiologyRow.length,
                      itemBuilder: (context, index) {
                        return radiologyRow[index];
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Surgery',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          Text(
                            'Surgery advised',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          // SizedBox(width: 10,),
                          Text(
                            'Note for surgery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          // SizedBox(width: 10,),

                          Text(
                            ' ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width / 3.5,
                              height: 55,
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
                                    controller: surgeryController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_drop_down_sharp,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _showSurgerySelection(
                                              context,
                                              surgeryController,
                                              surgeryNoteController);
                                        },
                                      ),
                                      border: const OutlineInputBorder(),
                                      hintText: 'Select Surgery',
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                    onTap: () {
                                      _showSurgerySelection(
                                          context,
                                          surgeryController,
                                          surgeryNoteController);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width / 2,
                              height: 60,
                              child: Center(
                                child: TextFormField(
                                  controller: surgeryNoteController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Container(
                              width: width / 9,
                              child: Center(
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      addNewRow();
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: surgeryRow.isNotEmpty ? null : 0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: surgeryRow.length,
                      itemBuilder: (context, index) {
                        return surgeryRow[index];
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Follow up & Advice',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 50,
                          child: TextField(
                            controller: followAdviceController,
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        child: const Text('Save'),
                        onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await makePostRequest();

                                setState(() {
                                  isLoading = false;
                                });
                              },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(yellow),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  void selectDiagnosisOptions(BuildContext context) {
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
              {"name": " 1"},
              {"name": " 2"},
              {"name": " 3"},
              {"name": " 4"},
              {"name": " 5"},
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
                            'Select Options',
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: combinedData.length,
                      itemBuilder: (BuildContext context, int index) {
                        String item = combinedData[index]["name"];
                        bool isSelected =
                            selectedDiagnosisOptions.contains(item);

                        return Card(
                          color: isSelected
                              ? Colors.green
                              : Colors.white70.withOpacity(0.7),
                          child: ListTile(
                            title: Text(
                              '$item',
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedDiagnosisOptions.remove(item);
                                } else {
                                  selectedDiagnosisOptions.add(item);
                                }
                                diagnosisController.text =
                                    selectedDiagnosisOptions.join(', ');
                              });
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

//===============================================================================
  TextEditingController pathologySearchController = TextEditingController();
  String selectedPathology = '';
  String selectedPathologyId = '';

  void _showPathologySelection(BuildContext context) {
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
                        controller: pathologySearchController,
                        onChanged: (query) {
                          setState(() {
                            pathologyfilterData(query);
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
                    future: fetchpathologyData(),
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
                          : pathologyfilteredData!.isEmpty
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
                                    itemCount: pathologyfilteredData?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String itemName =
                                          pathologyfilteredData?[index]
                                                  ['test_name'] ??
                                              '';
                                      String itemId =
                                          pathologyfilteredData?[index]['id'] ??
                                              '';
                                      bool isSelected = selectedpathologyItems
                                          .contains(itemName);

                                      int itemNumber = index + 1;
                                      return Card(
                                          color: isSelected
                                              ? Colors.green
                                              : Colors.white70.withOpacity(0.7),
                                          child: ListTile(
                                            title: Text(
                                              '$itemNumber.$itemName',
                                              style: TextStyle(
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (isSelected) {
                                                  selectedpathologyItems
                                                      .remove(itemName);
                                                } else {
                                                  selectedpathologyItems
                                                      .add(itemName);
                                                }
                                                pathologyController.text =
                                                    selectedpathologyItems
                                                        .map((itemName) {
                                                  var itemData =
                                                      pathologyfilteredData
                                                          ?.firstWhere((data) =>
                                                              data[
                                                                  'test_name'] ==
                                                              itemName);
                                                  return '(${itemData['id']}).${itemName}';
                                                }).join(', ');

                                                // Update the selectedOtherItemsId based on selectedOtherItems
                                                selectedpathologyItemsId =
                                                    selectedpathologyItems
                                                        .map((itemName) =>
                                                            pathologyfilteredData
                                                                ?.firstWhere((data) =>
                                                                    data[
                                                                        'test_name'] ==
                                                                    itemName)['id'])
                                                        .join(',');

                                                // Update the selectedOtherItemsName based on selectedOtherItems
                                                selectedpathologyItemsName =
                                                    selectedpathologyItems
                                                        .join(', ');
                                              });
                                            },
                                          ));
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
    );
  }

//==========================================================================================
  TextEditingController radiologySearchController = TextEditingController();
  List<String> selectedRadiologyIds = [];
  void _showRadiologySelection(BuildContext context,TextEditingController radiologyController,TextEditingController radiologyQtyController,
      TextEditingController radiologyNoteController) {
    TextEditingController localradiologyController = TextEditingController();
    TextEditingController localradiologyQtyController = TextEditingController();
    TextEditingController localradiologyNoteController =TextEditingController();
    String localSelectedradiologydata = '';
    String localSelectedradiologyId = '';

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
                        controller: radiologySearchController,
                        onChanged: (query) {
                          setState(() {
                            radiologyfilterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: fetchRadiologyData(),
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
                            : radiologyfilteredData!.isEmpty
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
                                      itemCount: radiologyfilteredData?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        int itemNumber = index + 1;
                                        return Card(
                                          color:
                                              Colors.white70.withOpacity(0.7),
                                          child: ListTile(
                                            title: Text(
                                              '$itemNumber. ${radiologyfilteredData?[index]['test_name'] ?? ''}',
                                            ),
                                            onTap: () {
                                              localSelectedradiologydata =
                                                  radiologyfilteredData?[index]
                                                          ['test_name'] ??
                                                      '';
                                              localSelectedradiologyId =
                                                  radiologyfilteredData?[index]
                                                          ['id'] ??
                                                      '';

                                              selectedRadiologyIds.add(
                                                  localSelectedradiologyId);

                                              localradiologyController.text =
                                                  localSelectedradiologydata;

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                      })
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        radiologyController.text = localradiologyController.text;
        radiologyQtyController.text = localradiologyQtyController.text;
        radiologyNoteController.text = localradiologyNoteController.text;
      });
    });
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

  TextEditingController othersearchController = TextEditingController();
  String selectedotherdata = '';
  String selectedotherId = '';
  TextEditingController otherController = TextEditingController();
  String localSelectedotherdata = '';
  String localSelectedotherId = '';
  List<String> selectedOtherIds = [];
  void _showOtherSelection(
      BuildContext context, TextEditingController otherController) {
    TextEditingController localotherController = TextEditingController();

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
                        controller: othersearchController,
                        onChanged: (query) {
                          setState(() {
                            otherfilterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: fetchotherData(),
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
                            : otherfilteredData!.isEmpty
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
                                      itemCount: otherfilteredData?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        int itemNumber = index + 1;
                                        return Card(
                                          color:
                                              Colors.white70.withOpacity(0.7),
                                          child: ListTile(
                                            title: Text(
                                              // '$itemNumber. ${otherfilteredData?[index]['test_name'] ?? ''}',
                                              '${otherfilteredData?[index]['test_name'] ?? ''}',
                                            ),
                                            onTap: () {
                                              localSelectedotherdata =
                                                  otherfilteredData?[index]
                                                          ['test_name'] ??
                                                      '';
                                              localSelectedotherId =
                                                  otherfilteredData?[index]
                                                          ['id'] ??
                                                      '';
                                              selectedOtherIds
                                                  .add(localSelectedotherId);
                                              localotherController.text =
                                                  localSelectedotherdata;

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                      })
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        otherController.text = localotherController.text;
      });
    });
  }
//========================================================================================== for diagnosis

  TextEditingController diagnosissearchController = TextEditingController();
  String selecteddiagnosisdata = '';
  String selecteddiagnosisId = '';

  void _showdiagnosisSelection(BuildContext context) {
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
                        controller: diagnosissearchController,
                        onChanged: (query) {
                          setState(() {
                            DiagnosisfilterData(query);
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
                    future: fetchdiagnosisData(),
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
                          : diagnosisfilteredData!.isEmpty
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
                                    itemCount: diagnosisfilteredData?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String itemName =
                                          diagnosisfilteredData?[index]
                                                  ['name'] ??
                                              '';
                                      String itemId =
                                          diagnosisfilteredData?[index]['id'] ??
                                              '';
                                      bool isSelected = selecteddiagnosisItems
                                          .contains(itemName);

                                      int itemNumber = index + 1;
                                      return Card(
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.white70.withOpacity(0.7),
                                        child: ListTile(
                                          title: Text(
                                            '$itemNumber.$itemName',
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (isSelected) {
                                                selecteddiagnosisItems
                                                    .remove(itemName);
                                              } else {
                                                selecteddiagnosisItems
                                                    .add(itemName);
                                              }
                                              diagnosisController.text =
                                                  selecteddiagnosisItems
                                                      .map((itemName) {
                                                var itemData =
                                                    diagnosisfilteredData
                                                        ?.firstWhere((data) =>
                                                            data['name'] ==
                                                            itemName);
                                                return '(${itemData['id']}).${itemName}';
                                              }).join(', ');

                                              // Update the selectedOtherItemsId based on selectedOtherItems
                                              selecteddiagnosisItemsId =
                                                  selecteddiagnosisItems
                                                      .map((itemName) =>
                                                          diagnosisfilteredData
                                                              ?.firstWhere((data) =>
                                                                  data[
                                                                      'name'] ==
                                                                  itemName)['id'])
                                                      .join(',');

                                              // Update the selectedOtherItemsName based on selectedOtherItems
                                              selecteddiagnosisItemsName =
                                                  selecteddiagnosisItems
                                                      .join(', ');
                                            });
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
    );
  }
//==========================================================================================

  Widget observationBuildRow(TextEditingController otherController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 1.25,
              height: 55,
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
                    controller: otherController,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 40,
                        ),
                        onPressed: () {
                          _showOtherSelection(context, otherController);
                        },
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Select Other test',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onTap: () {
                      _showOtherSelection(context, otherController);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 9,
              child: Center(
                child: CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        opdOthertestRow.removeLast();
                      });
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: whitecolor,
                    ),
                  ),
                  radius: 20,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget radiologyBuildRow(
      TextEditingController radiologyController,
      TextEditingController radiologyQtyController,
      TextEditingController radiologyNoteController) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 3.2,
              height: 55,
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
                    controller: radiologyController,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 40,
                        ),
                        onPressed: () {
                          _showRadiologySelection(context, radiologyController,
                              radiologyQtyController, radiologyNoteController);
                        },
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Select radiology',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onTap: () {
                      _showRadiologySelection(context, radiologyController,
                          radiologyQtyController, radiologyNoteController);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
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
              controller: radiologyQtyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 3.5,
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
              controller: radiologyNoteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Additional note',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
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
                      radiologyRow.removeLast();
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
    );
  }

//---------------------------------------------------------------------------Other Test
  List<Map<String, TextEditingController>> otherControllersList = [];
  void addNewRowOtherTest() {
    TextEditingController newotherController = TextEditingController();

    Map<String, TextEditingController> newControllersMap = {
      'otherTest': newotherController,
    };

    setState(() {
      opdOthertestRow.add(observationBuildRow(
        newotherController,
      ));
      otherControllersList.add(newControllersMap);
    });
  }
//---------------------------------------------------------------------------pharmacy

//---------------------------------------------------------------------------Radiology

  List<Map<String, TextEditingController>> radiologyControllersList = [];

  void addNewRowRadiology() {
    TextEditingController newradiologyController = TextEditingController();
    TextEditingController newradiologyQtyController = TextEditingController();
    TextEditingController newradiologyNoteController = TextEditingController();

    Map<String, TextEditingController> newRadiologyControllersMap = {
      'radiology': newradiologyController,
      'radiologyQty': newradiologyQtyController,
      'radiologyNote': newradiologyNoteController,
    };

    setState(() {
      radiologyRow.add(radiologyBuildRow(
        newradiologyController,
        newradiologyQtyController,
        newradiologyNoteController,
      ));
      radiologyControllersList.add(newRadiologyControllersMap);
    });
  }
//---------------------------------------------------------------------------Surgery

  Widget surgeryBuildRow(TextEditingController surgeryController,
      TextEditingController surgeryNoteController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 3.5,
                height: 55,
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
                      controller: surgeryController,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                          ),
                          onPressed: () {
                            _showSurgerySelection(context, surgeryController,
                                surgeryNoteController);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Select Other test',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        _showSurgerySelection(
                            context, surgeryController, surgeryNoteController);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 2,
                height: 55,
                child: Center(
                  child: TextFormField(
                    controller: surgeryNoteController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 9,
                child: Center(
                  child: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          surgeryRow.removeLast();
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: whitecolor,
                      ),
                    ),
                    radius: 20,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextEditingController surgerysearchController = TextEditingController();
  List<String> selectedSurgeryIds = [];
  void _showSurgerySelection(
      BuildContext context,
      TextEditingController surgeryController,
      TextEditingController surgeryNoteController) {
    TextEditingController localSurgeryController = TextEditingController();
    TextEditingController localNoteController = TextEditingController();
    String localSelectedsurgerydata = '';
    String localSelectedsurgeryId = '';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
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
                        controller: surgerysearchController,
                        onChanged: (query) {
                          setState(() {
                            surgeryfilterData(query);
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
                    future: fetchsurgeryData(),
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
                          : surgeryfilteredData!.isEmpty
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
                                    itemCount: surgeryfilteredData?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int itemNumber = index + 1;
                                      return Card(
                                        color: Colors.white70.withOpacity(0.7),
                                        child: ListTile(
                                          title: Text(
                                            '$itemNumber. ${surgeryfilteredData?[index]['test_name'] ?? ''}',
                                          ),
                                          onTap: () {
                                            localSelectedsurgerydata =
                                                surgeryfilteredData?[index]
                                                        ['test_name'] ??
                                                    '';
                                            localSelectedsurgeryId =
                                                surgeryfilteredData?[index]
                                                        ['id'] ??
                                                    '';
                                                    
                                              selectedSurgeryIds.add(
                                                  localSelectedsurgeryId);

                                              localSurgeryController.text =
                                                  localSelectedsurgerydata;

                                           

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
        surgeryController.text = localSurgeryController.text;
        surgeryNoteController.text = localNoteController.text;
      });
    });
  }

  void addNewRow() {
    TextEditingController newSurgeryController = TextEditingController();
    TextEditingController newNoteController = TextEditingController();

    Map<String, TextEditingController> newControllersMap = {
      'surgery': newSurgeryController,
      'note': newNoteController,
    };

    setState(() {
      surgeryRow.add(surgeryBuildRow(newSurgeryController, newNoteController));
      surgeryControllersList.add(newControllersMap);
    });
  }
}
