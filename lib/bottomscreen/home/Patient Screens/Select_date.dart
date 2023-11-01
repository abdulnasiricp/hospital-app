// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Doctor_profile.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Old_or_newPatient.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SelectDateScreen extends StatefulWidget {
  final String doctorImage;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String workExp;
  const SelectDateScreen(
      {Key? key,
      required this.doctorImage,
      required this.doctorName,
      required this.doctorSpecialization,
      required this.doctorId,
      required this.workExp})
      : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('selectADate'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => DoctorProfile(
                    doctorId: widget.doctorId,
                    doctorImage: widget.doctorImage,
                    doctorName: widget.doctorName,
                    doctorSpecialization: widget.doctorSpecialization,
                    workExp: widget.workExp,
                  ));
            },
            icon: SvgPicture.asset(
              'assets/info1.svg',
              width: 25,
              height: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: 100,
                        child: Image.network(
                          widget.doctorImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctorName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(widget.doctorSpecialization),
                            Text(widget.doctorId)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.to(() => const OldorNewPatientScreen());
                },
                child: Card(
                  color: Colors.white,
                  child: Container(
                    width: width,
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                            height: height,
                            width: width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('14',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: darkYellow,
                                        fontSize: 30)),
                                const Text('  Thuesday'),
                              ],
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '[14/09/2023]  [14/09/2030] ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '           (4 token left)',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const OldorNewPatientScreen());
                },
                child: Card(
                  color: Colors.white,
                  child: Container(
                    width: width,
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                            height: height,
                            width: width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('16',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: darkYellow,
                                        fontSize: 30)),
                                const Text('  Friday'),
                              ],
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '[16/09/2023]  [16/09/2030] ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '           (5 token left)',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                          height: height,
                          width: width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('18',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: darkYellow,
                                      fontSize: 30)),
                              const Text('  sunday'),
                            ],
                          )),
                      const SizedBox(
                        width: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '[14/09/2023]  [18/09/2030] ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '           (3 token left)',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                          height: height,
                          width: width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: darkYellow,
                                      fontSize: 30)),
                              const Text('  Thuesday'),
                            ],
                          )),
                      const SizedBox(
                        width: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '[20/09/2023]  [12/09/2030] ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '           (4 token left)',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                          height: height,
                          width: width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('22',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: darkYellow,
                                      fontSize: 30)),
                              const Text('  Friday'),
                            ],
                          )),
                      const SizedBox(
                        width: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '[22/09/2023]  [14/09/2030] ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '           (7 token left)',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
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
