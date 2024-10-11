// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, non_constant_identifier_names

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
  final String? height;
  final String? temperature;
  final String? respiration;
  final String? weight;
  final String? status;
  final String? bp;
  final String? symptoms;
  final String? pulse;
  final String? known_allergies;
  final String? OpdVisitDetailsID;
  final String? work_profile;
  final String? social_history;
  final String? past_medical;
  final String? current_medication;
  final String? family_history;
  final String? note_remark;
  final String? birth_history;
  final String? recent_report;
  final String? patient_id;
  final String? employee_id;
  final String? generated_by;
  // final String? patient_id;
  const OpdPreChecking(
      {Key? key,
      this.opdID,
      this.family_history,
      this.birth_history,
      this.recent_report,
      this.note_remark,
      this.current_medication,
      this.past_medical,
      this.work_profile,
      this.social_history,
      this.bp,
      this.respiration,
      this.known_allergies,
      this.pulse,
      this.symptoms,
      this.temperature,
      this.OpdVisitDetailsID,
      this.weight,
      this.height,
      this.status,
      this.patient_id,
      this.employee_id,
      this.generated_by})
      : super(key: key);
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

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    symptomsController = TextEditingController(text: widget.symptoms);
    heightController = TextEditingController(text: widget.height);
    weightController = TextEditingController(text: widget.weight);
    bpController = TextEditingController(text: widget.bp);
    pulseController = TextEditingController(text: widget.pulse);
    temperatureController = TextEditingController(text: widget.temperature);
    respirationController = TextEditingController(text: widget.respiration);
    workProfileHistoryController =
        TextEditingController(text: widget.work_profile);
    currentMedicationController =
        TextEditingController(text: widget.current_medication);
    anyKnownAllergiesController =
        TextEditingController(text: widget.known_allergies);
    familyHistoryController =
        TextEditingController(text: widget.family_history);
    recentReportController = TextEditingController(text: widget.recent_report);
    birthHistoryController = TextEditingController(text: widget.birth_history);
    pastMedicalHistoryController =
        TextEditingController(text: widget.past_medical);
    socialHistoryController =
        TextEditingController(text: widget.social_history);
    NoteController = TextEditingController(text: widget.note_remark);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    NoteController.dispose();
    socialHistoryController.dispose();
    pastMedicalHistoryController.dispose();
    birthHistoryController.dispose();
    recentReportController.dispose();
    familyHistoryController.dispose();
    anyKnownAllergiesController.dispose();
    currentMedicationController.dispose();
    workProfileHistoryController.dispose();
    respirationController.dispose();
    temperatureController.dispose();
    pulseController.dispose();
    bpController.dispose();
    symptomsController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

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
    final String NoteControllerr = NoteController.text;

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';
    int currentStatus = int.parse(widget.status ?? "0");
    int newStatus = currentStatus + 1;
    Map<String, dynamic> requestBody = {
      "table": "visit_details",
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
        "note_remark": NoteControllerr,
        "status": newStatus,
      }
    };
    print(
        "----------------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$requestBody");
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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OpdExamination(
                      opdVisitDetailsID: widget.OpdVisitDetailsID,
                      status: widget.status,
                      patient_id: widget.patient_id,
                      employee_id: widget.employee_id,
                    )),
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
                                child: TextFormField(
                                  controller: symptomsController,
                                  maxLines: null,
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
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      controller: heightController,
                                      maxLines: null,
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
                            Container(
                              width: width / 2.3,
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
                                    child: TextFormField(
                                      controller: weightController,
                                      maxLines: null,
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
                          width: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      controller: bpController,
                                      maxLines: null,
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
                            Container(
                              width: width / 2.3,
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
                                    child: TextFormField(
                                      controller: pulseController,
                                      maxLines: null,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      controller: temperatureController,
                                      maxLines: null,
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
                                    child: TextFormField(
                                      controller: respirationController,
                                      maxLines: null,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      maxLines: null,
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
                                    child: TextFormField(
                                      controller: socialHistoryController,
                                      maxLines: null,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      controller: pastMedicalHistoryController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                  ),
                                ],
                              ),
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
                                    child: TextFormField(
                                      controller: currentMedicationController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2.05,
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
                                    child: TextFormField(
                                      controller: anyKnownAllergiesController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                  ),
                                ],
                              ),
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
                                    child: TextFormField(
                                      controller: familyHistoryController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2,
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
                                    child: TextFormField(
                                      controller: recentReportController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                  ),
                                ],
                              ),
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
                                    child: TextFormField(
                                      controller: birthHistoryController,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      maxLines: null,
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
                                child: TextFormField(
                                  controller: NoteController,
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  maxLines: null,
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
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(yellow),
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
