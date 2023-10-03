
// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, avoid_print, file_names, unused_element, avoid_unnecessary_containers

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FacultyMembers extends StatefulWidget {
  const FacultyMembers({Key? key}) : super(key: key);

  @override
  State<FacultyMembers> createState() => _FacultyMembersState();
}

class _FacultyMembersState extends State<FacultyMembers> {
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
        NewListData = DoneListData
            ?.where((element) => element['name']
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text('selectFacultyMember'.tr),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Center(
            child: NewListData != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                            
                            onChanged: (value) {
                              _searchlist(value);
                            },
                            decoration: InputDecoration(

                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'searchFacultyMember'.tr,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                prefixIcon: const Icon(Icons.search)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: DoneListData!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: width,
                                  child: Card(
                                      color: Colors.white70.withOpacity(0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: width / 5,
                                              height: 100,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
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
                                                      fontWeight:
                                                      FontWeight.bold),
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
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.green),
                                                        )),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),

                                                    // Text('${DoneListData![index]['work_exp']},'),
                                                    Text(
                                                      '${DoneListData![index]['work_exp']}',
                                                      maxLines: 1,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator()));
  }
}
