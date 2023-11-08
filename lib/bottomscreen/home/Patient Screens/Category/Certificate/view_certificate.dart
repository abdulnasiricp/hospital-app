// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use, file_names


import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class ViewCertificate extends StatefulWidget {
  final String certificateLink;
  const ViewCertificate({Key? key, required this.certificateLink})
      : super(key: key);

  @override
  State<ViewCertificate> createState() => _ViewCertificateState();
}

class _ViewCertificateState extends State<ViewCertificate> {
  double? _progress;
  String PatientId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificate'.tr),
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
          : Container(
              color: darkYellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: const PDF(
                    swipeHorizontal: true,
                  ).cachedFromUrl(
                    widget.certificateLink,
                  ),
                ),
              ),
            ),
    );
  }
}
