// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
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
      appBar: AppBar(
        title: const Text('Examination'),
        centerTitle: true,
        backgroundColor: darkYellow, // Replace with your color
      ),
      body: Padding(
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
              height: 200,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: generalCard.length,
                  itemBuilder: (context, index) {
                    return SelectableCard(
                      text: generalCard[index],
                      isSelected: generalCardText.contains(generalCard[index]),
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
            Row(
              children: [
                Container(
                  height: 40,
                  width: 100,
                  child: const Card(
                    child: Center(child: Text('Respiratory')),
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
