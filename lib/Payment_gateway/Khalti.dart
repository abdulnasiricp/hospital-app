// ignore_for_file: file_names, non_constant_identifier_names



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
   double totalSum = 0.0;
  String Patient_id = '';
  String username = '';


  // Initialize with a default value

  Future<void> getTotalSum() async {
    final sp = await SharedPreferences.getInstance();
    final patientSpecificKey =
        'totalSum_$Patient_id'; // Use the patient's ID in the key
    final storedTotalSum = sp.getDouble(patientSpecificKey);
    if (storedTotalSum != null) {
      setState(() {
        totalSum = storedTotalSum;
      });
    }
  }

    LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('usernamerecord') ?? '';
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

 String referenceId = "";


  getAllData() async {
    await LoadData();

    await getTotalSum();
  }

  @override
  void initState() {
    getAllData();
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
        amount: totalSum, //in paisa//due balance
        productIdentity: Patient_id,//patient id.e.g 10707
        productName: username,//patient name
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