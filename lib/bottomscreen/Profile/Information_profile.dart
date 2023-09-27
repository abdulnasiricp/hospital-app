
// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names, avoid_print, avoid_unnecessary_containers

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/LoadingWidget.dart';

class InformationProfile extends StatefulWidget {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  State<InformationProfile> createState() => _InformationProfileState();
}

class _InformationProfileState extends State<InformationProfile>
    with SingleTickerProviderStateMixin {
  var profileData;
  late String patientID = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';

    print(patientID);
    setState(() {});
  }

  Future<void> ProfileApi() async {
    const apiUrl = ApiLinks.getPatientprofile;
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final requestBody = jsonEncode({"patientId": patientID});


    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profileJson =
            responseBody[0]; // Assuming your API returns a list with one item
        setState(() {
          profileData = ProfileData.fromJson(profileJson);
        });
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
     catch (e) {
      // Handle any exceptions that occur during the request
      print('Request error: $e');
    }
  }

  getAllData() async {
    await LoadData();

    await ProfileApi();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  bool noDataAvailable = false;
late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: const Text(EnString.informationProfile),
          centerTitle: true,
        ),
        body: profileData != null 
            ? Column(
                children: [
                  Stack(children: [
                    Container(
                      width: width,
                      height: height / 3,
                      decoration: BoxDecoration(
                      color: darkYellow,
                      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40))

                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(profileData!.image??""),
                          radius: 60,
                        )),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 4.5),
                        child: Center(
                            child: Text(
                          profileData!.patientName??"",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 3.5,
                          left: width / 15,
                          right: width / 15),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: width,
                          height: height / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(EnString.patientID,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData!.id??"",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(EnString.patientGender,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData!.gender??"",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(EnString.patientAge,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData!.age??"",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              EnString.patientEmail,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              EnString.patientPhone,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              EnString.patientBloodGroup,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              EnString.patientAddress,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              EnString.patientMaritialStatus,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              EnString.patientGuardianName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width / 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profileData!.email??"" ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData!.mobileNo??""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData!.bloodGroup??""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData!.address??""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData!.maritalStatus??""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData!.guardianName??""),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            :  const AlertDialogWidget()
        // :Center(child: Lottie.asset('assets/loading1.json'))

        );
  }
}
