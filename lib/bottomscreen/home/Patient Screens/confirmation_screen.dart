// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

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
        title: const Text(EnString.conformation),
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
                          EnString.hospitalVisitAppointment,
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
                          child: const Row(
                            children: [
                              Text('Date:'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('[14/09/2023] [14/09/2030]')
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
            const Text(EnString.patientInformation,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              width: width,
              height: height / 5,
              child: const Card(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            EnString.patientName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            EnString.patientMobile,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            EnString.patientGender,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            EnString.patientDOB,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            EnString.patientAddress,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
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
                const Text(EnString.patientPaymentAmount,
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
            Text(EnString.confirmationDesc,
                style: TextStyle(color: Colors.orange[900])),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(EnString.selectpaymentMethod,
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
                child: const Center(
                    child: Text(
                  'Select Payment Method',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
              ),
            ),

            //
            // Container(
            //     width: width,
            //     height: height / 10,
            //     child: Card(
            //       child: Row(
            //         children: [
            //           Container(
            //             width: width / 5,
            //             height: height,
            //             child: Image.asset('assets/pay_logo.jpg'),
            //           ),
            //           Text(
            //             'IME Pay',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: darkYellow,
            //                 fontSize: 20),
            //           ),
            //           const SizedBox(
            //             width: 40,
            //           ),
            //           Text('    + 1 % \n RS. 707.00',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: darkYellow,
            //                   fontSize: 15)),
            //           const SizedBox(
            //             width: 50,
            //           ),
            //           const Icon(Icons.arrow_forward_ios)
            //         ],
            //       ),
            //     )),
            //
            //

            // Container(
            //     width: width,
            //     height: height / 10,
            //     child: Card(
            //       child: Row(
            //         children: [
            //           Container(
            //             width: width / 5,
            //             height: height,
            //             child: Image.asset('assets/esewa_logo.png'),
            //           ),
            //           Text(
            //             'IME Pay',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: darkYellow,
            //                 fontSize: 20),
            //           ),
            //           const SizedBox(
            //             width: 30,
            //           ),
            //           Text('    + 0.75 % \n RS. 705.25',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: darkYellow,
            //                   fontSize: 15)),
            //           const SizedBox(
            //             width: 55,
            //           ),
            //           const Icon(Icons.arrow_forward_ios)
            //         ],
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
