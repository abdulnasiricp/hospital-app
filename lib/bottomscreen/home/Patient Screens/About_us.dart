// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print, unused_element

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Faculty_member.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({Key? key}) : super(key: key);
  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  final List<String> imgList = [
    'https://tse1.mm.bing.net/th?id=OIP.rf_UTwDKG7XALHaGmsYesQHaFj&pid=Api&P=0&h=180',
    'https://i.pinimg.com/originals/eb/35/91/eb3591c54fb651f20d157ed7099c4576.jpg',
    'https://www.medylife.com/blog/wp-content/uploads/2017/10/Best-Cardiology-Hospital.jpg',
    'https://northernvirginiamag.com/wp-content/uploads/2020/12/hospital.jpg',
    'https://www.krausanderson.com/wp-content/uploads/2018/11/01_U-of-M-Masonic-Childrens-Hospital-Amplatz-Exterior-View-of-Courtyard-Old-Hospital-and-New-Addition-1920x1080.jpg',
    'https://yesofcorsa.com/wp-content/uploads/2017/05/Hospital-Wallpaper.jpg',
    'https://s3.amazonaws.com/uchealth-wp-uploads/wp-content/uploads/sites/6/2018/01/02032200/UCHealth_Memorial_Hospital_Central_Morning.jpgeee.jpg',
    'https://media.consumeraffairs.com/files/news/Hospital_building_JazzIRT_GI.jpg',
  ];

  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
  List<dynamic>? NewListData = [];
  Future hitApi() async {
    final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['doctors'];
        print(DoneListData);
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
    for (var i = 0; i < DoneListData!.length; i++) {
      NewListData?.add({
        "name": DoneListData?[i]["name"],
        "id": DoneListData?[i]["id"],
        "email": DoneListData?[i]["email"],
      });
    }
    //TO SHOW ALL LIST AT INITIAL
    setState(() {
      NewListData = DoneListData;
    });
  }

  @override
  void initState() {
    hitApi();
    super.initState();
  }

  void _searchlist(String value) {
    setState(() {
      if (value.isEmpty) {
        NewListData = DoneListData;
      } else {
        NewListData = DoneListData?.where((element) => element['name']
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())).toList();
      }
    });
  }

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
                child: CarouselSlider(
                    items: imgList
                        .map((item) => Container(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        aspectRatio: 2.0,
                        autoPlay: true,
                        enlargeCenterPage: true)),
              ),

              // Container(
              //   height: height / 3,
              //   width: width,
              //   child: Image.asset(
              //     'assets/ucla.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: height / 3.5, left: width / 25, right: width / 25),
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
                                    'Sirha Provincial Hospital',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                      "प्रादेशिक अस्पताल सिराहा \nसिरहा , नेपाल"),
                                  const Text("Siraha Hospital, Siraha 56500"),
                                  Container(
                                    height: 50,
                                    width: 175,
                                    child: Card(
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
                      Get.offAll(() => const FacultyMembers());
                    },
                    child: const Text("All Members",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: DoneListData!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Container(
                            width: width,
                            child: Card(
                               
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width / 5,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            '${DoneListData![index]['image']}', // Replace with your image URL
                                            width:
                                                200.0, // Set the width (optional)
                                            height:
                                                200.0, // Set the height (optional)
                                            fit: BoxFit
                                                .cover, // Set the BoxFit (optional)
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return CircularProgressIndicator(
                                                  color: darkYellow,
                                                  backgroundColor: yellow,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dr. ${DoneListData![index]['name']} ${DoneListData![index]['surname']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${DoneListData![index]['specialization']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.blue),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${DoneListData![index]['contact_no']}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${DoneListData![index]['email']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            // style: const TextStyle(
                                            //     fontWeight:
                                            //     FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              // Text('${DoneListData![index]['qualification']},'),
                                              Container(
                                                  child: Text(
                                                '${DoneListData![index]['qualification']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                        
                                              // Text('${DoneListData![index]['work_exp']},'),
                                              Text(
                                                '${DoneListData![index]['work_exp']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
