

// ignore_for_file: file_names, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/credentials.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/devices.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/notification_ids.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DevicesAndCredentials extends StatefulWidget {
  const DevicesAndCredentials({Key? key}) : super(key: key);

  @override
  State<DevicesAndCredentials> createState() => _DevicesAndCredentialsState();
}

class _DevicesAndCredentialsState extends State<DevicesAndCredentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: darkYellow,
            title: const Text('Devices and Credentials'),
            bottom: TabBar(
              indicatorColor: Colors.amber,

              tabs: [
                Tab(
                    child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/dev.svg',
                      width: 30,
                      height: 30,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 2,),

                    const Text('Devices')
                  ],
                )),
                 Tab(child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/credentials.svg',
                      width: 30,
                      height: 30,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 2,),

                    const Text('Credentials')
                  ],
                )),
                 Tab(child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/notification.svg',
                      width: 30,
                      height: 30,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 2,),
                    const Text('Notification IDs')
                  ],
                )),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Devices(),
              Credentials(),
              NotificationIds(),
            ],
          ),
        ),
      ),
    );
  }
}
