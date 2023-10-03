// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationIds extends StatefulWidget {
  const NotificationIds({Key? key}) : super(key: key);

  @override
  State<NotificationIds> createState() => _NotificationIdsState();
}

class _NotificationIdsState extends State<NotificationIds> {
  late   String mobilerecord = '';
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    mobilerecord = sp.getString('mobilerecord') ?? '';
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }
  @override
  void initState() {
     LoadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset('assets/dev.svg',width: 25,height: 25,color: darkYellow,),
                title: Text('mobileNumber'.tr),
                subtitle: Text(mobilerecord),
                trailing: const Icon(Icons.more_vert),
            
              ),
            ),
          ),
          Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),

            child: Card(
              child: ListTile(
                leading: SvgPicture.asset('assets/dev.svg',width: 25,height: 25,color: darkYellow,),
                title :Text('emailAddress'.tr),
                subtitle: const Text('Example@gmail.com'),
                trailing: const Icon(Icons.more_vert),
            
              ),
            ),
          ),
        ],
      ),
    );
  }
}
