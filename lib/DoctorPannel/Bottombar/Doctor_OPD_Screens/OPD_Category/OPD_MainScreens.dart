
// ignore_for_file: file_names

import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Examination.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_Pre_Checking.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OPD_investigation.dart';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_OPD_Screens/OPD_Category/OpdCheckout.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class OpdMainScreen extends StatefulWidget {
  const OpdMainScreen({Key? key}) : super(key: key);

  @override
  _OpdMainScreenState createState() => _OpdMainScreenState();
}

class _OpdMainScreenState extends State<OpdMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPD'),
        centerTitle: true,
        backgroundColor: darkYellow,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.yellow[100],
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pre-Checking'),
            Tab(text: 'Examination'),
            Tab(text: 'Investigation'),
            Tab(text: 'Checkout'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OpdPreChecking(),
          OpdExamination(),
          OpdInvestigation(),
          OpdCheckout(),
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