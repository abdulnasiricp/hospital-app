import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
class AlertDialogWidget extends StatelessWidget {
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
                  margin: EdgeInsets.only(left: 30), child: Text("Loading ...")),
            ],
          ),
          backgroundColor: Colors.white, // Make the AlertDialog background transparent
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: AlertDialogWidget(),
    ),
  ));
}
