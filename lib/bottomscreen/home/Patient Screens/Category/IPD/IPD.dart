import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Pathology_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/ambulance_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/bloodbank.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/pharmacy_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/radiology_bill.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
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
                                  Get.to(() => const DirectBill());
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
                                onTap: () {
                                  Get.to(() => const PathologyBill());
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
                                onTap: () {
                                  Get.to(() => const RadiologyBill());
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
                                onTap: () {
                                  Get.to(() => const BloodBank());
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
                                onTap: () {
                                  Get.to(() => const PharmacyBill());
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
                                onTap: () {
                                  Get.to(() => const AmbulanceBill());
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
                    padding: EdgeInsets.all(16.0),
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
                        Text(
                          'Patient Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Patient Name: Ramjinish Kushwaha'),
                        Text('Age: 24'),
                        Text('Gender: Male'),
                        Text('Date of Admission: 2023-09-26'),
                        SizedBox(height: 32),
                        Text(
                          'Vitals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        buildVitalItem('Height', '75 bpm'),
                        buildVitalItem('Weight', '120/80 mmHg'),
                        buildVitalItem('BP', '98.6°F'),
                        buildVitalItem('Pulse', '18 breaths/min'),
                        buildVitalItem('Tempreture', '18 breaths/min'),
                        buildVitalItem('Respiration', '98.6°F'),
                        SizedBox(height: 32),
                        Text(
                          'Consultants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Diagnosis: Ramjinish kushwaha'),
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
