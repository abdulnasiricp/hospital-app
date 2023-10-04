// ignore_for_file: file_names, sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/IPD/Madication.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class IPD extends StatefulWidget {
  const IPD({Key? key}) : super(key: key);

  // classonst IPD({super.key});

  @override
  State<IPD> createState() => _IPDState();
}

class _IPDState extends State<IPD> {
  late ColorNotifier notifier;
  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
          appBar: AppBar(
            title: const Text('IPD'),
            centerTitle: true,
            backgroundColor: darkYellow,
            // elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Card(
              elevation: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap:
                                true, // Set to true to make the GridView scrollable within the Column
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(()=>const MedicationScreen());
                                },

                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/Medication.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Medication",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(

                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/bill.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Cardex",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(

                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/surgery.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Surgery",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/Diagnosis.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Diagnosis",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(

                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/Maternity.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Maternity",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(

                                child: Container(
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
                                          child: SvgPicture.asset(
                                              'assets/bed_history.svg',
                                              width: 15,
                                              height: 15,
                                              color: darkYellow),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Bed History",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Patient Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Patient Name: Ramjinish Kushwaha'),
                        const Text('Age: 24'),
                        const Text('Gender: Male'),
                        const Text('Date of Admission: 2023-09-26'),
                        const SizedBox(height: 32),
                        const Text(
                          'Vitals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buildVitalItem('Height', '75 bpm'),
                        buildVitalItem('Weight', '120/80 mmHg'),
                        buildVitalItem('BP', '98.6°F'),
                        buildVitalItem('Pulse', '18 breaths/min'),
                        buildVitalItem('Tempreture', '18 breaths/min'),
                        buildVitalItem('Respiration', '98.6°F'),
                        const SizedBox(height: 32),
                        const Text(
                          'Consultants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Diagnosis: Ramjinish kushwaha'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildVitalItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
