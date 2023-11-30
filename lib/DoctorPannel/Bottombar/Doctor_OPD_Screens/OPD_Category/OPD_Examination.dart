// ignore_for_file: sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_local_variable, file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_investigation.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OpdExamination extends StatefulWidget {
  final String? opdVisitDetailsID;
  final String? status;
  final String? patient_id;
  final String? case_reference_id;
  final String? generated_by;
  final String? employee_id;
  const OpdExamination(
      {Key? key,
      this.opdVisitDetailsID,
      this.case_reference_id,
      this.patient_id,
      this.status,
      this.generated_by,
      this.employee_id})
      : super(key: key);

  @override
  State<OpdExamination> createState() => _OpdExaminationState();
}

class _OpdExaminationState extends State<OpdExamination> {
  TextEditingController systemRespiratoryController = TextEditingController();
  TextEditingController systemCardiovascularController =
      TextEditingController();
  TextEditingController systemAbdominalController = TextEditingController();
  TextEditingController systemGenitourinaryController = TextEditingController();
  TextEditingController systemCNSController = TextEditingController();
  TextEditingController systemLocalController = TextEditingController();
  bool isLoading = false;

  Future<void> makePostRequest() async {
////////////////////////////////////////////// merged
    List<String> mergedRespiratoryt = List.from(systematicCardText1)
      ..addAll([systemRespiratoryController.text]);
    List<String> mergedCardiovascular = List.from(systematicCardText2)
      ..addAll([systemCardiovascularController.text]);
    List<String> mergedAbdominal = List.from(systematicCardText3)
      ..addAll([systemAbdominalController.text]);
    List<String> mergedgenitourinary = List.from(systematicCardText4)
      ..addAll([systemGenitourinaryController.text]);
    List<String> mergedCNS = List.from(systematicCardText5)
      ..addAll([systemCNSController.text]);
    List<String> mergedLocal = List.from(systematicCardText6)
      ..addAll([systemLocalController.text]);

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';
    int currentStatus = int.parse(widget.status ?? "0");
    int newStatus = currentStatus;
    Map<String, dynamic> requestBody = {
      "table": "ipd_prescription_basic",
      "fields": {
        "visit_details_id": "${widget.opdVisitDetailsID}",
        "systemRespiratory": mergedRespiratoryt,
        "systemCardiovascular": mergedCardiovascular,
        "systemAbdominal": mergedAbdominal,
        "systemGenitourinary": mergedgenitourinary,
        "systemCNS": mergedCNS, /////// centran n s

        "systemLocal": mergedLocal,
        "general_examination":
            "$generalCardText", // Add the selected options from SelectableCard
        "staus": newStatus,
        "prescribe_by": id,
        "generated_by": id,
        "is_opd": "1",
        "patient_id": "${widget.patient_id}",
        "case_reference_id": "${widget.case_reference_id}",
      }
    };
    print(
        "cfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfg===========================$requestBody");
    // try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(requestBody),
      headers: ApiLinks.MainHeader,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('responseData: $responseData');
      print('Status: ${responseData["staus"]}');
      print('Message: ${responseData["message"]}');
      print('id: ${responseData["id"]}');

      // if (responseData["staus"] == 1) {
      // Status is 1, navigate to OpdInvestigation
      setState(() {
        // Show success message and navigate to the next screen if needed
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OpdInvestigation(
                    opdID: widget.opdVisitDetailsID,
                    status: widget.status,
                    generated_by: id,
                    employee_id: widget.employee_id,
                  )),
        );
        Fluttertoast.showToast(
          msg: '${responseData["message"]}',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      });
      // } else if (responseData["staus"] == 0) {
      //   // Status is 0, handle it as a special case
      //   setState(() {
      //     Fluttertoast.showToast(
      //       msg: 'Status is 0: ${responseData["message"]}',
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //     );
      //   });
    } else {
      // Handle other status codes (non-200) if needed
      setState(() {
        Fluttertoast.showToast(
          msg: 'Error: ${response.reasonPhrase}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }
    // } catch (e) {
    //   setState(() {
    //     Fluttertoast.showToast(
    //       msg: '$e',
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //     );
    //   });
    // }
  }

  List<String> generalCard = [
    "Pallors",
    "lcterus",
    "Cyanosis",
    "Clubbing",
    "Lymphadeno",
    "Oedema",
    "Dehydration"
  ];
  List<String> generalCardText = [];
  List<String> systematicCard = [
    "Respiratory",
    "Cardiovascular",
    "Abdominal",
    "genitourinary",
    "CNS",
    "Local"
  ];

  List<TextEditingController> systematicCardControllers = [];
  List<String> systematicCardText1 = [];
  List<String> systematicCardText2 = [];
  List<String> systematicCardText3 = [];
  List<String> systematicCardText4 = [];
  List<String> systematicCardText5 = [];
  List<String> systematicCardText6 = [];
  String id = '';
  Future<void> loadDoctorData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      id = sp.getString('id') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    loadDoctorData();
    // Initialize TextEditingControllers for each item in systematicCard
    for (int i = 0; i < systematicCard.length; i++) {
      systematicCardControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose of TextEditingControllers to avoid memory leaks
    for (var controller in systematicCardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Examination"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      backgroundColor: Colors.blue[50],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'General Examination',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: height / 3.5,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemCount: generalCard.length,
                        itemBuilder: (context, index) {
                          return SelectableCard(
                            text: generalCard[index],
                            isSelected:
                                generalCardText.contains(generalCard[index]),
                            onSelect: () {
                              setState(() {
                                if (generalCardText
                                    .contains(generalCard[index])) {
                                  generalCardText.remove(generalCard[index]);
                                } else {
                                  generalCardText.add(generalCard[index]);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      child: const Text(
                        'Systematic Examination',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Replacing Card with SelectableCard for each row
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'Respiratory',
                            isSelected:
                                systematicCardText1.contains('Respiratory'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText1
                                    .contains('Respiratory')) {
                                  systematicCardText1.remove('Respiratory');
                                } else {
                                  systematicCardText1.add('Respiratory');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemRespiratoryController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'Cardiovascular',
                            isSelected:
                                systematicCardText2.contains('Cardiovascular'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText2
                                    .contains('Cardiovascular')) {
                                  systematicCardText2.remove('Cardiovascular');
                                } else {
                                  systematicCardText2.add('Cardiovascular');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemCardiovascularController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ///////////////////////////////////////
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'Abdominal',
                            isSelected:
                                systematicCardText3.contains('Abdominal'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText3.contains('Abdominal')) {
                                  systematicCardText3.remove('Abdominal');
                                } else {
                                  systematicCardText3.add('Abdominal');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemAbdominalController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 10), ///////////////////////////////////////
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'Genitourinary',
                            isSelected:
                                systematicCardText4.contains('Genitourinary'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText4
                                    .contains('Genitourinary')) {
                                  systematicCardText4.remove('Genitourinary');
                                } else {
                                  systematicCardText4.add('Genitourinary');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemGenitourinaryController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), ////////////////////////////
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'CNS',
                            isSelected: systematicCardText5.contains('CNS'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText5.contains('CNS')) {
                                  systematicCardText5.remove('CNS');
                                } else {
                                  systematicCardText5.add('CNS');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemCNSController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 10), ////////////////////////////////////
                    Row(
                      children: [
                        Container(
                          height: height / 10,
                          width: 100,
                          child: SelectableCard(
                            text: 'Local',
                            isSelected: systematicCardText6.contains('Local'),
                            onSelect: () {
                              setState(() {
                                if (systematicCardText6.contains('Local')) {
                                  systematicCardText6.remove('Local');
                                } else {
                                  systematicCardText6.add('Local');
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: width / 1.5,
                          child: TextFormField(
                            controller: systemLocalController,
                            maxLines: null,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write something',
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), ///////////////////////
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
              ),
            ),
    );
  }
}

class SelectableCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onSelect;

  const SelectableCard(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect();
      },
      child: SizedBox(
        height: 30,
        child: Card(
          color: isSelected ? darkYellow : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
