// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class RadiologyBill extends StatefulWidget {
  const RadiologyBill({Key? key}) : super(key: key);

  @override
  State<RadiologyBill> createState() => _RadiologyBillState();
}

class _RadiologyBillState extends State<RadiologyBill> {
 bool isloading=false;

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
        DoneListData = DataMap!['pathology_bill'];
        print(DoneListData);
        isloading=false;
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
  }
  @override
  void initState() {
    hitApi();
    super.initState();
    setState(() {
      isloading=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Shimmer(
      gradient: const LinearGradient(colors: [Colors.blue,Colors.white]),
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
         
          body: Center(
              child:
                  Padding(
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
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Bill No.: ${DoneListData![index]['id']??""}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                  TextButton.icon(onPressed: (){}, icon: const Icon(Icons.view_list), label: const Text('View'))
    
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                                                children: [
                                                 Text(
                                                    'Date: ${DoneListData![index]['date']}',
                                                    
                                                    style: const TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                  
                                                  Container(
                                                    height: 20,
                                                    width: width/3,
                                                    decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(5)
    
                                                    ),
                                                    child: Center(child: Text("Total :${DoneListData![index]['total']??""}",style: const TextStyle(fontWeight: FontWeight.bold),))),
                                                
                                                
                                                   
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                                 Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Doctor: ${DoneListData![index]['doctor_name']??""}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    
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
                  )),
    );
  }
}
