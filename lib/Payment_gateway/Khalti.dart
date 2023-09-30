// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KhaltiPage extends StatefulWidget {
  final String? patientId;

  const KhaltiPage({Key? key, this.patientId}) : super(key: key);

  @override
  State<KhaltiPage> createState() => _KhaltiPageState();
}

class _KhaltiPageState extends State<KhaltiPage> {
  int totalSum = 20000;
  String Patient_id = '';
  String username = '';

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('usernamerecord') ?? '';
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
      print(username);
      print(Patient_id);
    });
  }

  String referenceId = "";

  getAllData() async {
    await LoadData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkYellow,
        title: const Text("Khalti Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  payWithKhaltiInApp();
                },
                child: const Text("Pay with Khalti")),
            Text(referenceId)
          ],
        ),
      ),
    );
  }

  payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: totalSum, //in paisa
        productIdentity: Patient_id,
        productName: username,
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,

      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),

          actions: [
            SimpleDialogOption(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    referenceId = success.idx;
                  });

                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(
      failure.toString(),
    );
  }

  void onCancel() {
    debugPrint('Cancelled');
  }
}