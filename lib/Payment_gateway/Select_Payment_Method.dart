// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'package:TezHealthCare/Payment_gateway/cancel_payment.dart';
import 'package:TezHealthCare/Payment_gateway/payment_seccessfull.dart';
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
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPaymentMethod extends StatefulWidget {
  final double totalAmountInRs;
  final int totalAmountInpaisa;
  final num path_Amount;
  final num total_Amount;
  final num phrma_Amount;
  final num ambulance_Amount;
  final num direct_amount;
  final num blood_Amount;
  final num radio_Amount;
  const SelectPaymentMethod(
      {Key? key,
      required this.totalAmountInRs,
      required this.totalAmountInpaisa,
      required this.path_Amount,
      required this.phrma_Amount,
      required this.ambulance_Amount,
      required this.direct_amount,
      required this.blood_Amount,
      required this.radio_Amount,
      required this.total_Amount})
      : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  ////////////////////////////////////////////////////////////////////////////////

  var profileData;
  late String patientID = '';
  late String patientName = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';
    patientName = sp.getString('usernamerecord') ?? '';

    print(patientID);
    setState(() {});
  }

  Future<void> ProfileApi() async {
    const apiUrl = ApiLinks.getPatientprofile;
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final requestBody = jsonEncode({"patientId": patientID});

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profileJson =
            responseBody[0]; // Assuming your API returns a list with one item
        setState(() {
          profileData = ProfileData.fromJson(profileJson);
        });
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Request error: $e');
    }
  }

  getAllData() async {
    await LoadData();

    await ProfileApi();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  String refId = '';
  String hasError = '';
  void payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: widget.totalAmountInpaisa, //in paisa
        // amount: 20000, //in paisa
        productIdentity: patientID,
        productName: patientName,
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
        amount: widget.totalAmountInpaisa, //in paisa
        productIdentity: patientID,
        productName: patientName,
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

  void payWithInternetbanking() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: widget.totalAmountInpaisa, //in paisa
        productIdentity: 'patientID',
        productName: 'patientName',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.eBanking,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void payWithMobilebanking() async {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: widget.totalAmountInpaisa, //in paisa
        productIdentity: 'patientID',
        productName: 'patientName',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.mobileBanking,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
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
          pid: patientID,
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
        Get.dialog(const CancelPaymentScreen(
          title: 'Cancelled',
          btnnName: "OK",
          message: "payment Cancelled",
        ));
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
    PaymentMethod('assets/Mobilebanking.png'),
    PaymentMethod('assets/internetbanking.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
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
          body: profileData != null
              ? SingleChildScrollView(
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
                                height: height / 3,
                                child: GridView.builder(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.3,
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
                                        isSelected:
                                            selectedMethodIndex == index,
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
                                      if (widget.path_Amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Pathology Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("${widget.path_Amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.radio_Amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Radiology Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("${widget.radio_Amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.direct_amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Direct Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "${widget.direct_amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.phrma_Amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Pharmacy Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("${widget.phrma_Amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.ambulance_Amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Ambulance Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "${widget.ambulance_Amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.blood_Amount > 0)
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Blood Bank Dues',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("${widget.blood_Amount}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
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
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'totalhospitalDueAmount'.tr,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20,
                                                left: 10,
                                                bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("${widget.total_Amount}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    TextButton(
                                        child: Text('termsAndCondition'.tr),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          20.0)),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return FractionallySizedBox(
                                                heightFactor: 0.5,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            EnString
                                                                .termsAndCondition,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                                  FontWeight
                                                                      .bold,
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
              : Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: const LoadingIndicatorWidget(),
                  ),
                )),
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
      } else if (selectedMethod == 'assets/Mobilebanking.png') {
        selectedPaymentMethod = "Mobilebanking";
        payWithMobilebanking();
      } else if (selectedMethod == 'assets/internetbanking.png') {
        selectedPaymentMethod = "Internetbanking";
        payWithInternetbanking();
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
