// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_print

import 'dart:io';

import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Devices extends StatefulWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  String _deviceName = 'Unknown'; // Default value
  String _deviceVersion = 'Unknown'; // Default value

  Future getDeviceInfo() async {
    var device = DeviceInfoPlugin();
    String deviceName = 'Unknown';
    String deviceVersion = 'Unknown';
    if (Platform.isAndroid) {
      var androidInfo = await device.androidInfo;
      deviceName = androidInfo.model;
      deviceVersion = androidInfo.version.release;
      deviceVersion = androidInfo.version.release;
      print(androidInfo.device);
    } else if (Platform.isIOS) {
      var iosInfo = await device.iosInfo;
      deviceName = iosInfo.name;
      deviceVersion = iosInfo.systemVersion;

    }
    setState(() {
      // Assuming you have a variable to store the device name
      _deviceName = deviceName;
      _deviceVersion = deviceVersion;
    });
  }

  @override
  void initState() {
    getDeviceInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.2),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: width,
                height: height / 5,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/dev.svg',
                              color: Colors.green,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$_deviceName',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('App version'),
                              Text("$_deviceVersion"),
                              // Text('Device Model: $_modelName',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Added on'),
                              Text('27-09-2023,9:15'),
                              Text('Get Device info')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
