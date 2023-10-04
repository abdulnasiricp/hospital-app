import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermAndConditionsScreen extends StatefulWidget {
  const TermAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionsScreen> createState() => _TermAndConditionsScreenState();
}

class _TermAndConditionsScreenState extends State<TermAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('termsAndCondition'.tr),centerTitle: true,backgroundColor: darkYellow,),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('termsAndCondition'.tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            const SizedBox(height: 30,),
            Text('termsAndConditionMsg'.tr)
      
            
          ],
        ),
      ),
    ),
    );
  }
}