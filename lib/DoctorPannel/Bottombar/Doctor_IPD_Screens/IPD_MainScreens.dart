// ignore_for_file: file_names

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/Cardex/IPD_Cardex.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Bed_History.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Medication.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Operations.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_IPD_Screens/IPD_Overview/IPD_OverviewMain.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class IpdMainScreen extends StatefulWidget {
  final String ipdid;
  const IpdMainScreen({Key? key, required this.ipdid}) : super(key: key);

  @override
  _IpdMainScreenState createState() => _IpdMainScreenState();
}

class _IpdMainScreenState extends State<IpdMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IPD'),
        centerTitle: true,
        backgroundColor: darkYellow,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.yellow[100],
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Cardex'),
            Tab(text: 'Medication'),
            Tab(text: 'Operations'),
            Tab(text: 'Bed History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          IpdOverviewMainScreen(ipdid: widget.ipdid),
          const IPDCardex(),
          const IpdMedication(),
          const IpdOperations(),
          const IpdBedHistory(),
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
