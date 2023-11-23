// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unnecessary_string_interpolations

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IpdExamination extends StatefulWidget {
  final String ipdid;
  const IpdExamination({Key? key, required this.ipdid}) : super(key: key);

  @override
  State<IpdExamination> createState() => _IpdExaminationState();
}

class _IpdExaminationState extends State<IpdExamination> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController pulseController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController respirationController = TextEditingController();

  TextEditingController systemRespiratoryController = TextEditingController();
  TextEditingController systemCardiovascularController =
      TextEditingController();
  TextEditingController systemAbdominalController = TextEditingController();
  TextEditingController systemGenitourinaryController = TextEditingController();
  TextEditingController systemCNSController = TextEditingController();
  TextEditingController systemLocalController = TextEditingController();

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
  List<String> systematicCardText = [];

  @override
  void initState() {
    makePostRequest();
    super.initState();
    print('================$generalCardText');
  }

  void makePostRequest() async {
    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

    Map<String, dynamic> requestBody = {
      "table": "Ipd_Examination",
      "fields": {
        "opd_details_id": "${widget.ipdid}",
        "height": "$heightController",
        "weight": "$weightController",
        "bp": "$bpController",
        "pulse": "$pulseController",
        "temperature": "$temperatureController",
        "respiration": "$respirationController",
        "general_examination":
            "$generalCardText", // Add the selected options from SelectableCard
        "systematic_examination":
            "$systematicCardText", // Add the selected options from SelectableCard
        "respiratory": "$systemRespiratoryController",
        "Cardiovascular": "$systemCardiovascularController",
        "Abdominal": "$systemAbdominalController",
        "Genitourinary": "$systemGenitourinaryController",
        "CNS": "$systemCNSController",
        "Local": "$systemLocalController",
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

        // If you want to work with the response data as JSON, you can decode it
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Status: ${responseData["staus"]}');
        print('Message: ${responseData["message"]}');
        print('ID: ${responseData["id"]}');
      } else {
        // Handle error response
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vitals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: width / 4.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(' Height',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: heightController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width / 4.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(' Weight',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: weightController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width / 4.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(' BP',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: bpController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width / 4.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(' Pulse',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: pulseController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: width / 2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Temperature',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: temperatureController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width / 2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Respiration',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: respirationController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                child: const Text(
                  'General Examination',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: height / 3,
                child: Expanded(
                  child: GridView.builder(
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
                    onPressed: () {
                      makePostRequest();
                      print('General================$generalCardText');
                      print('systematic================$systematicCardText');
                      print('systematic================$systematicCardText');
                
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkYellow),
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
