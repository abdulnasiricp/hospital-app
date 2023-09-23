import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: darkYellow,),
          const SizedBox(height: 10),
          const Text('Loading...',style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}