import 'package:TezHealthCare/widgets/Toast_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),

      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Get.dialog(const ToastDialog(title: "welcome",message: "welcome to HealthCare",));

      }, child: const Text('Toast Mesg'))),
    );
  }
}
