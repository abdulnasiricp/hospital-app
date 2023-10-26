import 'dart:convert';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSuccessfullScreen extends StatefulWidget {
  final String paymentMode;

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
        title: Text('Payment Successful!'),
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
        child: SingleChildScrollView(
          child: Card(
            elevation: 20,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Container(
                          child: const Text(
                            'Payment Successful!',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: width / 2,
                          height: height / 4,
                          child: SvgPicture.asset(
                            'assets/done.svg',
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transaction Id",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "#85482165258",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
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
                      const SizedBox(
                        height: 25,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("Payment Mode", style: TextStyle(fontSize: 12)),
                      ),
                      Container(
                        child: Image.asset('assets/khalti.png',
                            height: 30, width: 60),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  const PaymentItem({
    required this.title,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
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
