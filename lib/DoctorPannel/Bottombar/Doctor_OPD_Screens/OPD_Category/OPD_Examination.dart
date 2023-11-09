// ignore_for_file: file_names

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class OpdExamination extends StatefulWidget {
  const OpdExamination({Key? key}) : super(key: key);

  @override
  State<OpdExamination> createState() => _OpdExaminationState();
}

class _OpdExaminationState extends State<OpdExamination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Examination'),centerTitle: true,backgroundColor: darkYellow,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(child: Text('General Examination',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
        ],),
      ),
    );
  }
}