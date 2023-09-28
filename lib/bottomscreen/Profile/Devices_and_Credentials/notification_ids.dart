// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationIds extends StatefulWidget {
  const NotificationIds({Key? key}) : super(key: key);

  @override
  State<NotificationIds> createState() => _NotificationIdsState();
}

class _NotificationIdsState extends State<NotificationIds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Card(
              child: ListTile(
                leading: SvgPicture.asset('assets/dev.svg',width: 25,height: 25,color: Colors.green,),
                title: const Text('Mobile Number'),
                subtitle: const Text('03429107137'),
                trailing: const Icon(Icons.more_vert),
            
              ),
            ),
          ),
          Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),

            child: Card(
              child: ListTile(
                leading: SvgPicture.asset('assets/dev.svg',width: 25,height: 25,color: Colors.green,),
                title: const Text('Email Address'),
                subtitle: const Text('abdulnasiricp"gmail.com'),
                trailing: const Icon(Icons.more_vert),
            
              ),
            ),
          ),
        ],
      ),
    );
  }
}
