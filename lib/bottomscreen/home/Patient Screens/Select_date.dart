// ignore_for_file: file_names, sized_box_for_whitespace, deprecated_member_use

import 'dart:convert';

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Doctor_profile.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Old_or_newPatient.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class SelectDateScreen extends StatefulWidget {
  final String doctorImage;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String workExp;
  const SelectDateScreen(
      {Key? key,
      required this.doctorImage,
      required this.doctorName,
      required this.doctorSpecialization,
      required this.doctorId,
      required this.workExp})
      : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  List<dynamic>? data = [];

  bool isLoading = true;
  Future<void> fetchDepartmentData() async {
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "table": "doctor_shift",
      "where": {"staff_id": widget.doctorId}
    };

    final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/db_table'),
        headers: headers,
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        data = dataMap['result'];
        print('==============$data');
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

  getData() async {
    await fetchDepartmentData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: Text('selectADate'.tr),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => DoctorProfile(
                      doctorId: widget.doctorId,
                      doctorImage: widget.doctorImage,
                      doctorName: widget.doctorName,
                      doctorSpecialization: widget.doctorSpecialization,
                      workExp: widget.workExp,
                    ));
              },
              icon: SvgPicture.asset(
                'assets/info1.svg',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                    child: const LoadingIndicatorWidget(),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Card(
                        color: Colors.grey[200],
                        child: Container(
                          width: width,
                          height: height / 6,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height / 2,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors
                                          .red, // You can specify the color of the border here
                                      width:
                                          1.0, // You can specify the width of the border here
                                    ),
                                  ),
                                  child: Image.network(
                                    widget.doctorImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.doctorName.isNotEmpty
                                          ? widget.doctorName
                                          : 'N/A',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                      height: 8,
                                    ),
                                    Text(
                                      widget.doctorSpecialization.isNotEmpty
                                          ? widget.doctorSpecialization
                                          : 'N/A',
                                    ),
                                    const SizedBox(
                                      width: 20,
                                      height: 8,
                                    ),
                                    Text(
                                      widget.doctorId.isNotEmpty
                                          ? widget.doctorId
                                          : 'N/A',
                                    ),
                                    const SizedBox(
                                      width: 20,
                                      height: 8,
                                    ),
                                    Text(
                                      widget.workExp.isNotEmpty
                                          ? widget.workExp
                                          : 'N/A',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              final item = data?[index];
                              final createdDate = item['created_at'] as String;
                              final createdDateTime =
                                  DateTime.parse(createdDate);

                              String dateTimeString =
                                  item['created_at'] as String;

                              // Parse the date-time string into a DateTime object
                              DateTime dateTime =
                                  DateTime.parse(dateTimeString);

                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(dateTime);
                              NepaliDateFormat dateFormat =
                                  NepaliDateFormat('yyyy-MM-dd');
                              DateTime englishDate =
                                  DateTime.parse(item['created_at']);
                              NepaliDateTime nepaliDate =
                                  NepaliDateTime.fromDateTime(englishDate);
                              String convertTo12HourFormat(String time24Hour) {
                                final parsedTime =
                                    DateFormat('HH:mm:ss').parse(time24Hour);
                                final formattedTime =
                                    DateFormat('hh:mm a').format(parsedTime);
                                return formattedTime;
                              }

                              String time24Hour = (item['start_time']);
                              String starttime12Hour =
                                  convertTo12HourFormat(time24Hour);
                              String endtime24Hour = (item['end_time']);
                              String end_time12Hour =
                                  convertTo12HourFormat(endtime24Hour);

                              return InkWell(
                                onTap: () {
                                  Get.to(() => const OldorNewPatientScreen());
                                },
                                child: Card(
                                  color: Colors.grey[200],
                                  child: Container(
                                    width: width,
                                    height: height / 9,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: height,
                                            width: width / 5,
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .blue, // Background color
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5), // Rounded corners
                                              border: Border.all(
                                                  color: Colors.red,
                                                  width: 1), // Border
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey,
                                                  Colors.white
                                                ], // Gradient colors
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('${createdDateTime.day}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkYellow,
                                                        fontSize: 30)),
                                                Text(
                                                  '${NepaliDateFormat('EEE,').format(nepaliDate)}',
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '$formattedDate/ ${NepaliDateFormat('EEE, MMM d, ' 'yyyy').format(nepaliDate)}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                ' $starttime12Hour  To $end_time12Hour',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '   (${item['token'] ?? 'N/A'} token left)',
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ])),
              ));
  }
}
