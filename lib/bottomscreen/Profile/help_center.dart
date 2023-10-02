import 'package:TezHealthCare/Payment_gateway/payment_seccessfull.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
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
        title: const Text(EnString.helpCenter),

      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Get.dialog(const PaymentSuccessfullScreen()
          // const ToastDialog(title: "welcome",message: "welcome to HealthCare",btnnName: "Save",));
        );
      }, child: const Text('Toast Mesg'))),
    );
  }
}
