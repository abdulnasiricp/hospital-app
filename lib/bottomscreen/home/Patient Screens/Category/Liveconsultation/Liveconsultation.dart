// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unused_import, deprecated_member_use

import 'dart:convert';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Liveconsultation extends StatefulWidget {
  const Liveconsultation({Key? key}) : super(key: key);

  // const Liveconsultation({super.key});

  @override
  State<Liveconsultation> createState() => _LiveconsultationState();
}

class _LiveconsultationState extends State<Liveconsultation> {
  bool isLoading = true;
  // List<Map<String, dynamic>> apiData = []; // Initialize as a list

    List<Map<String, dynamic>> resultList = [];

  late String patient = '';

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

  getData() async {
    await LoadData();
    // fetchLiveConsult();
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> fetchData() async {
  final url = Uri.parse("https://uat.tez.hospital/xzy/webservice/getliveconsult");
  final headers = {
    'Soft-service': 'TezHealthCare',
    'Auth-key': 'zbuks_ram859553467',
  };
  final body = {
    "patient_id": patient,
  };

  final response = await http.post(url, headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('==============$data');
   setState(() {
      isLoading=false;
   });

    // Extract the relevant data from the JSON response


    final liveConsultData = data["liveconsult"];
    liveConsultData.forEach((key, value) {
      final joinUrl = value["join_url"];
      final date = value["date"];
      final doctor = value["doctor"];
      final patientName = value["patient_name"];
      resultList.add({
        "join_url": joinUrl,
        "date": date,
        "doctor": doctor,
        "patient_name": patientName,
      });
    });

    // Now, you have the required data in the resultList
    print('========$resultList');
  } else {
    throw Exception('Failed to fetch data');
  }
}



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title:  Text('Liveconsultation'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: width,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  const Text("Doctor",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Date'.tr,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ), const Text("Duration ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Text(
                    EnString.status,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.blue.shade100,
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                          title: Container(
                            width: 150,
                            height: 15,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            width: 100,
                            height: 8,
                            color: Colors.white,
                          ),
                          trailing: Container(
                            width: 60,
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )
                : resultList.isEmpty
                    ? Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Lottie.asset(
                            'assets/No_Data_Found.json',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: resultList.length,
                        itemBuilder: (context, index) {
                         final liveConsultation = resultList[index];
                          
                            return Column(
                              children: [
                                Card(
                                  color: Colors.white70.withOpacity(0.7),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                       
                                         InkWell(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(3.0),
                                            child: Text(
                                             
                                             liveConsultation["doctor"]??"N/A",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                         InkWell(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(3.0),
                                            child: Text(
                                              liveConsultation["date"]??"N/A",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                  fontSize: 10
                                              ),
                                            ),
                                          ),
                                        ), const InkWell(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(3.0),
                                            child: Text(
                                              "30 minutes",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                  fontSize: 10
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .green, // Background color
                                            borderRadius:
                                                BorderRadius.circular(
                                                    2.0), // Rounded corners
                                          ),
                                          child:  Padding(
                                            padding:
                                                const EdgeInsets.all(1.0),
                                            child: InkWell(
                                              onTap: () {
                                                launch(liveConsultation["join_url"],);
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.video_call,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Join".tr,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
