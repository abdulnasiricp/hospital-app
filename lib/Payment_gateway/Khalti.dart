// ignore_for_file: file_names

import 'package:flutter/material.dart';

class KhaltiPage extends StatelessWidget {
  const KhaltiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khalti Page'),
      ),
      body: const Center(
        child: Text('Khalti Payment Method Selected'),
      ),
    );
  }
}