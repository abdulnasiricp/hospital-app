// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('conformation'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Container(
                height: height / 4,
                width: width,
                // color: Colors.white,
                child: Card(
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'hospitalVisitAppointment'.tr,
                          style: TextStyle(
                              color: Colors.orange[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/drtwo.png')),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Ramjinish Kushwaha',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("MBBS-internal Medicine"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("NEUROLOGY"),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          child:  Row(
                            children: [
                              Text('date'.tr),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('[14/09/2023] [14/09/2030]')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Text('patientInformation'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Container(
              width: width,
              height: height / 5,
              child: Card(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'patientName'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'patientMobile'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'patientGender'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'patientDOB'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'patientAddress'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 40, top: 10, left: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ramjinish Kushwaha'),
                          Text('+977-9855014612'),
                          Text('Male'),
                          Text('07/04/2000'),
                          Text('Birgunj'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('patientPaymentAmount'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 10,
                ),
                Text("RS. 700.00",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900])),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('confirmationDesc'.tr,
                style: TextStyle(color: Colors.orange[900])),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text('selectPaymentMethod'.tr,
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            const SizedBox(
              height: 10,
            ),

            InkWell(
              onTap: () {},
              child: Container(
                width: width / 1,
                height: height / 15,
                decoration: BoxDecoration(
                    color: darkYellow, borderRadius: BorderRadius.circular(10)),
                child:  Center(
                    child: Text(
                  'selectPaymentMethod'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
