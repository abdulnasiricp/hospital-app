import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class TermAndConditionsScreen extends StatefulWidget {
   final String url;
  const TermAndConditionsScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<TermAndConditionsScreen> createState() => _TermAndConditionsScreenState();
}

class _TermAndConditionsScreenState extends State<TermAndConditionsScreen> {
InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('termsAndCondition'.tr),centerTitle: true,backgroundColor: darkYellow,),
    body: InAppWebView(
     initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
     onWebViewCreated: (controller) {
     webView = controller;
     }),
    );
  }
}