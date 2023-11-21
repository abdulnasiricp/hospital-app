// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison, file_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class IpdInvestigation extends StatefulWidget {
  const IpdInvestigation({Key? key}) : super(key: key);

  @override
  State<IpdInvestigation> createState() => _IpdInvestigationState();
}

class _IpdInvestigationState extends State<IpdInvestigation> {
  List<Widget> ipdOthertestRow = [];
  List<Widget> radiologyRow = [];
  List<Widget> medicineRow = [];
  List<String> selectedDiagnosisOptions = [];

  TextEditingController diagnosisController = TextEditingController();
  TextEditingController pathologyController = TextEditingController();
  TextEditingController pharmacyController = TextEditingController();
  TextEditingController radiologyController = TextEditingController();

//==========================================================================
  String selectedpathologyItemsId = '';
  String selectedpathologyItemsName = '';
  List<String> selectedpathologyItems = [];

  List<dynamic>? pathologydata = [];
  List<dynamic>? pathologyfilteredData = [];
bool isPathologyDataFetched = false; // Add this flag

  bool isLoading = true;
  Future<void> fetchpathologyData() async {
     if (isPathologyDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
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

        isPathologyDataFetched=true;

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
  bool isotherDataFetched = false; // Add this flag

  List<dynamic>? otherdata = [];
  List<dynamic>? otherfilteredData = [];

  Future<void> fetchotherData() async {
     if (isotherDataFetched) {
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
              element['name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

//=================================================================================

//=================================================================================

  List<dynamic>? radiologydata = [];
  List<dynamic>? radiologyfilteredData = [];
    bool isRadiologyDataFetched = false; // Add this flag

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
        isRadiologyDataFetched=true;

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
//=================================================================================
  TextEditingController DiagnosisController = TextEditingController();
  String selecteddiagnosisItemsId = '';
  String selecteddiagnosisItemsName = '';
  List<String> selecteddiagnosisItems = [];
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
        isDiagnosisDataFetched=true;

      });
    } else {
      handleNonJsonResponse();
    }
  }


   void DiagnosisfilterData(String query) {
    setState(() {
      diagnosisfilteredData = diagnosisdata
          ?.where((element) =>
              element['name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }
//=================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Diagnosis',
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
                  'Diagnosis',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Flexible(
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
                        controller: DiagnosisController,
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
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pathology',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width / 2.5,
                    height: 30,
                    color: Colors.green[300],
                    child: const Center(
                        child: Text(
                      'Pathology',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width / 2.5,
                    child: Flexible(
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
                    'Other Test',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width / 2,
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
                        width: width / 2.5,
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
                            readOnly:
                                true, // Set this to true to disable the keyboard
                            controller: otherController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select options',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              _showOtherSelection(context);
                            },
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 10,
                        // height: 40,
                        child: Center(
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  // Add a new row when the "Add" button is clicked
                                  // ipdOthertestRow.add(dragBuildRow());
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: ipdOthertestRow.isNotEmpty ? null : 0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ipdOthertestRow.length,
              itemBuilder: (context, index) {
                return ipdOthertestRow[index];
              },
            ),
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
                    width: width / 4,
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
                        readOnly:
                            true, // Set this to true to disable the keyboard
                        controller: radiologyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select options',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          _showRadiologySelection(context);
                        },
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
                        controller: diagnosisController,
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
                    width: width / 3,
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
                                // Add a new row when the "Add" button is clicked
                                radiologyRow.add(radiologyBuildRow());
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
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {},
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

  Widget dragBuildRow(
    TextEditingController othertestController,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 1.5,
            height: 50,
            child: Center(
              child: InkWell(
                  child: TextFormField(
                controller: othertestController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                readOnly: true, // Set this to true to disable the keyboard
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select options',
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
            width: width / 9,
            // height: 40,
            child: Center(
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        // Remove the row when the "Cancel" button is clicked
                        ipdOthertestRow.removeLast();
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
    );
  }

  Widget radiologyBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width / 4,
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
              readOnly: true, // Set this to true to disable the keyboard
              controller: radiologyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                _showRadiologySelection(context);
              },
            )),
          ),
        ),
        const SizedBox(
          width: 10,
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
              controller: diagnosisController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
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
          width: width / 3,
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

//==========================================================================================
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
                                                            data['test_name'] ==
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
  TextEditingController radiologySearchController = TextEditingController();
  String selectedradiology = '';
  String selectedradiologyId = '';

  void _showRadiologySelection(BuildContext context) {
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
                                              selectedradiology =
                                                  radiologyfilteredData?[index]
                                                          ['test_name'] ??
                                                      '';
                                              selectedradiology =
                                                  radiologyfilteredData?[index]
                                                          ['id'] ??
                                                      '';
                                              radiologyController.text =
                                                  '($selectedradiology) $selectedradiology';

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
    );
  }

  //=======================================================================================

  //=======================================================================================

  TextEditingController othersearchController = TextEditingController();
  String selectedotherdata = '';
  String selectedotherId = '';
  TextEditingController otherController = TextEditingController();

  void _showOtherSelection(BuildContext context) {
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
                                              '$itemNumber. ${otherfilteredData?[index]['name'] ?? ''}',
                                            ),
                                            onTap: () {
                                              selectedotherdata =
                                                  otherfilteredData?[index]
                                                          ['name'] ??
                                                      '';
                                              selectedotherId =
                                                  otherfilteredData?[index]
                                                          ['id'] ??
                                                      '';
                                              otherController.text =
                                                  '($selectedotherId) $selectedotherdata';

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
    );
  }
//==========================================================================================

//==========================================================================================

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
                                            diagnosisfilteredData?[index]
                                                    ['id'] ??
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
                                                DiagnosisController.text =
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
                      })
                ],
              ),
            );
          },
        );
      },
    );
  }

  void addNewRowOtherTest() {
    TextEditingController newOthertestController = TextEditingController();

    setState(() {
      ipdOthertestRow.add(dragBuildRow(newOthertestController));
    });
  }
}
