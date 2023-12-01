
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerScreen extends StatefulWidget {
  final String? bill_pdf;

  const PdfViewerScreen({Key? key,  this.bill_pdf}) : super(key: key);
  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PDFViewController pdfController;

  int pages = 0;
  int currentPage = 0;
 
  @override
  Widget build(BuildContext context) {
    print('------------${widget.bill_pdf}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: darkYellow,
      ),
      body:PDFView(
              filePath: widget.bill_pdf,
             
             onViewCreated: (PDFViewController pdfViewController) {
  setState(() {
    pdfController = pdfViewController;
  });
},
onError: (error) {
  print(error);


              },
           
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Page $currentPage of $pages',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
