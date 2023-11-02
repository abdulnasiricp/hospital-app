// ignore_for_file: file_names, sized_box_for_whitespace, deprecated_member_use, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Doctor_profile.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Old_or_newPatient.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Card(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: 100,
                        child: Image.network(
                          widget.doctorImage,
                          fit: BoxFit.cover,
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
                              widget.doctorName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(widget.doctorSpecialization),
                            Text(widget.doctorId)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      final item = data?[index];
                       final createdDate = item['created_at'] as String;
    final createdDateTime = DateTime.parse(createdDate);
                      return InkWell(
                        onTap: () {
                          Get.to(() => const OldorNewPatientScreen());
                        },
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            width: width,
                            height: 80,
                            child: Row(
                              children: [
                                Container(
                                    height: height,
                                    width: width / 5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${createdDateTime.day}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: darkYellow,
                                                fontSize: 30)),
                                         Text('  ${item['day'] ?? 'N/A'}',
                                        
                                                ),
                                      ],
                                    )),
                                const SizedBox(
                                  width: 40,
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                         Row(
                                           children: [
                                             const Text('Created At',
                                             style: TextStyle(
                                                fontWeight: FontWeight.bold),),
                                                const SizedBox(width: 10,),
                                             Text('${item['created_at'] ?? 'N/A'}',
                                             style: const TextStyle(
                                                fontWeight: FontWeight.bold),),
                                           ],
                                         ),    
                                      const SizedBox(height: 5,),


                                      Text(
                                       ' ${item['start_time'] ?? 'N/A'}  ,  ${item['end_time'] ?? 'N/A'}'  ,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                       Text(
                                        '           (${item['token'] ?? 'N/A'} token left)',
                                        style: const TextStyle(color: Colors.red),
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
            ])));
  }
}
