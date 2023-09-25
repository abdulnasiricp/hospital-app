
// ignore_for_file: file_names

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Pathology_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/ambulance_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/bloodbank.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/pharmacy_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/radiology_bill.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class MainTransactionScreen extends StatefulWidget {
  const MainTransactionScreen({Key? key}) : super(key: key);

  @override
  State<MainTransactionScreen> createState() => _MainTransactionScreenState();
}

class _MainTransactionScreenState extends State<MainTransactionScreen>
    with SingleTickerProviderStateMixin {
  late ColorNotifier notifier;
  TabController? controller;
  List<Widget> tabs = const [
    PathologyBill(),
    DirectBill(),
    RadiologyBill(),
    PharmacyBill(),
    AmbulanceBill(),
    BloodBank()
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: 6,
        vsync: this,
        initialIndex: 0,
        animationDuration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: AppBar(
        title: const Text('Transaction'),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            TabBar(
              labelPadding: const EdgeInsets.all(10),
              indicatorColor: notifier.getperple,
              // indicatorSize: TabBarIndicatorSize.label,label

              controller: controller,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: const [
                Text(
                  'Pathology Bill',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Direct Bill',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Radiology Bill',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Pharmacy Bill',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Ambulance Bill',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'BloodBank',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: TabBarView(
                  controller: controller,
                  children: tabs.map((tab) => tab).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
