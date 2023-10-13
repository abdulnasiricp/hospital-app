// ignore_for_file: file_names, unnecessary_new

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.5), // Black with 50% opacity
        child: AlertDialog(
          content: new Row(
            children: [
              CircularProgressIndicator(backgroundColor: darkYellow, color: yellow),
              Container(
                  margin: const EdgeInsets.only(left: 30), child: const Text("Loading ...")),
            ],
          ),
          backgroundColor: Colors.transparent, // Make the AlertDialog background transparent
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: AlertDialogWidget(),
    ),
  ));
}
