// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class OpdPaymentSuccessfullScreen extends StatefulWidget {
  final String paymentMethod;
  final int opdchargeAmount;

  const OpdPaymentSuccessfullScreen({
    Key? key,
    required this.paymentMethod, required this.opdchargeAmount,
  }) : super(key: key);

  @override
  State<OpdPaymentSuccessfullScreen> createState() =>
      _OpdPaymentSuccessfullScreenState();
}

class _OpdPaymentSuccessfullScreenState extends State<OpdPaymentSuccessfullScreen> {
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
                      'https://uat.tez.hospital/xzy/webservice/generateBillPrint/10673/OPD'); // Replace with your desired URL
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
          title: const Text('Ticket Booking successful!'),
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
                                    "Date/Time",
                                    style: TextStyle(
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
                              title: 'Total  Ticket Charge',
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
                            child: const Text("Download Ticket"),
                            onPressed: () {
                              // Get.to(() => const Bottomhome());
                                   FileDownloader.downloadFile(
                url: 'https://uat.tez.hospital/xzy/webservice/generateBillPrint/10673/OPD',
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

                  // Show the downloaded file path in a popup
                  showDownloadedFilePath(path);
                },
              );
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
