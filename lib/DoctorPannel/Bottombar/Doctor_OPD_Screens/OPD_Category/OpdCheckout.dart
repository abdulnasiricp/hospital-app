// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use, unnecessary_null_comparison, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class Opd_Check_Out extends StatefulWidget {
  const Opd_Check_Out({Key? key}) : super(key: key);

  @override
  State<Opd_Check_Out> createState() => _Opd_Check_OutState();
}

class _Opd_Check_OutState extends State<Opd_Check_Out> {
  String selectedDischargeStatus = '';

  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

//////////////////////////////////////////////////////////////////////////// For Marital Status
  Future<void> _selectDischargeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        TicketdateController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  HtmlEditorController DischargeDetailController = HtmlEditorController();

  TextEditingController TicketdateController = TextEditingController();
  TextEditingController deathController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  TextEditingController referralDateController = TextEditingController();
  TextEditingController referralHospitalController = TextEditingController();
  TextEditingController referralReasonController = TextEditingController();

  bool isLoading = false;

  Future<void> makePostRequest() async {
    final String ticketDate = TicketdateController.text;
    final String deathDate = deathController.text;
    final String guardianName = guardianNameController.text;
    final String report = reportController.text;
    final String referralDate = referralDateController.text;
    final String referralHospital = referralHospitalController.text;
    final String referralReason = referralReasonController.text;

    List<dynamic> requestBodyList = [
      ticketDate,
      deathDate,
      guardianName,
      report,
      referralDate,
      referralHospital,
      referralReason
    ];

    const String apiUrl =
        'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

    Map<String, dynamic> requestBody = {
      "table": "OPD checkout",
      "fields": "$requestBodyList"
    };

    print('----------------$requestBodyList');
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

  FilePickerResult? selectedFiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Check out"),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width / 2.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Select Ticket Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                controller: TicketdateController,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: const Icon(Icons.calendar_month),
                                        onPressed: () {
                                          _selectDischargeDate(context);
                                        }),
                                    border: const OutlineInputBorder(),
                                    hintText: 'Select Ticket Date',
                                    fillColor: Colors.white,
                                    filled: true),
                                readOnly: true,
                                onTap: () => _selectDischargeDate(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width / 2.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Discharge Status",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                _showDischargeStatusOptions(context);
                              },
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      _showDischargeStatusOptions(context);
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Select discharge status',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                onTap: () {
                                  _showDischargeStatusOptions(context);
                                },
                                controller: TextEditingController(
                                    text: selectedDischargeStatus),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Discharge Detail",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Container(
                              width: width,
                              child: HtmlEditor(
                                controller: DischargeDetailController,
                                htmlEditorOptions: const HtmlEditorOptions(
                                  // Set initial text here
                                  initialText: "Your text here...",
                                ),
                                otherOptions: const OtherOptions(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      if (selectedDischargeStatus == 'Death') ...{
                        Row(
                          children: [
                            _deathsectiontextfield(
                              context,
                              'Death Date',
                              TicketdateController,
                              width / 2.2,
                              true,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            _deathsectiontextfield(context, 'Guardian Name ',
                                guardianNameController, width / 2.2, false),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'Attachment',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles(
                                                        allowMultiple: true);

                                            if (result != null) {
                                              setState(() {
                                                selectedFiles = result;
                                              });
                                            }
                                          },
                                          icon: const Icon(Icons.add_a_photo),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    _deathsectiontextfield(context, 'Report ',
                                        reportController, width / 2.2, false),
                                    
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Display selected file names
                                Container(
                                  width: double.infinity,
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedFiles?.files
                                                  .map(
                                                    (file) => GestureDetector(
                                                      onTap: () async {
                                                        // Check if the file path is available
                                                        if (file.path != null) {
                                                          // Open the file using open_file
                                                          await OpenFile.open(
                                                              file.path!);
                                                        }
                                                      },
                                                      child: Text(
                                                        file.name,
                                                        style: const TextStyle(
                                                          color: Colors
                                                              .blue, // Change the text color to indicate it's clickable
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList() ??
                                              [],
                                        ),
                                      ),
                                    )
                              ],
                            )),
                      } else if (selectedDischargeStatus == 'Referral') ...{
                        Row(
                          children: [
                            _deathsectiontextfield(context, 'Referral Date',
                                referralDateController, width / 3.5, false),
                            const SizedBox(
                              width: 10,
                            ),
                            _deathsectiontextfield(
                                context,
                                'Referral Hospital Name',
                                referralHospitalController,
                                width / 3.5,
                                false),
                            const SizedBox(
                              width: 10,
                            ),
                            _deathsectiontextfield(
                                context,
                                'Reason For Referral',
                                referralReasonController,
                                width / 3.5,
                                false),
                          ],
                        ),
                      } else if (selectedDischargeStatus == 'Normal')
                        ...{}
                      else if (selectedDischargeStatus == 'DOPR')
                        ...{},
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
        ));
  }

  Container _deathsectiontextfield(BuildContext context, title,
      TextEditingController controller, widthSize, readOnly) {
    return Container(
      width: widthSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
            ),
            readOnly: readOnly,
            controller: controller,
          )
        ],
      ),
    );
  }

  void _showDischargeStatusOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align items at the ends
                children: <Widget>[
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Select discharge status',
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
              _buildOption('Death'),
              _buildOption('Referral'),
              _buildOption('Normal'),
              _buildOption('DOPR'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(String value) {
    return Card(
      color: Colors.white70.withOpacity(0.7),
      child: ListTile(
        title: Text(value),
        onTap: () {
          setState(() {
            selectedDischargeStatus = value;
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
