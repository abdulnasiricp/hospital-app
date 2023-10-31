// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final TextEditingController controller1 = TextEditingController();
//   final TextEditingController controller2 = TextEditingController();
//   final TextEditingController combinedController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Combine TextFields'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: controller1,
//                 decoration: InputDecoration(labelText: 'Text Field 1'),
//               ),
//               TextField(
//                 controller: controller2,
//                 decoration: InputDecoration(labelText: 'Text Field 2'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   combineText();
//                 },
//                 child: Text('Combine Text'),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: combinedController,
//                 decoration: InputDecoration(labelText: 'Combined Text'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void combineText() {
//     final text1 = controller1.text;
//     final text2 = controller2.text;
//     final combinedText = '$text1 $text2'; // Combine the text from both controllers
//     combinedController.text = combinedText; // Update the third controller's text
//   }
// }

// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';
import 'package:TezHealthCare/Payment_gateway/cancel_payment.dart';
import 'package:TezHealthCare/Payment_gateway/payment_seccessfull.dart';
import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/General_Opd_Tickets_Form.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imepay_merchant_sdk/start_sdk.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class CheckSelectPaymentMethod extends StatefulWidget {
  final int totalAmountInRs;
  final String total_Amount;
  const CheckSelectPaymentMethod(
      {Key? key,
      required this.totalAmountInRs,
      required this.total_Amount})
      : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<CheckSelectPaymentMethod> {
 

  String refId = '';
  String hasError = '';
  void payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 0, //in paisa
        // amount: 20000, //in paisa
        productIdentity: 'patientID',
        productName: 'patientName',
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

  void payWithConnectIPSInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 0, //in paisa
        productIdentity: 'patientID',
        productName: 'patientName',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.connectIPS,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void payWithImepayInApp() async {
    Random random = Random();
    random.nextInt(15);
    var result = await StartSdk.callSdk(context,
        merchantCode: "MERCHANT_CODE",
        merchantName: 'patientName',
        merchantUrl: "MERCHANT_URL",
        amount: widget.totalAmountInRs,
        refId: 'patientID',
        module: "MODULE",
        user: "USER",
        password: "PASSWORD",
        deliveryUrl: "DELIVERY_URL",
        buildType: BuildType.STAGE);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: Text(json.encode(result)));
      },
    );
  }

  void payWithEsawaInApp() async {
    final result = await Esewa.i.init(
        context: context,
        eSewaConfig: ESewaConfig.dev(
          // .live for live
          su: 'https://www.marvel.com/hello',
          // amt: widget.totalAmountInpaisa,
          amt: widget.totalAmountInRs,
          fu: 'https://www.marvel.com/hello',
          pid: 'patientID',
          // scd: dotenv.env['ESEWA_SCD']!
        ));
    if (result.hasData) {
      final response = result.data!;
      if (kDebugMode) {
        print(response.toJson());
      }
    } else {
      if (kDebugMode) {
        print(result.error);
      }
    }
    if (refId.isNotEmpty) {
      Text('Console: Payment Success, Ref Id: $refId');
    }
    if (hasError.isNotEmpty) {
      Text('Console: Payment Failed, Message: $hasError');
    }
  }

  void onSuccess(PaymentSuccessModel success) async {
    Get.off(() => PaymentSuccessfullScreen(
          paymentMethod: selectedPaymentMethod,
        ));
 
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(
      failure.toString(),
    );
    Get.to(() => const CancelPaymentScreen(
          title: 'Cancelled',
          btnnName: "OK",
          message: "payment Cancelled",
        ));
  }

  void onCancel() {
    debugPrint('Cancelled');
    Get.dialog(const CancelPaymentScreen(
      title: 'Cancelled',
      btnnName: "OK",
      message: "payment Cancelled",
    ));
  }

  int selectedMethodIndex = 0;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod('assets/khalti.png'),
    PaymentMethod('assets/esewa.png'),
    PaymentMethod('assets/ips.png'),
    PaymentMethod('assets/ime.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const General_Opd_Tickets_Form()),
        );
        return false;
      }, // Prevent default back button behavior
      child: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          appBar: AppBar(
            title: Text('selectAnyOnePayment'.tr),
            centerTitle: true,
            backgroundColor: darkYellow,
            leading: IconButton(
              onPressed: () {
                Get.to(() => const Bottomhome());
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Card(
                color: Colors.lightBlue[50],
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 5,
                          child: GridView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: paymentMethods.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMethodIndex = index;
                                  });
                                },
                                child: PaymentMethodTile(
                                  paymentMethod: paymentMethods[index],
                                  isSelected: selectedMethodIndex == index,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: width,
                          // height: 150,
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'OPd Charge Dues',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20,
                                          top: 10,
                                          left: 10,
                                          bottom: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(widget.total_Amount,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: DottedLineDivider(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'totalhospitalDueAmount'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 10, bottom: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${widget.total_Amount}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'askTermsAndCondition'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              TextButton(
                                  child: Text('termsAndCondition'.tr),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0)),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return FractionallySizedBox(
                                          heightFactor: 0.5,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      EnString
                                                          .termsAndCondition,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      EnString
                                                          .termsAndConditionMsg,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            child: Text('proceed'.tr),
                            onPressed: () async {
                              await navigateToSelectedPage();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(yellow),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          // Center(
          //     child: Container(
          //       width: 50,
          //       height: 50,
          //       child: const LoadingIndicatorWidget(),
          //     ),
          //   )
          ),
    );
  }

  String selectedPaymentMethod = "";

  Future<void> navigateToSelectedPage() async {
    final selectedMethod = paymentMethods[selectedMethodIndex].logoPath;
    if (selectedMethod.isNotEmpty) {
      if (selectedMethod == 'assets/khalti.png') {
        selectedPaymentMethod = "Khalti";

        payWithKhaltiInApp();
      } else if (selectedMethod == 'assets/esewa.png') {
        selectedPaymentMethod = "eSewa";
        payWithEsawaInApp();
      } else if (selectedMethod == 'assets/ips.png') {
        selectedPaymentMethod = "IPS";
        payWithConnectIPSInApp();
      } else if (selectedMethod == 'assets/ime.png') {
        selectedPaymentMethod = "IME";
        payWithImepayInApp();
      }
    } else {
      // Show an error or prompt to select a payment method
    }
  }
}

class PaymentMethod {
  final String logoPath;

  PaymentMethod(this.logoPath);
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  const PaymentMethodTile(
      {Key? key, required this.paymentMethod, required this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Set the height to 80
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: isSelected ? Colors.grey.withOpacity(0.7) : Colors.white,
        elevation: 5,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    paymentMethod.logoPath,
                    height: height / 4,
                    width: width / 3,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: width/10,
                    height: 25.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkYellow,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
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




// // ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

// import 'dart:convert';

// import 'package:TezHealthCare/Payment_gateway/Select_Payment_Method.dart';
// import 'package:TezHealthCare/check.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class OPDTicketDetails extends StatefulWidget {
//   final String patientName;
//   final String patientGender;
//   final String patientAddress;
//   final String patientDOB;
//   final String patientMobile;
//   final String ticketDate;
//   final String maritalStatus;
//   final String bloodGroup;
//   final String patientEmail;
//   final String selectedDepartment;

//   const OPDTicketDetails(
//       {Key? key,
//       required this.patientName,
//       required this.patientGender,
//       required this.patientAddress,
//       required this.patientDOB,
//       required this.patientMobile,
//       required this.ticketDate,
//       required this.maritalStatus,
//       required this.bloodGroup,
//       required this.patientEmail,
//       required this.selectedDepartment})
//       : super(key: key);

//   @override
//   State<OPDTicketDetails> createState() => _ConfirmationScreenState();
// }

// class _ConfirmationScreenState extends State<OPDTicketDetails> {
//   @override
//   void initState() {
//     getOpdTicketCharge();
//     super.initState();
//   }

//   bool isLoading = true;

//   String opdcharge = '0';
//   Future<void> getOpdTicketCharge() async {
//     setState(() {
//       isLoading = true;
//     });

//     final response = await http
//         .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       opdcharge = data['opd_ticket_charge'];

//       print('==========$opdcharge');
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       throw Exception('Failed to load opd ticket charge');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue[50],
//       appBar: AppBar(
//         backgroundColor: darkYellow,
//         title: const Text('OPT Ticket Details'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 20,
//                 ),
//                 child: Container(
//                   height: 200,
//                   width: width,
//                   // color: Colors.white,
//                   child: Card(
//                     color: Colors.white,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'hospitalVisitAppointment'.tr,
//                             style: TextStyle(
//                                 color: Colors.orange[900],
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Container(
//                                   height: 100,
//                                   width: 100,
//                                   child: Image.asset('assets/drtwo.png')),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     widget.patientName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(widget.selectedDepartment),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 Text('date'.tr),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(widget.ticketDate)
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text('patientInformation'.tr,
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               Container(
//                 width: width,
//                 height: 150,
//                 child: Card(
//                   color: Colors.white,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'patientName'.tr,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'patientMobile'.tr,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'patientGender'.tr,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'patientDOB'.tr,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'patientAddress'.tr,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             right: 40, top: 10, left: 10, bottom: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(widget.patientName),
//                             Text(widget.patientMobile),
//                             Text(widget.patientGender),
//                             Text(widget.patientDOB),
//                             Text(widget.patientAddress),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   Text('patientPaymentAmount'.tr,
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text("$opdcharge",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange[900])),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text('confirmationDesc'.tr,
//                   style: TextStyle(color: Colors.orange[900])),
//               const SizedBox(
//                 height: 10,
//               ),
//               Center(
//                 child: Text('selectPaymentMethod'.tr,
//                     style: TextStyle(
//                         color: Colors.blue[400],
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15)),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               InkWell(
//                 onTap: () {
//                   Get.to(() =>  CheckSelectPaymentMethod(
//                         total_Amount: opdcharge,
//                         totalAmountInRs:0,
//                       ));
//                 },
//                 child: Container(
//                   width: width / 1,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: darkYellow,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Center(
//                       child: Text(
//                     'selectPaymentMethod'.tr,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.white),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
