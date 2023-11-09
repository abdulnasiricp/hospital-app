// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations, unused_field, deprecated_member_use, file_names

import 'dart:convert';

import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class OpdPaymentSuccessfullScreen extends StatefulWidget {
  final String paymentMethod;
  final int opdchargeAmount;
  final int totalAmountInRs;
  final int total_AmountPaisa;
  final String patientName;
  final String DepartmentId;
  final String BloodgroupId;
  final String patientGender;
  final String patientAddress;
  final String patientDOB;
  final String patientMobile;
  final String ticketDate;
  final String patientEmail;
  final String selectedTicketType;
  final String selectedTicketTypeId;
  const OpdPaymentSuccessfullScreen({
    Key? key,
    required this.paymentMethod,
    required this.selectedTicketType,
    required this.opdchargeAmount,
    required this.totalAmountInRs,
    required this.patientName,
    required this.DepartmentId,
    required this.BloodgroupId,
    required this.patientGender,
    required this.patientAddress,
    required this.patientDOB,
    required this.patientMobile,
    required this.ticketDate,
    required this.patientEmail,
    required this.total_AmountPaisa,
    required this.selectedTicketTypeId,
  }) : super(key: key);

  @override
  State<OpdPaymentSuccessfullScreen> createState() =>
      _OpdPaymentSuccessfullScreenState();
}

