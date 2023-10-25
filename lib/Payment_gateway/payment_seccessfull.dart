// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class PaymentSuccessfullScreen extends StatefulWidget {
    final String paymentMode;

  const PaymentSuccessfullScreen({
    Key? key, required this.paymentMode,
  }) : super(key: key);

  @override
  State<PaymentSuccessfullScreen> createState() => _PaymentSuccessfullScreenState();
}

class _PaymentSuccessfullScreenState extends State<PaymentSuccessfullScreen> {

getData()async{

await LoadData();
await getDues();
}
  @override
  void initState() {
    getData();
    super.initState();
  }
    String Patient_id = '';

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
   
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  /////////////////////////////////////////////////////////////////////////////
  // get Due amount
  late num totalDues = 0;
  late num blooddues = 0;
  late num ambulancedues = 0;
  late num pharmadues = 0;
  late num diredues = 0;
  late num radiodues = 0;
  late num pathodues = 0;

  

  Future<void> getDues() async {
    // Set the headers
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    // Set the body
    final body = {
      'patient_id': Patient_id,
    };
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.getDues),
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);

        // Get the total_dues and patho_dues values
        totalDues = data['result']['total_dues'];
        diredues = data['result']['dire_dues'];
        pharmadues = data['result']['pharma_dues'];
        pathodues = data['result']['patho_dues'];
        radiodues = data['result']['radio_dues'];
        blooddues = data['result']['blood_dues'];
        ambulancedues = data['result']['ambulance_dues'];

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(centerTitle: true, backgroundColor: darkYellow),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  'Payment Successfull!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )),
              ),
             
              Card(
                child: Column(
                  children: [
                     Container(
                    width: width / 3,
                    height: height / 7,
                    child: Lottie.asset('assets/done.json')),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Mode',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Transaction id',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Pathology Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Radiology Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Direct Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Pharmacy Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Ambulance Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Blood Bank Dues',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Net Banking',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                               Text(Patient_id,
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("$pathodues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                               Text("$radiodues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                             Text("$diredues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                               Text("$pharmadues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                             Text("$ambulancedues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                               Text("$blooddues",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 10,
                      ),
                      child: Divider(
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'totalhospitalDueAmount'.tr,
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding:
                              const EdgeInsets.only(right: 70, left: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$totalDues',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: width / 4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Save'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(darkYellow),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: width / 4,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Close'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(darkYellow),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
