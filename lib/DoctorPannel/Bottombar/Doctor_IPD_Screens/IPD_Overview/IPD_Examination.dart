// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
// ... (your existing code)

class IpdExamination extends StatefulWidget {
  const IpdExamination({Key? key}) : super(key: key);

  @override
  State<IpdExamination> createState() => _IpdExaminationState();
}

class _IpdExaminationState extends State<IpdExamination> {
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
  List<String> systematicCardText = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                const Text(
                  'Vitals',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                
             
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: width / 4.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Height',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width / 4.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Weight',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width / 4.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' BP',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width / 4.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Pulse',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: width / 2.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Temperature',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: width / 2.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Respiration',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),

              Container(
                child: const Text(
                  'General Examination',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
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
                      isSelected:
                            systematicCardText.contains('Respiratory'),
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
                     isSelected:
                            systematicCardText.contains('Cardiovascular'),
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
                     isSelected:
                            systematicCardText.contains('Abdominal'),
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
                     isSelected:
                            systematicCardText.contains('Genitourinary'),
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
                      isSelected:
                            systematicCardText.contains('CNS'),
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
                     isSelected:
                            systematicCardText.contains('Local'),
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
                      backgroundColor: MaterialStateProperty.all(darkYellow),
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