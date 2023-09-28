import 'package:flutter/material.dart';

class ImePage extends StatelessWidget {
  const ImePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ime Pay Page'),
      ),
      body: const Center(
        child: Text('Ime Pay Payment Method Selected'),
      ),
    );
  }
}
