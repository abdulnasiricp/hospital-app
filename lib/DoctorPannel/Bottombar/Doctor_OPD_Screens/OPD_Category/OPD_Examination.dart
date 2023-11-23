// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_investigation.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class OpdExamination extends StatefulWidget {
  final String? opdVisitDetailsID;
  const OpdExamination({Key? key, this.opdVisitDetailsID}) : super(key: key);

  @override
  State<OpdExamination> createState() => _OpdExaminationState();
}

class _OpdExaminationState extends State<OpdExamination> {
  TextEditingController systemRespiratoryController = TextEditingController();
  TextEditingController systemCardiovascularController =TextEditingController();
  TextEditingController systemAbdominalController = TextEditingController();
  TextEditingController systemGenitourinaryController = TextEditingController();
  TextEditingController systemCNSController = TextEditingController();
  TextEditingController systemLocalController = TextEditingController();
  bool isLoading = false;


  Future<void> makePostRequest() async {
    final String systemRespiratory = systemRespiratoryController.text;
    final String systemCardiovascular = systemCardiovascularController.text;
    final String systemAbdominal = systemAbdominalController.text;
    final String systemGenitourinary = systemGenitourinaryController.text;
    final String systemCNS = systemCNSController.text;
    final String systemLocal = systemLocalController.text;

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

    Map<String, dynamic> requestBody = {
      "table": "Opd_Examination",
      "fields": {
        "opd_VisitDetails_id": "${widget.opdVisitDetailsID}",
        "systemRespiratory": systemRespiratory,
        "systemCardiovascular": systemCardiovascular,
        "systemAbdominal": systemAbdominal,
        "systemGenitourinary": systemGenitourinary,
        "systemCNS": systemCNS,
        "systemLocal": systemLocal,
        "general_examination": "$generalCardText", // Add the selected options from SelectableCard
        "systematic_examination":"$systematicCardText", // Add the selected options from SelectableCard
      }
    };

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
  List<String> systematicCardText = [];
  List<TextEditingController> systematicCardControllers = [];

  @override
  void initState() {
    super.initState();

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
        title: const Text("Examinaion"),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: height / 3,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: generalCard.length,
                  itemBuilder: (context, index) {
                    return SelectableCard(
                      text: generalCard[index],
                      isSelected: generalCardText.contains(generalCard[index]),
                      onSelect: () {
                        setState(() {
                          if (generalCardText.contains(generalCard[index])) {
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Replacing Card with SelectableCard for each row
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Respiratory',
                      isSelected: systematicCardText.contains('Respiratory'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Respiratory')) {
                            systematicCardText.remove('Respiratory');
                          } else {
                            systematicCardText.add('Respiratory');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemRespiratoryController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Cardiovascular',
                      isSelected: systematicCardText.contains('Cardiovascular'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Cardiovascular')) {
                            systematicCardText.remove('Cardiovascular');
                          } else {
                            systematicCardText.add('Cardiovascular');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemCardiovascularController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Abdominal',
                      isSelected: systematicCardText.contains('Abdominal'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Abdominal')) {
                            systematicCardText.remove('Abdominal');
                          } else {
                            systematicCardText.add('Abdominal');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemAbdominalController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Genitourinary',
                      isSelected: systematicCardText.contains('Genitourinary'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Genitourinary')) {
                            systematicCardText.remove('Genitourinary');
                          } else {
                            systematicCardText.add('Genitourinary');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemGenitourinaryController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'CNS',
                      isSelected: systematicCardText.contains('CNS'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('CNS')) {
                            systematicCardText.remove('CNS');
                          } else {
                            systematicCardText.add('CNS');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemCNSController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Local',
                      isSelected: systematicCardText.contains('Local'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Local')) {
                            systematicCardText.remove('Local');
                          } else {
                            systematicCardText.add('Local');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: TextField(
                      controller: systemLocalController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OpdInvestigation()),
                                );
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
