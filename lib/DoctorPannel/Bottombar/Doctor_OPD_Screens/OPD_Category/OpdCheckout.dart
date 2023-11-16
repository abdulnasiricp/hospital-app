// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use, unnecessary_null_comparison, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';

class Opd_Check_Out extends StatefulWidget {
  const Opd_Check_Out({Key? key}) : super(key: key);

  @override
  State<Opd_Check_Out> createState() => _General_Opd_Tickets_FormState();
}

class _General_Opd_Tickets_FormState extends State<Opd_Check_Out> {
  String selectedDischargeStatus = '';

  final double _progress = 0.0; // Declare _progress here
  InAppWebViewController? webView; // Declare webView here
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController TicketdateController = TextEditingController();
  TextEditingController DischargeDetail = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                            text: "DischargeDetail",
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
                          child: Flexible(
                            child: HtmlEditor(
                              controller: DischargeDetailController,
                              htmlEditorOptions: const HtmlEditorOptions(
                                // Set initial text here
                                initialText: "Your text here...",
                              ),
                              otherOptions: const OtherOptions(),
                            ),
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
        ),
      ),
    ));
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
