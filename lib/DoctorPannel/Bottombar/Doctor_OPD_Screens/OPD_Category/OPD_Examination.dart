// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class OpdExamination extends StatefulWidget {
  const OpdExamination({Key? key}) : super(key: key);

  @override
  State<OpdExamination> createState() => _OpdExaminationState();
}

class _OpdExaminationState extends State<OpdExamination> {
  List<String> generalCard = [
    "Pallors",
    "lcterus",
    "Cyanosis",
    "Clubbing",
    "Lymphadeno",
    "Oedema",
    "Dehydration"
  ];
  List<String> generalCardText = [];

  List<String> systematicCard = [
    "Respiratory",
    "Cardiovascular",
    "Abdominal",
    "genitourinary",
    "CNS",
    "Local"
  ];
  List<String> systematicCardText = [];
  List<TextEditingController> systematicCardControllers = [];

  @override
  void initState() {
    super.initState();

    // Initialize TextEditingControllers for each item in systematicCard
    for (int i = 0; i < systematicCard.length; i++) {
      systematicCardControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose of TextEditingControllers to avoid memory leaks
    for (var controller in systematicCardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      // appBar: AppBar(
      //   title: const Text('Examination'),
      //   centerTitle: true,
      //   backgroundColor: darkYellow, // Replace with your color
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  'General Examination',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: height/3,
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: generalCard.length,
                    itemBuilder: (context, index) {
                      return SelectableCard(
                        text: generalCard[index],
                        isSelected:
                            generalCardText.contains(generalCard[index]),
                        onSelect: () {
                          setState(() {
                            if (generalCardText.contains(generalCard[index])) {
                              generalCardText.remove(generalCard[index]);
                            } else {
                              generalCardText.add(generalCard[index]);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              Container(
                child: const Text(
                  'Systematic Examination',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Replacing Card with SelectableCard for each row
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Respiratory',
                      isSelected: systematicCardText.contains('Respiratory'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Respiratory')) {
                            systematicCardText.remove('Respiratory');
                          } else {
                            systematicCardText.add('Respiratory');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Cardiovascular',
                      isSelected: systematicCardText.contains('Cardiovascular'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Cardiovascular')) {
                            systematicCardText.remove('Cardiovascular');
                          } else {
                            systematicCardText.add('Cardiovascular');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Abdominal',
                      isSelected: systematicCardText.contains('Abdominal'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Abdominal')) {
                            systematicCardText.remove('Abdominal');
                          } else {
                            systematicCardText.add('Abdominal');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Genitourinary',
                      isSelected: systematicCardText.contains('Genitourinary'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Genitourinary')) {
                            systematicCardText.remove('Genitourinary');
                          } else {
                            systematicCardText.add('Genitourinary');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'CNS',
                      isSelected: systematicCardText.contains('CNS'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('CNS')) {
                            systematicCardText.remove('CNS');
                          } else {
                            systematicCardText.add('CNS');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: SelectableCard(
                      text: 'Local',
                      isSelected: systematicCardText.contains('Local'),
                      onSelect: () {
                        setState(() {
                          if (systematicCardText.contains('Local')) {
                            systematicCardText.remove('Local');
                          } else {
                            systematicCardText.add('Local');
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width / 1.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'write something'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(yellow),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onSelect;

  const SelectableCard(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect();
      },
      child: SizedBox(
        height: 30,
        child: Card(
          color: isSelected ? darkYellow : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
