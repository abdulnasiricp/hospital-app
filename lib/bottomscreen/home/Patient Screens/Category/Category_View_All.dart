import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category_View_All extends StatefulWidget {
  @override
  State<Category_View_All> createState() => _Category_View_AllState();
}

class _Category_View_AllState extends State<Category_View_All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text('Category'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap:
              true, // Set to true to make the GridView scrollable within the Column
          children: [

            Container(
              width: 100,
              height: 100,
              child: InkWell(
                child: Card(
                  borderOnForeground: true,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/transation.png')),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Transactions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/credit.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Card",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/inpatient.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("IPD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/OPD_Icon.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("OPD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/pathology.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Pathology",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/radiology.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Radiology",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/pharmacy.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Pharmacy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/USG.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("USG",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/surgery.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Surgery",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/bloodbank.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Blood Bank",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/ambulance.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Ambulance",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/physioTherpy.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Physio Therapy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/certificate.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Certificates",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/bedHistory.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Bed History",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
            Container(
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
                        child: Image.asset('assets/liveConsulations.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("      Live \nConsultations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