class _OpdPaymentSuccessfullScreenState
    extends State<OpdPaymentSuccessfullScreen> {
  @override
  void initState() {
    makePostRequest();
    super.initState();
  }

  String? opdTicket;
  int? opdId;
  String? message;

  Future<void> makePostRequest() async {
    final url = Uri.parse(ApiLinks.addopdticket);
  

    final Map<String, String> body = {
      "name": "${widget.patientName}".isEmpty ? "N/A" : "${widget.patientName}",
      "gender":
          "${widget.patientGender}".isEmpty ? "N/A" : "${widget.patientGender}",
      "dob": "${widget.patientDOB}".isEmpty ? "N/A" : "${widget.patientDOB}",
      "email":
          "${widget.patientEmail}".isEmpty ? "N/A" : "${widget.patientEmail}",
      "address": "${widget.patientAddress}".isEmpty
          ? "N/A"
          : "${widget.patientAddress}",
      "mobileno":
          "${widget.patientMobile}".isEmpty ? "N/A" : "${widget.patientMobile}",
      "department_id":
          "${widget.DepartmentId}".isEmpty ? "N/A" : "${widget.DepartmentId}",
      "doctor_id": "",
      "date": "${widget.ticketDate}".isEmpty ? "N/A" : "${widget.ticketDate}",
      "blood_group": widget.BloodgroupId,
      "is_emergency": "${widget.selectedTicketTypeId}".isEmpty
          ? "N/A"
          : "${widget.selectedTicketTypeId}",
      "payment_mode":
          "${widget.paymentMethod}".isEmpty ? "N/A" : "${widget.paymentMethod}",
    };

    final response = await http.post(
      url,
      headers: ApiLinks.MainHeader,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        if (jsonResponse['status'] == '1') {
          setState(() {
            opdId = jsonResponse['opd_id'];
            opdTicket = jsonResponse['opd_ticket'];
            message = jsonResponse['message'];
          });
          print('========opdid $opdId');
          print('========opdTicket $opdTicket');
          print('========message $message');
        } else {
          // Handle the case where the 'status' is not '1'
          print('Request was successful, but status is not 1.');
        }
      } else {
        // Handle the case where the JSON response is null or invalid.
        print('JSON response is null or invalid.');
      }
    } else {
      // Handle the HTTP request error here
      print('Request failed with status: ${response.statusCode}');
    }
  }

  String formattedDate =
      DateFormat('dd-MM-yyyy, hh:mm a').format(DateTime.now());

  double? _progress;
  String? _downloadedFilePath; // Store the downloaded file path

  void showDownloadedFilePath(String path) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Download Completed'),
          content: Text('The PDF file is downloaded at: $path'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (_downloadedFilePath != null) {
                  // Open the downloaded PDF file using open_file package
                  final result = await OpenFile.open(_downloadedFilePath!);
                  if (result.type == ResultType.done) {
                    print('File opened with success');
                  } else {
                    print('Error opening file: ${result.message}');
                  }
                  // Launch a URL using url_launcher package
                  await launch(
                      opdTicket ?? ""); // Replace with your desired URL
                }
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.BloodgroupId);
    print(widget.DepartmentId);
    print(widget.opdchargeAmount);
    print(widget.patientAddress);
    print(widget.patientDOB);
    print(widget.patientEmail);
    print(widget.patientGender);
    print(widget.patientMobile);
    print(widget.patientName);
    print(widget.paymentMethod);
    print(widget.ticketDate);
    print(widget.totalAmountInRs);
    return WillPopScope(
        onWillPop: () async {
          Get.to(() => const MainSiginScreen());
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Ticket Booking successful!'),
            centerTitle: true,
            backgroundColor: darkYellow,
          ),
          body: _progress != null
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.transparent,
                                child: const LoadingIndicatorWidget())),
                      )),
                )
              : SingleChildScrollView(
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
                                        child: const Text(
                                          'Ticket Booking successful!',
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
                                          const Text(
                                            "Ticket Date",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            "${widget.ticketDate}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Transaction Id",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            "#Tez ${opdId ?? 'N/A'}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const DottedLineDivider(),
                                    PaymentItem(
                                      title: ' OPD Ticket Charge',
                                      amount: widget.opdchargeAmount,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const DottedLineDivider(),
                                    PaymentItem(
                                      title: 'Total  Ticket Charge',
                                      amount: widget.opdchargeAmount,
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
                                            child: Image.asset(
                                                'assets/khalti.png'),
                                          ) // Replace 'assets/khalti_image.png' with the actual path to your Khalti image.
                                        else if (widget.paymentMethod ==
                                            'eSewa')
                                          Container(
                                            height: 30,
                                            width: 60,
                                            child:
                                                Image.asset('assets/esewa.png'),
                                          ) // Replace 'assets/esewa_image.png' with the actual path to your eSewa image.
                                        else if (widget.paymentMethod == 'IPS')
                                          Container(
                                            height: 30,
                                            width: 60,
                                            child:
                                                Image.asset('assets/ips.png'),
                                          ) // Replace 'assets/ips_image.png' with the actual path to your IPS image.
                                        else if (widget.paymentMethod == 'IME')
                                          Container(
                                            height: 30,
                                            width: 60,
                                            child:
                                                Image.asset('assets/ime.png'),
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
                                    child: const Text("Download Ticket"),
                                    onPressed: () async {
                                      final status =
                                          await Permission.storage.request();
                                      if (status.isGranted) {
                                        FileDownloader.downloadFile(
                                          name:
                                              'Tez_Health_Care-${widget.ticketDate}.pdf',
                                          url: opdTicket ?? "",
                                          onProgress: (name, progress) {
                                            setState(() {
                                              _progress = progress;
                                            });
                                          },
                                          onDownloadCompleted: (path) {
                                            print('Downloaded path: $path');
                                            setState(() {
                                              _progress = null;
                                              _downloadedFilePath =
                                                  path; // Store the downloaded file path
                                            });

                                            // Automatically open the downloaded file
                                            _openDownloadedFile(path);
                                          },
                                        );
                                      } else {
                                        print('Permission denied');
                                        // Handle permission denial here
                                      }
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
        ));
  }

  void _openDownloadedFile(String filePath) async {
    if (_downloadedFilePath != null) {
      final result = await OpenFile.open(
        filePath,
        type: 'application/pdf', // Specify the content type as PDF
      );

      if (result.type == ResultType.done) {
        print('File opened with success');
      } else {
        print('Error opening file: ${result.message}');
      }
    }
  }
}

class PaymentItem extends StatelessWidget {
  final String title;
  final int amount;
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
