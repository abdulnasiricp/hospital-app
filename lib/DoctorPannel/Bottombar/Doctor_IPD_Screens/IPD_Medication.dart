// ignore_for_file: sized_box_for_whitespace, file_names, unused_local_variable

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class IpdMedication extends StatefulWidget {
  const IpdMedication({Key? key}) : super(key: key);

  @override
  State<IpdMedication> createState() => _IpdMedicationState();
}

class _IpdMedicationState extends State<IpdMedication> {
  List<Widget> addMedicationrows = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              Container(
                                width: width / 7,
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              Container(
                                width: width / 7,
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              Container(
                                width: width / 7,
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              Container(
                                width: width / 7,
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
                                ' ',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              Container(
                                width: width / 9,
                                // height: 40,
                                child: Center(
                                  child: CircleAvatar(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            // Add a new row when the "Add" button is clicked
                                            addMedicationrows
                                                .add(observationBuildRow());
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: whitecolor,
                                        ),
                                        ),
                            backgroundColor: Colors.green,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 80,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: addMedicationrows.length,
                                itemBuilder: (context, index) {
                                  return addMedicationrows[index];
                                },
                              ),
                            ),
                          ],
                        ),
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
                              Text(
                                'Medication Reports',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'S.No',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'MID No',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'View',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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

  Widget observationBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
       const SizedBox(width: 2,),
       
        Container(
          width: width / 7,
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
       const SizedBox(width: 2,),
       
       Container(
          width: width / 7,
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
       const SizedBox(width: 2,),
      
       Container(
          width: width / 7,
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
       const SizedBox(width: 2,),
        Container(
          width: width / 7,
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
        Container(
          width: width / 9,
          // height: 40,
          child: Center(
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      // Remove the row when the "Cancel" button is clicked
                      addMedicationrows.removeLast();
                    });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: whitecolor,
                  )),
              // radius: 17,
              backgroundColor: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
