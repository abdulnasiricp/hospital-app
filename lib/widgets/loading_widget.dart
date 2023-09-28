import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Center(
        child: Lottie.asset('assets/tez_spin.json'),
      ),
    );
  }
}
