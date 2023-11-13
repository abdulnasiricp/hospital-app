// ignore_for_file: file_names, camel_case_types, duplicate_ignore, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unused_field, deprecated_member_use, unnecessary_null_comparison, unnecessary_string_interpolations

import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/opd_tickets_details.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Opd_Check_Out extends StatefulWidget {
  const Opd_Check_Out({Key? key}) : super(key: key);

  @override
  State<Opd_Check_Out> createState() => _General_Opd_Tickets_FormState();
}

class _General_Opd_Tickets_FormState extends State<Opd_Check_Out> {
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
                            child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          readOnly:
                              true, // Set this to true to disable the keyboard
                          // controller: departmentController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                              onPressed: () {
                                // _showDepartmentSelection(context);
                              },
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Select department',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () {
                            // _showDepartmentSelection(context);
                          },
                        )),
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
                    TextFormField(
                      controller: DischargeDetail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Discharge Detail',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                color: yellow,
                width: width,
                height: height / 15,
                child: ElevatedButton(child: Text("Save"), onPressed: () {}),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
