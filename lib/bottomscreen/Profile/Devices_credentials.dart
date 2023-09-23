// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class DevicesAndCredentials extends StatefulWidget {
  const DevicesAndCredentials({Key? key}) : super(key: key);

  @override
  State<DevicesAndCredentials> createState() => _DevicesAndCredentialsState();
}

class _DevicesAndCredentialsState extends State<DevicesAndCredentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Devices & Credentials'),),);
  }
}