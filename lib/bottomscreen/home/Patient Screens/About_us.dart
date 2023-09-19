// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Faculty_member.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({Key? key}) : super(key: key);

  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: height / 3,
                width: width,
                child: Image.asset(
                  'assets/ucla.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 4, left: 20, right: 20),
                child: Container(
                  height: height / 3.5,
                  width: width,
                  // color: Colors.white,
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset('assets/mayao.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Civil service Hospital',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                      "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल"),
                                  const Text("Main Bhawan, Kathmandu"),
                                  Container(
                                    height: 50,
                                    width: 175,
                                    child: Card(
                                      color: Colors.white.withOpacity(.9),
                                      child: const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              '   200 \n General',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              '     20 \n ICU/CCU',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              '     20 \n Emergency',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            child: const Row(
                              children: [
                                Icon(Icons.phone, color: Colors.blue),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('01-410235000')
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('View Location')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Faculty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  InkWell(
                    onTap: () {
                      Get.to(() => const FacultyMembers());
                    },
                    child: const Text("All Members",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ),
                ],
              ),
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
                  Container(width: 130, child: Image.asset('assets/drtwo.png')),
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
    );
  }
}
