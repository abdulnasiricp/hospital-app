// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_print, avoid_print, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'dart:convert';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSuccessfullScreen extends StatefulWidget {
  final List paymentMode;

  const PaymentSuccessfullScreen({
    Key? key,
    required this.paymentMode,
  }) : super(key: key);

  @override
  State<PaymentSuccessfullScreen> createState() =>
      _PaymentSuccessfullScreenState();
}

class _PaymentSuccessfullScreenState extends State<PaymentSuccessfullScreen> {
  late String Patient_id = '';
  late num totalDues = 0;
  late num blooddues = 0;
  late num ambulancedues = 0;
  late num pharmadues = 0;
  late num diredues = 0;
  late num radiodues = 0;
  late num pathodues = 0;

  getData() async {
    await LoadData();
    await getDues();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      Patient_id = sharedPreferences.getString('patientidrecord') ?? '';
    });
  }

  Future<void> getDues() async {
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final body = {
      'patient_id': Patient_id,
    };
    try {
      final response = await http.post(
        Uri.parse(ApiLinks.getDues),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        totalDues = data['result']['total_dues'];
        diredues = data['result']['dire_dues'];
        pharmadues = data['result']['pharma_dues'];
        pathodues = data['result']['patho_dues'];
        radiodues = data['result']['radio_dues'];
        blooddues = data['result']['blood_dues'];
        ambulancedues = data['result']['ambulance_dues'];

        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successfully!'),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[200]!, Colors.blue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: const Text(
                          'Payment Successfully!',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width / 2,
                      height: height / 4,
                      child: Lottie.asset('assets/done.json'),
                    ),
                    DottedLineDivider(),
                    if (pathodues > 0)
                      PaymentItem(
                        title: 'Pathology Dues',
                        amount: pathodues,
                      ),
                    if (radiodues > 0)
                      PaymentItem(
                        title: 'Radiology Dues',
                        amount: radiodues,
                      ),
                    if (diredues > 0)
                      PaymentItem(
                        title: 'Direct Dues',
                        amount: diredues,
                      ),
                    if (pharmadues > 0)
                      PaymentItem(
                        title: 'Pharmacy Dues',
                        amount: pharmadues,
                      ),
                    if (ambulancedues > 0)
                      PaymentItem(
                        title: 'Ambulance Dues',
                        amount: ambulancedues,
                      ),
                    if (blooddues > 0)
                      PaymentItem(
                        title: 'Blood Bank Dues',
                        amount: blooddues,
                      ),
                    DottedLineDivider(),
                    PaymentItem(
                      title: 'Total Hospital Due Amount',
                      amount: totalDues,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String title;
  final num amount;
  final bool isTotal;

  const PaymentItem({Key? key, 
    required this.title,
    required this.amount,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            isTotal ? 'Rs $amount' : 'Rs $amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isTotal ? Colors.green : Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLineDivider extends StatelessWidget {
  const DottedLineDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1, // Adjust the height of the divider as needed
      width: double.infinity, // Takes the full width of the parent
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Change the color as needed
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0; // Adjust the width as needed
    const dashWidth = 5; // Adjust the length of dashes as needed
    const dashSpace = 5; // Adjust the space between dashes as needed

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
