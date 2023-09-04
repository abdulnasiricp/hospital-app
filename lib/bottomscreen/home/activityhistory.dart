import 'package:flutter/material.dart';
import 'package:TezHealthCare/bottombar/paybill.dart';
import 'package:TezHealthCare/bottomscreen/home/activityhistorytabs/appointmentschedule.dart';
import 'package:TezHealthCare/bottomscreen/home/activityhistorytabs/question.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory>
    with SingleTickerProviderStateMixin {
  late ColorNotifier notifier;
  TabController? controller;
  List<Widget> tabs = const [Appointmentschedule(), PayBill(), Question()];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(
        Colors.transparent,
        EnString.activityHistory,
        notifier.getblack,
        "assets/doctorlistbackarrow.png",
        height: height / 15,
      ),
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: notifier.getperple,
              // indicatorSize: TabBarIndicatorSize.label,label

              controller: controller,
              labelColor: notifier.getperple,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: EnString.appointmentSchedule),
                Tab(text: EnString.bill),
                Tab(text: EnString.question),
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
