// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison, file_names, unused_local_variable, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class OpdInvestigation extends StatefulWidget {
  const OpdInvestigation({Key? key}) : super(key: key);

  @override
  State<OpdInvestigation> createState() => _OpdInvestigationState();
}

class _OpdInvestigationState extends State<OpdInvestigation> {
  List<String> selectedDiagnosisOptions = [];
  TextEditingController diagnosisController = TextEditingController();
  List<Widget> opdOthertestRow = [];
  List<Widget> radiologyRow = [];
  List<Widget> surgeryRow = [];
  List<Widget> medicineRow = [];
  @override
  void initState() {
    super.initState();
    fetchotherData();
  }

  //=================================================================================for diagnosis
  TextEditingController DiagnosisController = TextEditingController();
  String selectedOtherItemsId = '';
  String selectedOtherItemsName = '';
  List<String> selectedOtherItems = [];
  List<dynamic>? otherdata = [];
  List<dynamic>? otherfilteredData = [];

  Future<void> fetchotherData() async {
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
      });
    } else {
      handleNonJsonResponse();
    }
  }

  bool isLoading = true;
  void handleNonJsonResponse() {
    print('Non-JSON response or API error');
    setState(() {
      isLoading = false;
    });
  }
  ////////////////////

  void otherfilterData(String query) {
    setState(() {
      otherfilteredData = otherdata
          ?.where((element) =>
              element['name'].toLowerCase().contains(query.toLowerCase()) ||
              element['id'].toLowerCase().contains(query.toLowerCase()))
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
          Row(
            children: [
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
                    width: width / 2.2,
                    height: 30,
                    color: Colors.green[300],
                    child: const Center(
                        child: Text(
                      'Diagnosis',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width / 2.2,
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
                        controller: DiagnosisController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 40,
                            ),
                            onPressed: () {
                              _showOtherSelection(context);
                            },
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Select Diagnosis',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          _showOtherSelection(context);
                        },
                      )),
                    ),
                  ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width / 2.2,
                    height: 30,
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
                        // Set this to true to disable the keyboard
                        controller: diagnosisController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select options',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          selectDiagnosisOptions(context);
                        },
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
                    width: width / 1.1,
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
                        width: width / 1.3,
                        height: 30,
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
                            // Set this to true to disable the keyboard
                            controller: diagnosisController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select options',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              selectDiagnosisOptions(context);
                            },
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
                                  // Add a new row when the "Add" button is clicked
                                  opdOthertestRow.add(observationBuildRow());
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
                    height: 30,
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
                        // Set this to true to disable the keyboard
                        controller: diagnosisController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select options',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          selectDiagnosisOptions(context);
                        },
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width / 6,
                    height: 30,
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
                        // Set this to true to disable the keyboard
                        controller: diagnosisController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select options',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          selectDiagnosisOptions(context);
                        },
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width / 3.5,
                    height: 30,
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
                    // height: 40,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          Text(
                            'Note for surgery',
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
                        width: width / 3,
                        height: 30,
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
                            // Set this to true to disable the keyboard
                            controller: diagnosisController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select options',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              selectDiagnosisOptions(context);
                            },
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: width / 2.2,
                        height: 30,
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
                        // height: 40,
                        child: Center(
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  // Add a new row when the "Add" button is clicked
                                  surgeryRow.add(surgeryBuildRow());
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
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.green[300],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Medicine',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
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
                    children: [
                      Container(
                        width: width / 7,
                        height: 30,
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
                            // Set this to true to disable the keyboard
                            controller: diagnosisController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select options',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onTap: () {
                              selectDiagnosisOptions(context);
                            },
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: width / 8,
                        height: 30,
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
                        width: 2,
                      ),
                      Container(
                        width: width / 8,
                        height: 30,
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
                        width: 2,
                      ),
                      Container(
                        width: width / 8,
                        height: 30,
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
                        width: 2,
                      ),
                      Container(
                        width: width / 8,
                        height: 30,
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
                        width: 2,
                      ),
                      Container(
                        width: width / 8,
                        height: 30,
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
                        // height: 40,
                        child: Center(
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  // Add a new row when the "Add" button is clicked
                                  medicineRow.add(medicineBuildRow());
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Follow up & Advice',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 50,
                      child: const TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
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

  Widget observationBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      children: [
        Container(
          width: width / 1.3,
          height: 30,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
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
                      opdOthertestRow.removeLast();
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

  ///////////////////////////////////////////////////////

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
                                itemBuilder: (BuildContext context, int index) {
                                  String itemName =
                                      otherfilteredData?[index]['name'] ?? '';
                                  String itemId =
                                      otherfilteredData?[index]['id'] ?? '';
                                  bool isSelected =
                                      selectedOtherItems.contains(itemName);

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
                                            selectedOtherItems.remove(itemName);
                                          } else {
                                            selectedOtherItems.add(itemName);
                                          }
                                          DiagnosisController.text =
                                              selectedOtherItems.join(', ');

                                          // Update the selectedOtherItemsId based on selectedOtherItems
                                          selectedOtherItemsId =
                                              selectedOtherItems
                                                  .map((itemName) =>
                                                      otherfilteredData
                                                          ?.firstWhere((data) =>
                                                              data['name'] ==
                                                              itemName)['id'])
                                                  .join(',');

                                          // Update the selectedOtherItemsName based on selectedOtherItems
                                          selectedOtherItemsName =
                                              selectedOtherItems.join(', ');
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
//==========================================================================================

  ///////////////////////////////////////

  Widget radiologyBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      children: [
        Container(
          width: width / 3.2,
          height: 30,
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
              // Set this to true to disable the keyboard
              controller: diagnosisController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                selectDiagnosisOptions(context);
              },
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 6,
          height: 30,
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
              // Set this to true to disable the keyboard
              controller: diagnosisController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                selectDiagnosisOptions(context);
              },
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 3.5,
          height: 30,
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

  Widget surgeryBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      children: [
        Container(
          width: width / 3,
          height: 30,
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
              // Set this to true to disable the keyboard
              controller: diagnosisController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                selectDiagnosisOptions(context);
              },
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 2.2,
          height: 30,
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
                      surgeryRow.removeLast();
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

  Widget medicineBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      children: [
        Container(
          width: width / 7,
          height: 30,
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
              // Set this to true to disable the keyboard
              controller: diagnosisController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select options',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                selectDiagnosisOptions(context);
              },
            )),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: width / 8,
          height: 30,
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
          width: 2,
        ),
        Container(
          width: width / 8,
          height: 30,
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
          width: 2,
        ),
        Container(
          width: width / 8,
          height: 30,
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
          width: 2,
        ),
        Container(
          width: width / 8,
          height: 30,
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
          width: 2,
        ),
        Container(
          width: width / 8,
          height: 30,
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
    );
  }
}
