// ignore_for_file: avoid_unnecessary_containers, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, prefer_const_constructors

import 'package:TezHealthCare/bottomscreen/home/Models/all_doctor_model.dart';
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
  List<dynamic>? data = [];
  List<dynamic>? filteredData = []; 
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.post(
        Uri.parse(
            'https://uat.tez.hospital/xzy/webservice/getAllDoctor'), // Replace with your API endpoint
        // You can also add headers and request body here if needed
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });

    if (response.statusCode == 200) {
      DataMap = json.decode(response.body);
      setState(() {
        data = DataMap!['doctors'];
        filteredData = data; // Initialize filteredData with all data
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  void filterData(String query) {
    setState(() {
      filteredData = data?.where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 50,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (query) => filterData(query),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search your doctor',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    itemCount: filteredData!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: width / 2,
                              child: Card(
                                  color: Colors.white.withOpacity(0.9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              '${filteredData![index]['image']}', // Replace with your image URL
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
                                        // NetworkImage(
                                        //     DoneListData![
                                        //             index]
                                        //         ['image'])),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${filteredData![index]['name']} ${filteredData![index]['surname']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${filteredData![index]['specialization']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${filteredData![index]['qualification']} ',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
                                                BorderRadius.circular(10),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(() => SelectDateScreen());
                                            },
                                            child: Center(
                                              child: Text(
                                                'Book Appointment',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
        )));
  }
}
