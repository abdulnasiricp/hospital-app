import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Custtomdoctorchat extends StatefulWidget {
  final String? image;
  final Color? bordercolor;
  final String? drname;
  final String? subname;
  final String? kmr;
  const Custtomdoctorchat(
      this.image, this.bordercolor, this.drname, this.subname, this.kmr,
      {Key? key})
      : super(key: key);

  @override
  State<Custtomdoctorchat> createState() => _CusttomdoctorchatState();
}

class _CusttomdoctorchatState extends State<Custtomdoctorchat> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            
            elevation: 1.5.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(11.sp),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.bordercolor!, width: 2.sp),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.sp),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: width / 80),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child:
                                Image.asset(widget.image!, height:140)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.drname!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'Gilroy_Bold',
                                      color: notifier.getblack),
                                ),
                                const SizedBox(width: 10),
                                km(widget.kmr)
                              ],
                            ),
                            const SizedBox(height:20),
                            Text(
                              widget.subname!,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Gilroy_Bold',
                                  color: notifier.getgrey),
                            ),
                            const SizedBox(height: 10),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget km(txt) {
    return Container(
      height: 20,
      width: 70,
      decoration: BoxDecoration(
        color: notifier.getkmcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch_later_outlined,
            color: const Color(0xff2AD3E7),
            size: 15.sp,
          ),
          Text(
            txt,
            style: TextStyle(
                color: const Color(0xff2AD3E7),
                fontSize: 13.sp,
                fontFamily: 'Gilroy_Medium'),
          ),
        ],
      )),
    );
  }
}
