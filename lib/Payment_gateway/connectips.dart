import 'package:flutter/material.dart';

class IpsPage extends StatelessWidget {
  const IpsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect IPS Page'),
      ),
      body: const Center(
        child: Text('Connect IPS Payment Method Selected'),
      ),
    );
  }
}