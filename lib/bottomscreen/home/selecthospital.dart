import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:TezHealthCare/bottomscreen/home/pickatime.dart';
import 'package:TezHealthCare/custtom/doctorlist/custtomdoctorlist.dart';
import 'package:TezHealthCare/stringfile/enstring.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:provider/provider.dart';

class Selecthospital extends StatefulWidget {
  const Selecthospital({Key? key}) : super(key: key);

  @override
  State<Selecthospital> createState() => _SelecthospitalState();
}

class _SelecthospitalState extends State<Selecthospital> {
  var items = [
    'Nearest',
    'India',
    'USA',
    'Germany',
  ];
  late ColorNotifier notifier;
  String dropdownvalue = 'Nearest';
  bool selectedindex = false;
  bool selectedindex1 = false;
  bool selectedindex2 = false;
  bool selectedindex3 = false;
  bool selectedindex4 = false;
  bool selectedindex5 = false;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_ , child)  => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: AppBar(
          backgroundColor: notifier.getwihitecolor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset("assets/doctorlistbackarrow.png", scale: 3),
            ),
          ),
          centerTitle: true,
          title: Text(
            EnString.selectHospital,
            style:
                TextStyle(color: notifier.getblack, fontFamily: 'Gilroy_Bold'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: km(),
            ),
            SizedBox(width: width / 40)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex = !selectedindex;
                  });
                  Get.to(const PickATime());
                },
                child: Doctorlist(
                    "assets/mayao.png",
                    selectedindex ? notifier.getperple : Colors.transparent,
                    EnString.mayaHospital,
                    EnString.mumbaiMaharashtra,
                    "2 km",width / 6),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex1 = !selectedindex1;
                  });
                  Get.to(const PickATime());
                },
                child: Doctorlist(
                    "assets/cleveland.png",
                    selectedindex1 ? notifier.getperple : Colors.transparent,
                    EnString.artemisHospital,
                    EnString.sector,
                    "12 km",width / 5.5),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex2 = !selectedindex2;
                  });
                  Get.to(const PickATime());
                },
                child: Doctorlist(
                    "assets/john.png",
                    selectedindex2 ? notifier.getperple : Colors.transparent,
                    EnString.hardHospital,
                    EnString.athGatesSuratOpposite,
                    "8 km",width / 5.5),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex3 = !selectedindex3;
                  });
                  Get.to(const PickATime());
                },
                child: Doctorlist(
                    "assets/ucsf.png",
                    selectedindex3 ? notifier.getperple : Colors.transparent,
                    EnString.narayanaHealthHospital,
                    EnString.ahmadabad,
                    "2 km",width / 5.5),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex4 = !selectedindex4;
                  });
                  Get.to(const PickATime());
                },
                child: Doctorlist(
                    "assets/ucla.png",
                    selectedindex4 ? notifier.getperple : Colors.transparent,
                    EnString.columbiaAsiaHospital,
                    EnString.bangaloreKarnataka,
                    "16 km",width / 5.6),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex5 = !selectedindex5;
                  });
                  Get.to(
                    const PickATime(),
                  );
                },
                child: Doctorlist(
                    "assets/john.png",
                    selectedindex5 ? notifier.getperple : Colors.transparent,
                    EnString.hardHospital,
                    EnString.athGatesSuratOpposite,
                    "20 km",width / 5.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget km() {
    return DropdownButton(
      elevation: 0,
      underline: const SizedBox(),
      // Initial Value
      value: dropdownvalue,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: notifier.getblack,
      ),

      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: TextStyle(
                color: notifier.getblack,
                fontSize: 13.sp,
                fontFamily: 'Gilroy_Medium'),
          ),
        );
      }).toList(),

      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
