// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

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
        title: const Text('confirmation'),
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
                          "Hosiptal Visit Appointment",
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
                                  'Dr. Justin Biber',
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
            const Text("Patient's information",
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
                            'Name:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mobile No.:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Gender:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Date of Birth:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Address:',
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
                          Text('Abdul Nasir'),
                          Text('+92 342-9107173'),
                          Text('Male'),
                          Text('07/04/2000'),
                          Text('karak pakistan'),
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
                const Text("Payment amount:",
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
            Text(
                'Please call and confirm at hospital if doctor is a availible at hospital on the day of appointment.',
                style: TextStyle(color: Colors.orange[900])),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Please Select any one to Pay.',
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: width,
                height: height / 10,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        width: width/5,
                        height: height,
                        child: Image.asset('assets/pay_logo.jpg'),
                      ),
                      Text('IME Pay',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 20),),
                      const SizedBox(
              width: 40,
            ),
                      Text('    + 1 % \n RS. 707.00',style: TextStyle( fontWeight: FontWeight.bold,color: darkYellow,fontSize: 15)),
                      const SizedBox(
              width: 50,
            ),
            const Icon(Icons.arrow_forward_ios)

                    ],
                  ),
                )),
                Container(
                width: width,
                height: height / 10,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        width: width/5,
                        height: height,
                        child: Image.asset('assets/esewa_logo.png'),
                      ),
                      Text('IME Pay',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 20),),
                      const SizedBox(
              width: 30,
            ),
                      Text('    + 0.75 % \n RS. 705.25',style: TextStyle( fontWeight: FontWeight.bold,color: darkYellow,fontSize: 15)),
                      const SizedBox(
              width: 55,
            ),
            const Icon(Icons.arrow_forward_ios)

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
