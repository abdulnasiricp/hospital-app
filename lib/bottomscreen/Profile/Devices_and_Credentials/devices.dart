// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_print, unnecessary_string_interpolations, deprecated_member_use

import 'dart:io';

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String? deviceName = 'Unknown';
    String? deviceVersion = 'Unknown';
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
      _deviceName = deviceName!;
      _deviceVersion = deviceVersion!;
    });
  }


  getData()async{
    // LoadData();
     getDeviceInfo();
    _loadLoginDateTime();

  }

  @override
  void initState() {

   getData();


    super.initState();
  }
  String loginDateTime = '';

 

  _loadLoginDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginDateTime = prefs.getString('loginDateTime') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
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
                height: height / 6,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                              color: darkYellow,
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
                        height: 10,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('App version'),
                              Text("version $_deviceVersion"),
                              // Text('Device Model: $_modelName',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text('Added on'),
                              Text(loginDateTime),
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
