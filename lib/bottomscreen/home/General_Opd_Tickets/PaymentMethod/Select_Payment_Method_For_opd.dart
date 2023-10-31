import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class Select_Payment_Method_For_opd extends StatefulWidget {
  //const Select_Payment_Method_For_opd({super.key});

  @override
  State<Select_Payment_Method_For_opd> createState() =>
      _Select_Payment_Method_For_opdState();
}

class _Select_Payment_Method_For_opdState
    extends State<Select_Payment_Method_For_opd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text('OPT Ticket Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              'This page is under construction.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'We are working hard to bring it to you soon!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
