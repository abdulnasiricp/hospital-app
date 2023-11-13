// ignore_for_file: sized_box_for_whitespace, file_names

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class IpdMedication extends StatefulWidget {
  const IpdMedication({Key? key}) : super(key: key);

  @override
  State<IpdMedication> createState() => _IpdMedicationState();
}

class _IpdMedicationState extends State<IpdMedication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('IPD Medication'),
      //   centerTitle: true,
      //   backgroundColor: darkYellow,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.purple[100],
                color: Colors.green[100],
        
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Medication Dose',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.green[100],
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 2.2,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 2.2,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Medicine Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 4,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dosage',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 6,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Friquency',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 6,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'No of Days',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 6,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Qty',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: width / 6,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    // Set this to true to disable the keyboard
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Remarks',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 50,
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            )),
                      
                     Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Save'),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(darkYellow),
                                ),
                              )),
                        ),
                      
                        Container(
                          color: Colors.green[100],
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Medication Reports',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'S.No',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                   Text(
                                    'MID No',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                   Text(
                                    'View',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
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
