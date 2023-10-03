

// ignore_for_file: file_names, deprecated_member_use

import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/credentials.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/devices.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Devices_and_Credentials/notification_ids.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            title:  Text('devicesAndCredentials'.tr),
            bottom: TabBar(
              indicatorColor: yellow,

              tabs: [
                Tab(
                    child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/dev.svg',
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 1,),

                     Text('devices'.tr)
                  ],
                )),
                 Tab(child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/credentials.svg',
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 1,),

                     Text('credentials'.tr)
                  ],
                )),
                 Tab(child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/notification.svg',
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 1,),
                    Text('notificationIDs'.tr)
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
