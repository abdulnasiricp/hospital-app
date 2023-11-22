// ignore_for_file: file_names

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Overview/IPD_Discharge.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Overview/IPD_Examination.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Overview/IPD_Investigation.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class IpdOverviewMainScreen extends StatefulWidget {
  final String ipdid;
  const IpdOverviewMainScreen({Key? key, required this.ipdid}) : super(key: key);

  @override
  _IpdOverviewMainScreenState createState() => _IpdOverviewMainScreenState();
}

class _IpdOverviewMainScreenState extends State<IpdOverviewMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.yellow[100],
          isScrollable: false,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Examination'),
            Tab(text: 'Investigation'),
            Tab(text: 'Discharge'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          IpdExamination(ipdid: widget.ipdid),
          const IpdInvestigation(),
          const IpdDischarge(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
