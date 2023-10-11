// ignore_for_file: unnecessary_null_comparison, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Bedhistory/Bedhistory.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Madication.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Surgery/SurgeryPrescriptionList.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IPD extends StatefulWidget {
  const IPD({Key? key}) : super(key: key);

  @override
  State<IPD> createState() => _IPDState();
}

class _IPDState extends State<IPD> {
//////////////////////////////////////////////////////////////////////////////////
// get Shared Prefernce data

  late String patientID = '';
  late String iPDID = '';

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';
    iPDID = sp.getString('ipdId') ?? '';

    print(patientID);
    setState(() {});
  }
///////////////////////////////////////////////////////////////////

  getData() async {
    await LoadData();

    await getpatientDetails();
    await fetchVitalsData().then((data) {
      setState(() {
        vitalsData = data['vitals'];
        consultansData = data['consultant_doctor'];
        doctorsIPDData = data['doctors_ipd'];
      });
    });
  }

  late List<dynamic> doctorsIPDData = [];

  @override
  void initState() {
    super.initState();
    getData();

    // fetchVitalsData();
  }

///////////////////////////////////////////////////////////////////
// get Patinent Detials
  late String PatientName = '';
  late String PatientAge = '';
  late String PatientGender = '';
  late String AdmissionDate = '';
  late String ipdData = '';

  Future<void> getpatientDetails() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': patientID,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getpatientDetails),
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        // Get the total_dues and patho_dues values
        PatientName = data['result']['patient_name'];
        PatientAge = data['result']['age'];
        PatientGender = data['result']['gender'];
        AdmissionDate = data['result']['date'];
        ipdData = data['result']['ipdid'];

        final sp = await SharedPreferences.getInstance();
        sp.setString('ipdId', ipdData);

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }
  ////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////
  // get vital data

// Existing declaration of vitalsData
  late Map<String?, dynamic> vitalsData = {};
  late Map<String?, dynamic> consultansData = {};

  Future<Map<String, dynamic>> fetchVitalsData() async {
    final response = await http.post(
      Uri.parse(
          'https://uat.tez.hospital/xzy/webservice/getipdVitals'), // Replace with your API URL
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
      },
      body: jsonEncode({
        "ipd_id": ipdData,
        "patient_id": patientID,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load vitals data');
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  bool isLoading = true;
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await fetchVitalsData();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }
  //////////////////////////////////////////////////////////////////////////////

  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();
  //////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        appBar: AppBar(
          title: const Text('IPD'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: fetchVitalsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading indicator while fetching data
              return Center(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.transparent,
                        child: const LoadingIndicatorWidget())),
              );
            } else if (snapshot.hasError) {
              // Handle error state
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (vitalsData == null ||
                vitalsData.isEmpty ||
                consultansData == null ||
                consultansData.isEmpty) {
              return Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset(
                    'assets/No_Data_Found.json',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              // Data has been successfully fetched, display your content
              return SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const MedicationScreen());
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/Medication.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Medication",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => SurgeryPrescriptionList());
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/bill.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Cardex",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/surgery.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Surgery",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/Diagnosis.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Diagnosis",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/Maternity.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Maternity",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const Bedhistory());
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Card(
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: SvgPicture.asset(
                                                  'assets/bed_history.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: darkYellow),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("Bed History",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Patient Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Patient Name: '),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Age: '),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Gender: '),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Date of Admission: '),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        PatientName,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        PatientAge,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        PatientGender,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        AdmissionDate,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              const Text(
                                'Vitals',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildVitalItem('Height',
                                      "${vitalsData['Height'] ?? ""} "),
                                  buildVitalItem('Weight',
                                      "${vitalsData['weight'] ?? ""} "),
                                  buildVitalItem(
                                      'BP', "${vitalsData['bp'] ?? ""} "),
                                  buildVitalItem(
                                      'Pulse', "${vitalsData['pulse'] ?? ""} "),
                                  buildVitalItem('Temperature',
                                      "${vitalsData['temprature'] ?? ""} "),
                                  buildVitalItem('Respiration',
                                      "${vitalsData['respiration'] ?? ""} "),
                                  const SizedBox(height: 32),
                                  const Column(
                                    children: [
                                      Text(
                                        'Consultants',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${consultansData['name'] ?? ""} ${consultansData['surname'] ?? ""} ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                      height:
                                          1), // Add spacing between the Text widget and the ListView.builder
                                  ListView.builder(
                                    itemCount: doctorsIPDData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final doctor = doctorsIPDData[index];
                                      return Text(
                                        "${doctor['ipd_doctorname']} ${doctor['ipd_doctorsurname']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                    shrinkWrap:
                                        true, // Add this to make the ListView.builder use minimum required height
                                    physics:
                                        const NeverScrollableScrollPhysics(), // Add this to disable scrolling
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildVitalItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
