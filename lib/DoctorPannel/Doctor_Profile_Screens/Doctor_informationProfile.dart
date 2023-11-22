import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorInformationProfile extends StatefulWidget {
  const DoctorInformationProfile({Key? key}) : super(key: key);

  @override
  State<DoctorInformationProfile> createState() =>
      _DoctorInformationProfileState();
}

class _DoctorInformationProfileState extends State<DoctorInformationProfile>
    with SingleTickerProviderStateMixin {
  late String DoctorId = '';
  late String DoctorName = '';
  late String DoctorEmail = '';
  late String DoctorGender = '';
  late String DoctorImage = '';
  late String DoctorMobile = '';
  late String DoctorAddress = '';
  late String dob = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    DoctorId = sp.getString('id') ?? '';
    dob = sp.getString('dob') ?? '';
    DoctorName = sp.getString('username') ?? '';
    DoctorEmail = sp.getString('email') ?? '';
    DoctorGender = sp.getString('gender') ?? '';
    DoctorImage = sp.getString('image') ?? '';
    DoctorMobile = sp.getString('mobile') ?? '';
    DoctorAddress = sp.getString('local_address') ?? '';

    print('========$DoctorId');
    setState(() {});
  }

  getAllData() async {
    await LoadData();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  bool noDataAvailable = false;
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('informationProfile'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height / 3,
                  decoration: BoxDecoration(
                    color: darkYellow,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(DoctorImage),
                        radius: height / 11,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 4.5),
                    child: Center(
                      child: Text(
                        (DoctorName).isEmpty ? 'N/A' : DoctorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height / 3.5, left: width / 15, right: width / 15),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('DoctorID'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  (DoctorId).isEmpty ? 'N/A' : DoctorId,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('patientGender'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  (DoctorGender).isEmpty ? 'N/A' : DoctorGender,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('age'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  calculateAge(dob),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'patientEmail'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'patientPhone'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'patientAddress'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (DoctorEmail).isEmpty ? 'N/A' : DoctorEmail,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          (DoctorMobile).isEmpty ? 'N/A' : DoctorMobile,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          (DoctorAddress).isEmpty ? 'N/A' : DoctorAddress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Add this function to calculate age, month, and day
  String calculateAge(String dob) {
    if (dob.isEmpty) {
      return 'N/A';
    }

    // Parse the date of birth string to a DateTime object
    DateTime birthDate = DateTime.parse(dob);

    // Calculate the difference in years, months, and days between the birth date and today's date
    int age = DateTime.now().year - birthDate.year;
    int month = DateTime.now().month - birthDate.month;
    int day = DateTime.now().day - birthDate.day;

    // Adjust age based on the current month and day
    if (month < 0 || (month == 0 && day < 0)) {
      age--;
      month = 12 + month; // Adjust month if negative
    }

    // Format the string to display age, month, and day
    String ageString = age.toString();
    String monthString = month == 0 ? '' : '$month months';
    String dayString = day == 0 ? '' : '$day days';

    return '$ageString years $monthString $dayString';
  }
}
