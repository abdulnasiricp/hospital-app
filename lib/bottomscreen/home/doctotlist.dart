import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/search.dart';
import 'package:TezHealthCare/custtom/doctorlistappbar.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

import '../../stringfile/enstring.dart';
import 'tabbarpage/all.dart';

class Doctotlist extends StatefulWidget {
  const Doctotlist({Key? key}) : super(key: key);

  @override
  State<Doctotlist> createState() => _DoctotlistState();
}

class _DoctotlistState extends State<Doctotlist>
    with SingleTickerProviderStateMixin {
  late ColorNotifier notifier;
  TabController? controller;
  List<Widget> tabs = const [
    All(),
    All(),
    All(),
    All(),
    All(),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: Doctorlistappbar(
          notifier.getwihitecolor,
          EnString.doctorList,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          GestureDetector(
            onTap: () {
              Get.to(
                const Search(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/serch.png", scale: 3.5),
            ),
          ),
          height: height / 15),
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: notifier.getperple,
              controller: controller,
              labelColor: notifier.getperple,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: EnString.all),
                Tab(text: EnString.crime),
                Tab(text: EnString.dentist),
                Tab(text: EnString.auth),
                Tab(text: EnString.sur),
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
