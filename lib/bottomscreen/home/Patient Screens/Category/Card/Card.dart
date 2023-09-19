
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  double _progress=0;
  late InAppWebViewController inAppWebViewController;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse("https://uat.tez.hospital/admin/generatecertificate/generatepatientidcardPdf/10380")),
              onWebViewCreated: (InAppWebViewController controller){
                inAppWebViewController= controller;
              },
              onProgressChanged: (InAppWebViewController controller,int progress){
                setState(() {
                  _progress =progress/100;
                });
              },
            ),
            _progress<1?Container(
              child: Center(
                child: CircularProgressIndicator(
                  value: _progress,
                ),
              ),
            ):const SizedBox()
    
          ],
        )
        
      ),
    );
  }}
    