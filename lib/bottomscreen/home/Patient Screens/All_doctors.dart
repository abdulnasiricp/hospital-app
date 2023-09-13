// ignore_for_file: avoid_unnecessary_containers

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

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
  List<dynamic>? DoneListData;

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
  }

  @override
  void initState() {
    hitApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                prefixIcon: Icon(Icons.search)),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: DoneListData!.length,
                              itemBuilder: (context, index) {
                                return  SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: height/2,
                                        width: width/2,
                                        child: Card(

                                          child: Column(children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage('assets/logo.png'),

                                            ),
                                            Text('Name:${DoneListData![index]['name']}'),
                                            Text('specialization:${DoneListData![index]['specialization']}'),
                                          ],)
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator()));
  }
}
