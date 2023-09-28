import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,

      body: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.lineScalePulseOut,
            colors: [
              Color(0xfff01c58),
              Color(0xfff4a46c),
              Color(0xff1d98d5),
              Color(0xff857cb2),
              Color(0xffe4dad7),
            ],
            strokeWidth: 5,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.yellowAccent),
      ),
    );
  }
}
