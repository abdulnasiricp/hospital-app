import 'package:flutter/material.dart';

class EsewaPage extends StatelessWidget {
  const EsewaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esewa Page'),
      ),
      body: const Center(
        child: Text('Esewa Payment Method Selected'),
      ),
    );
  }
}