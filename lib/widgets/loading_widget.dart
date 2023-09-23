import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                height: height / 10,
                width: width,
                color: Colors.grey.shade300,
                child: Padding(
                padding:const EdgeInsets.only(top: 10,left: 40),
                child: Row(
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

              ),
              
            ]),
          ),
        ],
      ),
    );
  }
}
