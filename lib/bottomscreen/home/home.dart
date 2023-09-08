import 'package:TezHealthCare/bottomscreen/home/search.dart';
import 'package:TezHealthCare/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  Get.to(() => const Notif());
                },
                icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 50,
                    height: 40,
                    child: const Icon(Icons.notifications))),
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  Get.to(()=>const Search());
                },
                icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 50,
                    height: 40,
                    child: const Icon(Icons.search))),
          ],
          // backgroundColor: Utils.appbarColor,
          // foregroundColor: Utils.appbarForgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Friday, 4 Sep'),
                const Text(
                  'Hi, Dr.Abdul Nasir',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
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
                                  child: Image.asset('assets/doctor.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Doctors",
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
                                  child: Image.asset('assets/Dentist.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Dentist",
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
                                  child: Image.asset('assets/ambulance.png')),
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
                                  child: Image.asset('assets/medisin.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Medicine",
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
                                  child: Image.asset('assets/eye.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Eye",
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
                                  child: Image.asset('assets/care.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Care",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Hire Now ",
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
                          width: 130, child: Image.asset('assets/drtwo.png')),
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
                      const SizedBox(width: 20,),

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
                      const SizedBox(width: 20,),

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
                          width: 130, child: Image.asset('assets/drtwo.png')),
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
                      const SizedBox(width: 20,),

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
        ),
      ),
    );
  }
}
