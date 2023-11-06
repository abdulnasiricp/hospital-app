// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations, unused_field, deprecated_member_use, file_names, camel_case_types

import 'dart:convert';

import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class OPD_Ticket_Booking_Successful_Insurance extends StatefulWidget {
  final String name;
  final String DepartmentId;
  final String InsuranceorSSFid;
  final String gender;
  final String pataddress;
  final String dob;
  final String Phone;
  final String ticketDate;
  final String email;
  final String balance;
  final String contractDate;
  final String selectedTicketTypeId;

  const OPD_Ticket_Booking_Successful_Insurance({
    Key? key,
    required this.name,
    required this.DepartmentId,
    required this.selectedTicketTypeId,
    required this.InsuranceorSSFid,
    required this.gender,
    required this.pataddress,
    required this.dob,
    required this.Phone,
    required this.ticketDate,
    required this.email,
    required this.balance,
    required this.contractDate,
  }) : super(key: key);

  @override
  State<OPD_Ticket_Booking_Successful_Insurance> createState() =>
      _OPD_Ticket_Booking_Successful_InsuranceState();
}

class _OPD_Ticket_Booking_Successful_InsuranceState
    extends State<OPD_Ticket_Booking_Successful_Insurance> {
  Future? _future;

  @override
  void initState() {
    super.initState();
    _future = makePostRequest();
  }

  String? opdTicket;
  int? opdId;
  String? message;

  Future<void> makePostRequest() async {
    final url = Uri.parse(ApiLinks.addopdticket);
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final Map<String, String> body = {
      "name": widget.name,
      "gender": widget.gender,
      "dob": widget.dob,
      "email": widget.email,
      "address": widget.pataddress,
      "mobileno": widget.Phone,
      "department_id": widget.DepartmentId,
      "doctor_id": "",
      "date": widget.ticketDate,
      "blood_group": "",
      "payment_mode": "cheque",
      "insurance_no": widget.InsuranceorSSFid,
      "is_emergency": widget.selectedTicketTypeId,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('==========jsonResponse:$jsonResponse ');
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
      // Handle the HTTP request error here
      print('Request failed with status: ${response.statusCode}');
    }
  }

  String formattedDate =
      DateFormat('dd-MM-yyyy, hh:mm a').format(DateTime.now());

  double? _progress;
  String? _downloadedFilePath;

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
                  final result = await OpenFile.open(_downloadedFilePath!);
                  if (result.type == ResultType.done) {
                    print('File opened with success');
                  } else {
                    print('Error opening file: ${result.message}');
                  }
                  await launch(opdTicket ?? "");
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
    print(widget.DepartmentId);
    print(widget.InsuranceorSSFid);
    print(widget.Phone);
    print(widget.balance);
    print(widget.contractDate);
    print(widget.dob);
    print(widget.email);
    print(widget.gender);
    print(widget.name);
    print(widget.pataddress);
    print(widget.ticketDate);
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const MainSiginScreen());
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
          body:
              // _progress != null
              //     ?
              FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 100,
                    width: 50,
                    child: const LoadingIndicatorWidget(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SingleChildScrollView(
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
                                      ),
                                    ),
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
                                    const PaymentItem(
                                      title: ' OPD Ticket Charge',
                                      amount: "FREE",
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const DottedLineDivider(),
                                    const PaymentItem(
                                      title: 'Total  Ticket Charge',
                                      amount: "FREE",
                                      isTotal: true,
                                    ),
                                  ],
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                        "Payment Mode : Payment By Insurance Claimed",
                                        style: TextStyle(fontSize: 12)),
                                  ),
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
                                          print(
                                              'opdTicket is empty or invalid.');
                                          // Handle permission denial here
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(yellow),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          )),
    );
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

// ... Rest of your code ...

class PaymentItem extends StatelessWidget {
  final String title;
  final String amount;
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
