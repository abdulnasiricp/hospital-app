import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';
class Button extends StatefulWidget {
  final String? buttontext;
  final Color? colorbutton;
  final Color? buttontextcolor;
  final double? elv;
  final Color? cardcolor;

  const Button(this.buttontext, this.colorbutton, this.buttontextcolor, this.elv,
      this.cardcolor, {Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  get borderRadius => BorderRadius.circular(15);

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_ , child)  => Center(
        child: LayoutBuilder(builder: (context, constraints) {
          // print(constraints);
          return Card(
            elevation: widget.elv!,
            color: widget.cardcolor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: height / 15,
                width: width / 1.1,
                decoration: BoxDecoration(
                  color: widget.colorbutton!,
                  borderRadius: borderRadius,
                ),
                child: Center(
                  child: Text(
                    widget.buttontext!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Gilroy_Medium',
                        fontSize: 15.sp,
                        color: widget.buttontextcolor),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
