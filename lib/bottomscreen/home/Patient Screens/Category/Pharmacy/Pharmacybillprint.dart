
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class Pharmacybillprint extends StatefulWidget {
  final String id;
  final String bill_pdf;
  const Pharmacybillprint(
      {Key? key, required this.id, required this.bill_pdf,})
      : super(key: key);

  @override
  State<Pharmacybillprint> createState() => _PhysiotherapyBillviewState();
}

class _PhysiotherapyBillviewState extends State<Pharmacybillprint> {
  double? _progress;
  String PatientId = '';
  String? _downloadedFilePath; // Store the downloaded file path

  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    PatientId = sp.getString('patientidrecord') ?? '';
    print(PatientId);
    setState(() {});
  }

  loadSP() async {
    await LoadData();
  }

  @override
  void initState() {
    loadSP();
    super.initState();
  }

  // Function to show a popup with the PDF file path
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

                  await launch(
                      widget.bill_pdf); // Replace with your desired URL
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FileDownloader.downloadFile(
                name: 'tezash$widget.id.pdf',
                url:
                widget.bill_pdf,
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
            icon: const Icon(Icons.download),
          )
        ],
        title: Text("Bill No ${widget.id}"),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: _progress != null
          ? Center(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: const LoadingIndicatorWidget())),
      )
          :

      // _progress != null ? Center(child: Lottie.asset('assets/loading1.json'))
      //     :
      Container(
        color: darkYellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: const PDF(
              swipeHorizontal: true,
            ).cachedFromUrl(
                widget.bill_pdf// Use the provided PDF URL here
            ),
          ),
        ),
      ),
    );
  }
}