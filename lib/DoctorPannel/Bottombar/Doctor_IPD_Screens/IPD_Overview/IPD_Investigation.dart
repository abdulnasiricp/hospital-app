// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison, file_names, unused_local_variable

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

  @override
  void initState() {
    super.initState();
    fetchDepartmentData();
    fetchotherData();
    fetchRadiologyData();


  }


  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];

  bool isLoading = true;
  Future<void> fetchDepartmentData() async {
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body =  {
      "table":"pathology"

    };

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );


    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        data = dataMap['result'];
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
      element['test_name'].toLowerCase().contains(query.toLowerCase()) ||
          element['id'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
//=================================================================================

  List<dynamic>? otherdata = [];
  List<dynamic>? otherfilteredData = [];

  Future<void> fetchotherData() async {
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body =  {
      "table":"finding"

    };

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
//=================================================================================

  List<dynamic>? radiologydata = [];
  List<dynamic>? radiologyfilteredData = [];

  Future<void> fetchRadiologyData() async {
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body =  {
      "table":"radio"

    };

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
      });
    } else {
      handleNonJsonResponse();
    }
  }


  ////////////////////

  void radiologyfilterData(String query) {
    setState(() {
      radiologyfilteredData = radiologydata
          ?.where((element) =>
      element['test_name'].toLowerCase().contains(query.toLowerCase()) ||
          element['id'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  List<Widget> othertestrows = [];
  List<Widget> radiologyrows = [];

  List<String> selectedDiagnosisOptions = [];
  TextEditingController diagnosisController = TextEditingController();

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
                height: 30,
                width: double.infinity,
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
                        readOnly:
                            true, // Set this to true to disable the keyboard
                        controller: departmentController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select options',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onTap: () {
                          _showDepartmentSelection(context);
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
                      SizedBox(
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
                                  othertestrows.add(dragBuildRow());
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

            height: othertestrows.isNotEmpty ? null : 0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemCount: othertestrows.length,
              itemBuilder: (context, index) {
                return othertestrows[index];
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
                        readOnly:
                            true, // Set this to true to disable the keyboard
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
                        readOnly:
                            true, // Set this to true to disable the keyboard
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
                  SizedBox(width: 5,),
                  Container(
                    width: width / 9,
                    height: 40,
                    child: Center(
                      child: CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                // Add a new row when the "Add" button is clicked
                                radiologyrows.add(radiologyBuildRow());
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
              SizedBox(height: 5,),
              Container(

                height: radiologyrows.isNotEmpty ? null : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: radiologyrows.length,
                  itemBuilder: (context, index) {
                    return radiologyrows[index];
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

  Widget dragBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 1.5,
            height: 40,
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
          SizedBox(
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
                        othertestrows.removeLast();
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


  Widget
  radiologyBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 4,
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
                    readOnly:
                    true, // Set this to true to disable the keyboard
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
            width: 10,
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
                    readOnly:
                    true, // Set this to true to disable the keyboard
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
          SizedBox(
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
                        radiologyrows.removeLast();
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



  TextEditingController departmentSearchController = TextEditingController();
  String selectedDepartment = '';
  String selectedDepartmentId = '';
  TextEditingController departmentController = TextEditingController();


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
                        controller: departmentSearchController,
                        onChanged: (query) {
                          setState(() {
                            filterData(query);
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
                              '$itemNumber. ${filteredData?[index]['test_name'] ?? ''}',
                            ),
                            onTap: () {
                              selectedDepartment =
                                  filteredData?[index]['test_name'] ?? '';
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
//==========================================================================================
  TextEditingController radiologySearchController = TextEditingController();
  String selectedradiology = '';
  String selectedradiologyId = '';
  TextEditingController radiologyController = TextEditingController();


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
                      itemBuilder: (BuildContext context, int index) {
                        int itemNumber = index + 1;
                        return Card(
                          color: Colors.white70.withOpacity(0.7),
                          child: ListTile(
                            title: Text(
                              '$itemNumber. ${radiologyfilteredData?[index]['test_name'] ?? ''}',
                            ),
                            onTap: () {
                              selectedradiology =
                                  radiologyfilteredData?[index]['test_name'] ?? '';
                              selectedradiologyId =
                                  radiologyfilteredData?[index]['id'] ?? '';
                              radiologyController.text =
                              '($selectedradiologyId) $selectedradiology';

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
                        int itemNumber = index + 1;
                        return Card(
                          color: Colors.white70.withOpacity(0.7),
                          child: ListTile(
                            title: Text(
                              '$itemNumber. ${otherfilteredData?[index]['name'] ?? ''}',
                            ),
                            onTap: () {
                              selectedotherdata =
                                  otherfilteredData?[index]['name'] ?? '';
                              selectedotherId =
                                  otherfilteredData?[index]['id'] ?? '';
                              otherController.text =
                              '($selectedotherId) $selectedotherdata';

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
//==========================================================================================



}
