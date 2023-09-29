// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, avoid_print

import 'package:TezHealthCare/utils/colors.dart';
import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EsewaPage extends StatefulWidget {
  final String? patientId;

  const EsewaPage({Key? key, this.patientId,}) : super(key: key);

  

  @override
  State<EsewaPage> createState() => _EsewaPageState();
}

class _EsewaPageState extends State<EsewaPage> {
   double totalSum = 0.0;
  String Patient_id = '';
  String username = '';


  // Initialize with a default value

  Future<void> getTotalSum() async {
    final sp = await SharedPreferences.getInstance();
    final patientSpecificKey =
        'totalSum_${Patient_id}'; // Use the patient's ID in the key
    final storedTotalSum = sp.getDouble(patientSpecificKey);
    if (storedTotalSum != null) {
      setState(() {
        totalSum = storedTotalSum;
        print(totalSum);
        print(Patient_id);
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

  @override
  void initState() {
    getAllData();
    super.initState();
  }



  String refId = '';
  String hasError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text('Esawa Payment Method'),
        backgroundColor: darkYellow,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Example Use case - 1
            EsewaPayButton(
              paymentConfig: ESewaConfig.dev(
                su : 'https://www.marvel.com/hello',
                amt: totalSum,
                fu: 'https://www.marvel.com/hello',
                pid: Patient_id,
                // scd: dotenv.env['ESEWA_SCD']!
              ),
              width: 100,
              onFailure: (result) async {
                setState(() {
                  refId = '';
                  hasError = result;
                });
                if (kDebugMode) {
                  print(result);
                }
              },
              onSuccess: (result) async {
                setState(() {
                  hasError = '';
                  refId = result.refId!;
                });
                if (kDebugMode) {
                  print(result.toJson());
                }
              },
            ),

            /// Example Use case - 1
            // TextButton(
            //   onPressed: () async {
            //     final result = await Esewa.i.init(
            //         context: context,
            //         eSewaConfig: ESewaConfig.dev(
            //           // .live for live
            //           su: 'https://www.marvel.com/hello',
            //           amt: 10,
            //           fu: 'https://www.marvel.com/hello',
            //           pid: '1212',
            //           // scd: dotenv.env['ESEWA_SCD']!
            //         ));
            //     // final result = await fakeEsewa();
            //     if (result.hasData) {
            //       final response = result.data!;
            //       if (kDebugMode) {
            //         print(response.toJson());
            //       }
            //     } else {
            //       if (kDebugMode) {
            //         print(result.error);
            //       }
            //     }
            //   },
            //   child: const Text('Pay with Esewa'),
            // ),
            if (refId.isNotEmpty)
              Text('Console: Payment Success, Ref Id: $refId'),
            if (hasError.isNotEmpty)
              Text('Console: Payment Failed, Message: $hasError'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
