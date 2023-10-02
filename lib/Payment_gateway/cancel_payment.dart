// ignore_for_file: sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CancelPaymentScreen extends StatefulWidget {
  const CancelPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CancelPaymentScreen> createState() => _CancelPaymentScreenState();
}

class _CancelPaymentScreenState extends State<CancelPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: width,
            height: height / 1.6,
            child: Card(
              elevation: 9,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      'Payment Cancel!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                      width: width / 3,
                      height: height / 7,
                      child: Lottie.asset('assets/cancel.json')),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 25.0, right: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Payment Mode',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Mobile',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Email',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Amount Paid',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 17)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Transaction id',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text('Net Banking',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('977 3232 4343',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('abc@gmail.com',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('5000',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 17)),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('12123434',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const Padding(padding: EdgeInsets.all(10),
                  child: Text('payment Cancelled'),),
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
                            width: width / 3,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
        ),
      ),
    );
  }
}
