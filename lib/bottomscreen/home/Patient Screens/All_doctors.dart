// ignore_for_file: avoid_unnecessary_containers, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, prefer_const_constructors

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class AllDoctorsList extends StatefulWidget {
  const AllDoctorsList({Key? key}) : super(key: key);

  @override
  State<AllDoctorsList> createState() => _AllDoctorsListState();
}

class _AllDoctorsListState extends State<AllDoctorsList> {
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

    NewListData = DoneListData;
  }

  void _searchlist(String value) {
    if (value.isEmpty) {
      NewListData = DoneListData;
    } else {
      NewListData = DoneListData?.where((element) => element['name']
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())).toList();
    }
  }

  @override
  void initState() {
    hitApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('Select a Doctor'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Center(
            child: DoneListData != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextField(
                            onChanged: (value) {
                              _searchlist(value);
                            },
                            onSubmitted: ((value) {}),
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search your doctor',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 0),
                              itemCount: DoneListData!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: width / 2,
                                        child: Card(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          'assets/logo.png')),
                                                  // NetworkImage(
                                                  //     DoneListData![
                                                  //             index]
                                                  //         ['image'])),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${DoneListData![index]['name']} ${DoneListData![index]['surname']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      '${DoneListData![index]['specialization']}'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      '${DoneListData![index]['qualification']} '),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: width,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      color: yellow,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            SelectDateScreen());
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Book Appointment',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: darkYellow,
                  ))));
  }
}
