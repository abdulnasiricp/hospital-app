// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class OpdInvestigation extends StatefulWidget {
  const OpdInvestigation({Key? key}) : super(key: key);

  @override
  State<OpdInvestigation> createState() => _OpdInvestigationState();
}

class _OpdInvestigationState extends State<OpdInvestigation> {
   String selectedDiagnosisType = '';
  TextEditingController diagnosisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investigation'),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Diagnosis',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.green[300],
              child: const Center(
                  child: Text(
                'Diagnosis',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child:  Center(
                  child:    InkWell(
                        child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      readOnly:
                          true, // Set this to true to disable the keyboard
                      controller: diagnosisController,
                      decoration: const InputDecoration(
                      
                        border: OutlineInputBorder(),
                        hintText: 'Select options',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        selectDiagnosisOptions(context);
                      },
                    )),
              ),
            ),
            SizedBox(height: 10,),
             const Text(
              'Pathology',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.green[300],
              child: const Center(
                  child: Text(
                'Test Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child:  Center(
                  child:    InkWell(
                        child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      readOnly:
                          true, // Set this to true to disable the keyboard
                      controller: diagnosisController,
                      decoration: const InputDecoration(
                      
                        border: OutlineInputBorder(),
                        hintText: 'Select options',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        selectDiagnosisOptions(context);
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

    void selectDiagnosisOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Create a list with "Emergency" and "General" only
            List<Map<String, dynamic>> combinedData = [
              { "name": "Diagnosis 1"},
              { "name": "Diagnosis 2"},
              { "name": "Diagnosis 3"},
              { "name": "Diagnosis 4"},
              { "name": "Diagnosis 5"},
            ];

            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Options',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                          child: ListView.builder(
                            itemCount: combinedData.length,
                            itemBuilder: (BuildContext context, int index) {
                              String item = combinedData[index]["name"];
                              return Card(
                                color: Colors.white70.withOpacity(0.7),
                                child: ListTile(
                                  title: Text(
                                    '$item',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                   
                                    selectedDiagnosisType = item;
                                    diagnosisController.text =
                                        '$selectedDiagnosisType';
                                    Navigator.of(context).pop();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
