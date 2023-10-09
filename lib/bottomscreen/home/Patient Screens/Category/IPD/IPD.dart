// ignore_for_file: file_names, sized_box_for_whitespace, deprecated_member_use, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Madication.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';

    print(patientID);
    setState(() {});
  }
///////////////////////////////////////////////////////////////////

  getData() async {
    await LoadData();

    await getpatientDetails();
  //  await fetchData();
  }

  @override
  void initState() {
    super.initState();
    getData();
    fetchData();
  }

///////////////////////////////////////////////////////////////////
// get Patinent Detials
  late String PatientName = '';
  late String PatientAge = '';
  late String PatientGender = '';
  late String AdmissionDate = '';

  Future<void> getpatientDetails() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': '10380',
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getpatientDetails'),
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

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }
  //////////////////////////////////////////////////////////////////////////////////
  // get vital data
   Map<String, dynamic> responseData = {};
  Future<void> fetchData() async {
    final apiUrl = Uri.parse('https://uat.tez.hospital/xzy/webservice/getipdVitals');
    final headers = {
      'Soft-Service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };
    final body = {
      "ipd_id":"313",
    "patient_id":"10909"
    };

    try {
      final response = await http.post(
        apiUrl,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);
          setState(() {
            responseData = jsonResponse;
          });
        } else {
          print('API response is empty.');
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print(error.toString());
    }
  }
  //////////////////////////////////////////////////////////////////////////////


  late ColorNotifier notifier;

  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
          appBar: AppBar(
            title: const Text('IPD'),
            centerTitle: true,
            backgroundColor: darkYellow,
            // elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Card(
              elevation: 1,
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
                            shrinkWrap:
                                true, // Set to true to make the GridView scrollable within the Column
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.offAll(() => const MedicationScreen());
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Card(
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
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Card(
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
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Card(
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
                  Container(
                    padding: const EdgeInsets.all(16.0),
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
                        Text('Patient Name: $PatientName'),
                        Text('Age: $PatientAge'),
                        Text('Gender: $PatientGender'),
                        Text('Date of Admission: $AdmissionDate'),
                        Text('Height: ${responseData['vitals']['Height']}'),
                        const SizedBox(height: 32),
                        const Text(
                          'Vitals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                         buildVitalItem('Height', responseData['vitals']?['Height'] ?? 'N/A'),
                buildVitalItem('Weight', responseData['vitals']?['weight'] ?? 'N/A'),
                buildVitalItem('BP', responseData['vitals']?['bp'] ?? 'N/A'),
                buildVitalItem('Pulse', responseData['vitals']?['pulse'] ?? 'N/A'),
                buildVitalItem('Temperature', responseData['vitals']?['temprature'] ?? 'N/A'),
                buildVitalItem('Respiration', responseData['vitals']?['respiration'] ?? 'N/A'),
                const SizedBox(height: 32),
                        const Text(
                          'Consultants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Diagnosis: Ramjinish kushwaha'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
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
