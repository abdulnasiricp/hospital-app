// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpdListScreen extends StatefulWidget {
  const OpdListScreen({Key? key}) : super(key: key);

  @override
  State<OpdListScreen> createState() => _OpdListScreenState();
}

class _OpdListScreenState extends State<OpdListScreen> {


  // Future <void> loadApiData(){
  //   String url='https://uat.tez.hospital/xzy/webservice/getOPDDetails';
  //   List list =[];
  //   var 

  // }
 
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData;

  Future hitApi() async {
    final response =
        await http.post(Uri.parse('https://uat.tez.hospital/xzy/webservice/getOPDDetails'),
         body: {
          "patient_id": "10765"
        },
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['patientdetails'];
        print(DoneListData);
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    hitApi();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPD List'),
        centerTitle: true,
      ),
    );
  }
}
