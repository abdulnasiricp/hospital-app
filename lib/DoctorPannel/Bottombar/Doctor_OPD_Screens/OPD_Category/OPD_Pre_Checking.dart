// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'dart:convert';

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Examination.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class OpdPreChecking extends StatefulWidget {
  final String? opdID;
  final String? status;
  const OpdPreChecking({Key? key, this.opdID, this.status}) : super(key: key);
  @override
  State<OpdPreChecking> createState() => _OpdPreCheckingState();
}

class _OpdPreCheckingState extends State<OpdPreChecking> {
  //Vitals symptom
  TextEditingController symptomsController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController pulseController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController respirationController = TextEditingController();
  //Vitals past History
  TextEditingController workProfileHistoryController = TextEditingController();
  TextEditingController socialHistoryController = TextEditingController();
  TextEditingController pastMedicalHistoryController = TextEditingController();
  TextEditingController currentMedicationController = TextEditingController();
  //Vitals General History
  TextEditingController anyKnownAllergiesController = TextEditingController();
  TextEditingController familyHistoryController = TextEditingController();
  TextEditingController recentReportController = TextEditingController();
  TextEditingController birthHistoryController = TextEditingController();
  TextEditingController NoteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _unUsedFocusNode = FocusNode();

  bool isLoading = false;
  Future<void> makePostRequest() async {
    final String symptoms = symptomsController.text;
    final String height = heightController.text;
    final String weidget = weightController.text;
    final String bp = bpController.text;
    final String pulse = pulseController.text;
    final String temperature = temperatureController.text;
    final String respiration = respirationController.text;
    final String workProfileHistory = workProfileHistoryController.text;
    final String currentMedication = currentMedicationController.text;
    final String anyKnownAllergies = anyKnownAllergiesController.text;
    final String familyHistory = familyHistoryController.text;
    final String recentReport = recentReportController.text;
    final String birthHistory = birthHistoryController.text;
    final String pastMedicalHistory = pastMedicalHistoryController.text;
    final String socialHistory = socialHistoryController.text;
    final String NoteController = socialHistoryController.text;

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

    Map<String, dynamic> requestBody = {
      "table": "Visit_details",
      "fields": {
        "opd_details_id": "${widget.opdID}",
        "symptoms": symptoms,
        "height": height,
        "weight": weidget,
        "bp": bp,
        "pulse": pulse,
        "temperature": temperature,
        "respiration": respiration,
        "work_profile ": workProfileHistory,
        "social_history ": socialHistory,
        "past_medical ": pastMedicalHistory,
        "current_medication  ": currentMedication,
        "known_allergies": anyKnownAllergies,
        "family_history": familyHistory,
        "recent_report": recentReport,
        "birth_history": birthHistory,
        "note": NoteController,
        "status": "${widget.status}",
      }
    };
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$requestBody");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pre- Checking"),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        backgroundColor: Colors.lightBlue[50],
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
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vitals',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' Symptoms',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: symptomsController,
                                  keyboardType: TextInputType.text,
                                  readOnly: false,
                                  focusNode: _focusNode,
                                  onTapOutside: (PointerDownEvent event) {
                                    FocusScope.of(context)
                                        .requestFocus(_unUsedFocusNode);
                                  },
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          height: 5,
                        ),
                        const Text(
                          'Past History',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width / 2.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    ' Work Profie History',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: workProfileHistoryController,
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
                                    ' Social History',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: socialHistoryController,
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
                                    ' Past Medical History',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: pastMedicalHistoryController,
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
                                    ' Current medication',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: currentMedicationController,
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
                        const Text(
                          'General History',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width / 2.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    ' Any Known Allergies',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: anyKnownAllergiesController,
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
                                    ' Family History',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: familyHistoryController,
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
                                    ' Recent Report',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: recentReportController,
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
                                    ' Birth History',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    child: TextFormField(
                                      controller: birthHistoryController,
                                      keyboardType: TextInputType.text,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Note',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 45,
                                child: TextFormField(
                                  controller: NoteController,
                                  keyboardType: TextInputType.text,
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                      builder: (context) =>
                                          const OpdExamination()),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(yellow),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
