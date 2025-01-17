// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations, deprecated_member_use

import 'dart:convert';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSuccessfullScreen extends StatefulWidget {
  final String paymentMethod;

  const PaymentSuccessfullScreen({
    Key? key,
    required this.paymentMethod,
    //  required this.paymentMode,
  }) : super(key: key);

  @override
  State<PaymentSuccessfullScreen> createState() =>
      _PaymentSuccessfullScreenState();
}

class _PaymentSuccessfullScreenState extends State<PaymentSuccessfullScreen> {
  String formattedDate =
      DateFormat('dd-MM-yyyy, hh:mm a').format(DateTime.now());

  // int transactionId = 0;

  Future<int> makePostRequest() async {
    print(formattedDate);

    const String url = ApiLinks.duePayment;

   

    final Map<String, dynamic> body = {
      "patient_id": Patient_id,
      "due_amount": "$totalDues",
      "date": formattedDate,
      "payment_mode": widget.paymentMethod,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: ApiLinks.MainHeader,
      body: jsonEncode(body),
    );

     if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    int transactionId = data['transaction_id'][0];

    if (data['status'] == '1') {
      print("Payment added successfully");
      print("Transaction ID: ${data['transaction_id'][0]}");
      return transactionId;
    } else {
      print("Error: ${data['message']}");
      throw Exception('Failed to add payment');
    }
  } else {
    throw Exception('Failed to make a POST request');
  }
}

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
    makePostRequest();
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
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Payment Successful!'.tr),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 50,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Container(
                                child:  Text(
                                  'Payment Successful!'.tr,
                                  style: const TextStyle(
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
                                width: width / 3,
                                height: height / 6,
                                child: SvgPicture.asset(
                                  'assets/done.svg',
                                )),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    "Date/Time".tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "$formattedDate",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    "Transaction Id".tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                             
                                  FutureBuilder<int>(
                                    future:
                                        makePostRequest(), // Call makePostRequest and return the transactionId
                                    builder: (BuildContext context,
                                        AsyncSnapshot<int> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        int transactionId = snapshot.data ??
                                            0; // Use the transactionId when it's available
                                        return Text(
                                          "#Tez$transactionId",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        );
                                      }  else {
                                        // Display a loading indicator or return an empty container
                                        return Container(); 
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DottedLineDivider(),
                            if (pathodues > 0)
                              PaymentItem(
                                title: 'Pathology Dues'.tr,
                                amount: pathodues,
                              ),
                            if (radiodues > 0)
                              PaymentItem(
                                title: 'Radiology Dues'.tr,
                                amount: radiodues,
                              ),
                            if (diredues > 0)
                              PaymentItem(
                                title: 'Direct Dues'.tr,
                                amount: diredues,
                              ),
                            if (pharmadues > 0)
                              PaymentItem(
                                title: 'Pharmacy Dues'.tr,
                                amount: pharmadues,
                              ),
                            if (ambulancedues > 0)
                              PaymentItem(
                                title: 'Ambulance Dues'.tr,
                                amount: ambulancedues,
                              ),
                            if (blooddues > 0)
                              PaymentItem(
                                title: 'Blood Bank Dues'.tr,
                                amount: blooddues,
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            const DottedLineDivider(),
                            PaymentItem(
                              title: 'Total Hospital Due Amount'.tr,
                              amount: totalDues,
                              isTotal: true,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text("Payment Mode :",
                                style: TextStyle(fontSize: 12)),
                          ),
                          Container(
                            child: Column(
                              children: [
                                if (widget.paymentMethod == 'Khalti')
                                  Container(
                                    height: 30,
                                    width: 60,
                                    child: Image.asset('assets/khalti.png'),
                                  ) // Replace 'assets/khalti_image.png' with the actual path to your Khalti image.
                                else if (widget.paymentMethod == 'eSewa')
                                  Container(
                                    height: 30,
                                    width: 60,
                                    child: Image.asset('assets/esewa.png'),
                                  ) // Replace 'assets/esewa_image.png' with the actual path to your eSewa image.
                                else if (widget.paymentMethod == 'IPS')
                                  Container(
                                    height: 30,
                                    width: 60,
                                    child: Image.asset('assets/ips.png'),
                                  ) // Replace 'assets/ips_image.png' with the actual path to your IPS image.
                                else if (widget.paymentMethod == 'IME')
                                  Container(
                                    height: 30,
                                    width: 60,
                                    child: Image.asset('assets/ime.png'),
                                  ) // Replace 'assets/ime_image.png' with the actual path to your IME image.
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Container(
                          width: width,
                          height: height / 15,
                          child: ElevatedButton(
                            child: Text("Dasboard".tr),
                            onPressed: () {
                              Get.to(() => const Bottomhome());
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(yellow),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
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
    Key? key,
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
