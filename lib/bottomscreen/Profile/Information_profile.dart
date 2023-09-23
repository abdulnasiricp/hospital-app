// // ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unnecessary_string_interpolations
// import 'package:TezHealthCare/bottomscreen/home/address.dart';
// import 'package:TezHealthCare/bottomscreen/home/informationInformationProfile.dart';
// import 'package:TezHealthCare/bottomscreen/sehedule.dart';
// import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/helper_class.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:TezHealthCare/bottomscreen/home/activityhistory.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class InformationProfile extends StatefulWidget {
//   const InformationProfile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<InformationProfile> createState() => _InformationProfileState();
// }

// class _InformationProfileState extends State<InformationProfile> {
//   Future<void> _logout(BuildContext context) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.remove('username');
//     sharedPreferences.remove('password');

//     // Navigate to the login screen
//     Get.off(() => const MainSiginScreen());
//   }

//   late ColorNotifier notifier;
//   bool selectedindex = false;
//   bool selectedindex1 = false;
//   bool selectedindex2 = false;
//   bool selectedindex3 = false;
//   getdarkmodepreviousstate() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? previusstate = prefs.getBool("setIsDark");
//     if (previusstate == null) {
//       notifier.setIsDark = false;
//     } else {
//       notifier.setIsDark = previusstate;
//     }
//   }

//   @override
//   void initState() {
//     loadSP();
//     super.initState();
//     getdarkmodepreviousstate();
//   }

//   String patientId = '';
//   String role = '';
//   String username = '';
//   String record = '';
//   String genderrecord = '';
//   String imagerecord = '';
//   bool isLoading = true;
//   LoadData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       patientId = sharedPreferences.getString('patientidrecord') ?? '';
//       role = sharedPreferences.getString('role') ?? '';
//       username = sharedPreferences.getString('usernamerecord') ?? '';
//       record = sharedPreferences.getString('record') ?? '';
//       genderrecord = sharedPreferences.getString('genderrecord') ?? '';
//       imagerecord = sharedPreferences.getString('imagerecord') ?? '';
//     });
//   }

//   loadSP() async {
//     await LoadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     return ScreenUtilInit(
//       builder: (_, child) => Scaffold(
//           appBar: AppBar(
//             title: const Text('InformationProfile'),
//             centerTitle: true,
//             backgroundColor: darkYellow,
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                           color: darkYellow,
//                           borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(30),
//                               bottomRight: Radius.circular(30))),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 50.0, left: 20, right: 20),
//                       child: Container(
//                         height: 70,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             color: Utils.containerColor,
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(width: 1)),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 69,
//                               height: 69,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.network(
//                                     // '$imagerecord', // Replace with your image URL
//                                     'https://tse4.mm.bing.net/th?id=OIP.Nm1veNvgPX_af5ZkMbngagHaLJ&pid=Api&P=0&h=180',
//                                     width: 200.0, // Set the width (optional)
//                                     height: 200.0, // Set the height (optional)
//                                     fit: BoxFit
//                                         .cover, // Set the BoxFit (optional)
//                                     loadingBuilder:
//                                         (context, child, loadingProgress) {
//                                       if (loadingProgress == null) {
//                                         return child;
//                                       } else {
//                                         return CircularProgressIndicator(
//                                           color: darkYellow,
//                                           backgroundColor: yellow,
//                                         );
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Column(
//                               children: [
//                                 const Padding(padding: EdgeInsets.only(top: 20)),
//                                 Text(
//                                   "$username",
//                                   style: const TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Container(
//                                   height: 20, // Specify height (optional)
//                                   decoration: BoxDecoration(
//                                     color: Colors.green, // Background color
//                                     borderRadius: BorderRadius.circular(
//                                         10.0), // Border radius
//                                     // border: Border.all(
//                                     //   color: Colors.black, // Border color
//                                     //   width: 2.0, // Border width
//                                     // ),
//                                   ),
//                                   child: Center(
//                                       child: Text(
//                                     "Patient Id :- $patientId",
//                                     style:
//                                         const TextStyle(fontWeight: FontWeight.bold),
//                                   )),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         onTap: () {
//                           Get.to(() => const InformationInformationProfile());
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/person.png'),
//                           ),
//                         ),
//                         title: const Text('InformationProfile'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Get.to(() => const ActivityHistory());
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/history.png'),
//                           ),
//                         ),
//                         title: const Text('Q & A History'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Get.to(() => const Address());
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/pin.png'),
//                           ),
//                         ),
//                         title: const Text('Address'),
//                       ),
//                       ListTile(
//                         onTap: () {},
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/headset.png'),
//                           ),
//                         ),
//                         title: const Text('Help Center'),
//                       ),
//                       ListTile(
//                         onTap: () {},
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/help.png'),
//                           ),
//                         ),
//                         title: const Text('About Us'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Get.to(() => const Schedule());
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/Schedule.png'),
//                           ),
//                         ),
//                         title: const Text('Schedule'),
//                       ),
//                       ListTile(
//                         onTap: () {},
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/darkmode.png'),
//                           ),
//                         ),
//                         title: const Text('DarkMode'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           _logout(context);
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset(
//                               'assets/exit.png',
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                         title: const Text('Logout'),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// ignore_for_file: avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InformationProfile extends StatefulWidget {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  State<InformationProfile> createState() => _InformationProfileState();
}

class _InformationProfileState extends State<InformationProfile>
    with SingleTickerProviderStateMixin {
  var profileData;
  late String patientID = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    patientID = sp.getString('patientidrecord') ?? '';

    print(patientID);
    setState(() {});
  }

  Future<void> ProfileApi() async {
    const apiUrl = 'https://uat.tez.hospital/xzy/webservice/getPatientprofile';
    final headers = {
      'Soft-service': 'TezHealthCare',
      'Auth-key': 'zbuks_ram859553467',
    };

    final requestBody = jsonEncode({"patientId": 10723});

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profileJson =
            responseBody[0]; // Assuming your API returns a list with one item
        setState(() {
          profileData = ProfileData.fromJson(profileJson);
        });
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Request error: $e');
    }
  }

  getAllData() async {
    await LoadData();

    await ProfileApi();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  bool noDataAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkYellow,
          title: const Text('Information Profile'),
          centerTitle: true,
        ),
        body: profileData != null
            ? Column(
                children: [
                  Stack(children: [
                    Container(
                      width: width,
                      height: height / 3,
                      decoration: BoxDecoration(
                      color: darkYellow,
                      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40))

                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(profileData.image ?? ""),
                          radius: 60,
                        )),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 4.5),
                        child: Center(
                            child: Text(
                          profileData.patientName ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 3.5,
                          left: width / 15,
                          right: width / 15),
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: width,
                          height: height / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Patient ID',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData.id ?? "",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Gender',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData.gender ?? "",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Age',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      profileData.age ?? "",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'phone',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Blood Group',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Maritial Status',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Guardian Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width / 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profileData.email ?? "abd@gmail.com"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData.mobileNo ?? ""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData.bloodGroup ?? ""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData.address ?? ""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData.maritalStatus ?? "single"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(profileData.guardianName ?? ""),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const SizedBox()
        // :Center(child: Lottie.asset('assets/loading1.json'))

        );
  }
}
