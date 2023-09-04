import 'package:flutter/material.dart';
import 'package:TezHealthCare/custtom/appbar.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loream extends StatefulWidget {
  final String? title;
  const Loream({Key? key, required this.title}) : super(key: key);

  @override
  State<Loream> createState() => _LoreamState();
}

class _LoreamState extends State<Loream> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          Colors.transparent,
          widget.title!,
          notifier.getblack,
          "assets/doctorlistbackarrow.png",
          height: height / 15,
        ),
        body: Center(
          child: Text(
            "Contrary to popular belief, Lorem Ipsum is not simply random \nIt has roots in a piece of classical Latin literature from 45 BC,\nmaking it over 2000 years old. Richard McClintock, a Latin\nprofessor at Hampden-Sydney College in Virginia,\nlooked up one of st line of Lorem Ipsum,  ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, color: notifier.getblack),
          ),
        ),
      ),
    );
  }
}
