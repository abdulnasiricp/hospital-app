// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, file_names

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/All_doctors.dart';
import 'package:TezHealthCare/custtom/doctorlist/custtomdoctorlist.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  String role = '', username = '';
  String record = '', genderrecord = '';

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role = sharedPreferences.getString('role') ?? '';
    username = sharedPreferences.getString('usernamerecord') ?? '';
    record = sharedPreferences.getString('record') ?? '';
    genderrecord = sharedPreferences.getString('genderrecord') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 100,
          title: const Text("प्रादेशिक अस्पताल सिराहा, नेपाल",
            maxLines: 1,
            overflow: TextOverflow.ellipsis, ),
          // centerTitle: true,
          leading:  Padding(
            padding: const EdgeInsets.all(8.0),
            child:Image.asset('assets/hospital_logo.png',
              width: 200,  height: 200,
            )
            
          ),
          actions: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  Get.to(() => const Notif());
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )
            ),
            // IconButton(
            //     color: Colors.blue,
            //     onPressed: () {
            //       Get.to(() => const Search());
            //     },
            //     icon: const Icon(
            //       Icons.search,
            //       color: Colors.white,
            //     )),
          ],
          backgroundColor: darkYellow,
          elevation: 0,
      
          // foregroundColor: Utils.appbarForgroundColor,
        ),
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome,\n $username',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: darkYellow),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Category",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        InkWell(
                          onTap: () {
                            Get.to(() => const AllDoctorsList());
                          },
                          child: const Text("View All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => Doctorlist(
                                    "assets/ucla.png",
                                    Colors.transparent,
                                    EnString.columbiaAsiaHospital,
                                    EnString.bangaloreKarnataka,
                                    "16 km",
                                    width / 7));
                              },
                              child: Card(
                                borderOnForeground: true,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                            'assets/transation.png')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("Transactions",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset('assets/credit.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Card",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/inpatient.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("IPD",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/OPD_Icon.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("OPD",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/pathology.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Pathology",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/radiology.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Radiology",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/pharmacy.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Pharmacy",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset('assets/USG.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("USG",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset('assets/surgery.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Surgery",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/bloodbank.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Blood Bank",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/ambulance.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Ambulance",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset(
                                          'assets/physioTherpy.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Physio Therapy",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset(
                                          'assets/certificate.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Certificates",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child:
                                          Image.asset('assets/bedHistory.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Bed History",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                      child: Image.asset(
                                          'assets/liveConsulations.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("      Live \nConsultations",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Doctors",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        InkWell(
                          onTap: () {
                            Get.to(() => const AllDoctorsList());
                          },
                          child: const Text("View All",
                              style: TextStyle(
                                fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Card(
                        child: Row(children: [
                          Container(
                            width: 130,
                            child: Image.asset('assets/drone.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Dr. Chhaya Gaikvad',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Angiolory'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text('4.5(835)')
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [Icon(Icons.location_on), Text('2 KM')],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Card(
                        child: Row(children: [
                          Container(
                              width: 130,
                              child: Image.asset('assets/drtwo.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Dr. Justin Biber',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Angiolory'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text('4.5(835)')
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [Icon(Icons.location_on), Text('2 KM')],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Card(
                        child: Row(children: [
                          Container(
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/drthree.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Dr. Maria Anna',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Angiolory'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text('4.5(835)')
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [Icon(Icons.location_on), Text('2 KM')],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Hire Expert",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Card(
                        child: Row(children: [
                          Container(
                            width: 130,
                            child: Image.asset('assets/drone.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Dr. Chhaya Gaikvad',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Angiolory'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text('4.5(835)')
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [Icon(Icons.location_on), Text('2 KM')],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Card(
                        child: Row(children: [
                          Container(
                              width: 130,
                              child: Image.asset('assets/drtwo.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Dr. Justin Biber',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Angiolory'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text('4.5(835)')
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              children: [Icon(Icons.location_on), Text('2 KM')],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
