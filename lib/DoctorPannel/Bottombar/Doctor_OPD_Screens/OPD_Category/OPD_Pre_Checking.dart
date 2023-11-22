// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class OpdPreChecking extends StatefulWidget {
  const OpdPreChecking({Key? key}) : super(key: key);

  @override
  State<OpdPreChecking> createState() => _OpdPreCheckingState();
}

class _OpdPreCheckingState extends State<OpdPreChecking> {
  late DateTime selectedDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController vdcMunicipalityController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController toleController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _unUsedFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pre- Checking"),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        backgroundColor: Colors.lightBlue[50],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Symptoms',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            readOnly: false,
                            focusNode: _focusNode,
                            onTapOutside: (PointerDownEvent event) {
                              FocusScope.of(context)
                                  .requestFocus(_unUsedFocusNode);
                            },
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Past History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width / 2.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' Work Profie History',
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
                              ' Social History',
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
                              ' Past Medical History',
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
                              ' Current medication',
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'General History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width / 2.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' Any Known Allergies',
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
                              ' Family History',
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
                              ' Recent Report',
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
                              ' Birth History',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 45,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: true),
                                onFieldSubmitted: (value) {
                                  // Handle form submission, e.g., validate and process the input
                                  // You can also manually close the keyboard if needed
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
        ));
  }

  Widget buildGenderCard(
      {required IconData icon, required String label, required String gender}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width / 4,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
