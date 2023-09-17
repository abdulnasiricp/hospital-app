// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RadiologyBill extends StatefulWidget {
  const RadiologyBill({Key? key}) : super(key: key);

  @override
  State<RadiologyBill> createState() => _RadiologyBillState();
}

class _RadiologyBillState extends State<RadiologyBill> {

   Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];

  Future hitApi() async {
    final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllPayment'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['radiology_bill'];
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
        backgroundColor: Colors.white.withOpacity(0.9),
       
        body: Center(
            child: DoneListData != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: width,
                          height: height,
                          child: ListView.builder(
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
                                              child:CircleAvatar(child: Text(DoneListData![index]['id']??""),)
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text("Total :${DoneListData![index]['total']??""}"),
                                                // Text(
                                                //   'Name: ${DoneListData![index]['patient_name']??"khan"}',
                                                //   style: const TextStyle(
                                                //       fontWeight:
                                                //           FontWeight.bold),
                                                // ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              //  Text(
                                                  // 'paid amount${DoneListData![index]['net_amount']}',
                                                  
                                                  // style: const TextStyle(
                                                  //     color: Colors.blue),
                                                // ),
                                                
                                                   
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                 Text(
                                                  'Date: ${DoneListData![index]['date']}',
                                                  
                                                  style: const TextStyle(
                                                      color: Colors.blue),
                                                ),
                                               
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                      
                              }),
                        ),
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
