import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/General_Opd_Tickets_Form.dart';
import 'package:TezHealthCare/bottomscreen/home/General_Opd_Tickets/Insurance_opd_Ticket.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Opd_Main_Screen extends StatefulWidget {
  const Opd_Main_Screen({Key? key}) : super(key: key);

  @override
  _Opd_Main_ScreenState createState() => _Opd_Main_ScreenState();
}

class _Opd_Main_ScreenState extends State<Opd_Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkYellow,
        appBar: AppBar(
          title: const Text('OPD Ticket'),
          centerTitle: true,
          backgroundColor: darkYellow,
          actions: [
            IconButton(
              onPressed: () {
                _opdTicketInfo(context);
              },
              icon: SvgPicture.asset(
                'assets/info1.svg',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ButtonsTabBar(
                height: 50,
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                backgroundColor: yellow,
                unselectedBackgroundColor: whitecolor.withOpacity(0.5),
                labelStyle: const TextStyle(
                  wordSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                borderWidth: width / 2,
                tabs: [
                  Tab(
                    child: Container(
                      width: width / 2,
                      child: Center(
                        child: const Text(
                          "General",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: width / 2,
                      child: Center(
                        child: const Text(
                          "Insurance",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    General_Opd_Tickets_Form(),
                    Insurance_opd_Ticket(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _opdTicketInfo(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Process Of Ticket Booking',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SfPdfViewer.network(
                          'https://connectips.com/images/files/termsandconditionsenglish.pdf',
                          canShowPaginationDialog: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
