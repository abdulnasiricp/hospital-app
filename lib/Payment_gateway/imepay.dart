// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imepay_merchant_sdk/constants/app_constants.dart';
import 'package:imepay_merchant_sdk/start_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImePage extends StatefulWidget {
  const ImePage({Key? key,}) : super(key: key);
  

  @override
  State<ImePage> createState() => _ImePageState();
}

class _ImePageState extends State<ImePage> {
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
   getAllData() async {
    await LoadData();

    await getTotalSum();
  }

 
  // BuildType selectedValue = BuildType.STAGE;
  // BuildType selectedValue = BuildType.LIVE; //Only for production

  //Test and production details to be provided by IME Pay Team

  var MERCHANT_CODE = "TEST_MERCHANTCOD";
  // var MERCHANT_NAME = username;
  var MERCHANT_URL = "https://example.com/recordingurl";//Recording Url to be prepared by Merchant itself
  // var AMOUNT = "100";
  // var REF_ID = Patient_id; // Unique Identifier for the transaction
  var MODULE = "TEST_MODULENAME";
  var USER = "testuser";
  var PASSWORD = "********";
  var DELIVERY_URL = "https://www.example.com/deliveryurl";//Recording Url to be prepared by Merchant itself
  var BUILD_TYPE = BuildType.STAGE;
  var merchantLogo = "assets/images/merchant_logo.png";
  

 @override
  void initState() {
    getAllData();
    super.initState();
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImePay method'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  Random random = Random();
                  random.nextInt(15);

                  var result = await StartSdk.callSdk(context,
                      merchantCode: MERCHANT_CODE,
                      merchantName: username,
                      merchantUrl: MERCHANT_URL,
                      amount: totalSum,
                      refId: Patient_id,
                      module: MODULE,
                      user: USER,
                      password: PASSWORD,
                      deliveryUrl: DELIVERY_URL,
                      buildType: BuildType.STAGE);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(content: Text(json.encode(result)));
                    },
                  );
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red.shade800,
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: AppFont.Volte,
                        fontWeight: FontWeight.w700,
                        package: "imepay_merchant_sdk",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}