
// ignore_for_file: file_names, avoid_unnecessary_containers, avoid_print

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
              initialUrlRequest: URLRequest(url: Uri.parse('https://www.google.com/')),
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
              child: CircularProgressIndicator(
                value: _progress,
              ),
            ):const SizedBox()
    
          ],
        )
        
      ),
    );
  }}
    