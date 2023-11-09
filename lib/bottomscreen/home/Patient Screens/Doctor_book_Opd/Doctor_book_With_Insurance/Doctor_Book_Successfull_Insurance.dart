// Add your necessary imports here

// ignore_for_file: unused_field, duplicate_ignore, file_names, camel_case_types, non_constant_identifier_names, unnecessary_string_interpolations, avoid_print, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctor_Book_Successfull_Insurance extends StatefulWidget {
  final String name;

  final String InsuranceorSSFid; final String department_id;
  final String gender;
  final String pataddress;
  final String dob;
  final String Phone;
  final String ticketDate;
  final String email;
  final String balance;
  final String contractDate;
  final String doctorId;
  const Doctor_Book_Successfull_Insurance({
    Key? key,
    required this.name,
  required this.department_id,
    required this.InsuranceorSSFid,
    required this.gender,
    required this.pataddress,
    required this.dob,
    required this.Phone,
    required this.doctorId,
    required this.ticketDate,
    required this.email,
    required this.balance,
    required this.contractDate,
  }) : super(key: key);

  @override
  State<Doctor_Book_Successfull_Insurance> createState() =>
      _OPD_Ticket_Booking_Successful_InsuranceState();
}

class _OPD_Ticket_Booking_Successful_InsuranceState
    extends State<Doctor_Book_Successfull_Insurance> {
  bool loading = true; // Add a loading state variable

  @override
  void initState() {
    super.initState();
    makePostRequest();
  }

  String? opdTicket;
  int? opdId;
  String? message;

  Future<void> makePostRequest() async {
    final url = Uri.parse(ApiLinks.addopdticket);
   

    final Map<String, String> body = {
      "name": "${widget.name}".isEmpty ? "N/A" : "${widget.name}",
      "gender": "${widget.gender}".isEmpty ? "N/A" : "${widget.gender}",
      "dob": "${widget.dob}".isEmpty ? "N/A" : "${widget.dob}",
      "email": "${widget.email}".isEmpty ? "N/A" : "${widget.email}",
      "is_emergency": "",
      "address":
          "${widget.pataddress}".isEmpty ? "N/A" : "${widget.pataddress}",
      "mobileno": "${widget.Phone}".isEmpty ? "N/A" : "${widget.Phone}",
      "department_id":
          "${widget.department_id}".isEmpty ? "N/A" : "${widget.department_id}",
      "doctor_id": "${widget.doctorId}".isEmpty ? "N/A" : "${widget.doctorId}",
      "date": "${widget.ticketDate}".isEmpty
          ? "$formattedDate"
          : "${widget.ticketDate}",
      "blood_group": "",
      "payment_mode": "cheque",
      "insurance_no": widget.InsuranceorSSFid,
    };

    final response = await http.post(
      url,
      headers:ApiLinks.MainHeader,
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

    setState(() {
      loading = false;
    });
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
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const Bottomhome());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Ticket Booking successful!'.tr),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                                    child: Text(
                                      'Ticket Booking successful!'.tr,
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
                                      Text(
                                        "Ticket Date".tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "${widget.ticketDate}".isEmpty
                                            ? "$formattedDate"
                                            : "${widget.ticketDate}",
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
                                      Text(
                                        "Transaction Id".tr,
                                        style: const TextStyle(
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
                                  title: 'OPD Ticket Charge'.tr,
                                  amount: "FREE",
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const DottedLineDivider(),
                                PaymentItem(
                                  title: 'Total  Ticket Charge'.tr,
                                  amount: "FREE",
                                  isTotal: true,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                    "Payment Mode : Payment By Insurance Claimed"
                                        .tr,
                                    style: const TextStyle(fontSize: 12)),
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
                                  child: Text("Download Ticket".tr),
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
                                      print('opdTicket is empty or invalid.');
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
            ),
            if (loading)
              Container(
                color: Colors.white,
                child: Center(
                  child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.transparent,
                      child: const LoadingIndicatorWidget()),
                ),
              ),
          ],
        ),
      ),
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

// ... Rest of your code ...
