import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white70,
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularProgressIndicator(
              color: darkYellow,
            ),
            const SizedBox(width: 15),
            const Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}