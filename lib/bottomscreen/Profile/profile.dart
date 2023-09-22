// // ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unnecessary_string_interpolations
// import 'package:TezHealthCare/bottomscreen/home/address.dart';
// import 'package:TezHealthCare/bottomscreen/home/informationprofile.dart';
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

// class Profile extends StatefulWidget {
//   const Profile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
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
//             title: const Text('Profile'),
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
//                           Get.to(() => const InformationProfile());
//                         },
//                         leading: Container(
//                           width: 20,
//                           height: 20,
//                           child: ClipRRect(
//                             child: Image.asset('assets/person.png'),
//                           ),
//                         ),
//                         title: const Text('Profile'),
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

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
            Container(
              color: darkYellow,
              width: width,
              height: height / 4,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height / 5, left: width / 15, right: width / 15),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width,
                  height: height / 6,
                ),
              ),
            ),
          ]),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Text('Email',style: TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 20,),
                  Text('phone',style: TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 20,),

                  Text('Blood Group',style: TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 20,),

                  Text('Address',style: TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 20,),

                  Text('Maritial Status',style: TextStyle(fontWeight:FontWeight.bold ),),
                  SizedBox(height: 20,),

                  Text('Guardian Name',style: TextStyle(fontWeight:FontWeight.bold ),),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: width/3),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email'),
                    SizedBox(height: 20,),
              
                    Text('number'),
                    SizedBox(height: 20,),
              
                    Text('number'),
                    SizedBox(height: 20,),
              
                    Text('number'),
                    SizedBox(height: 20,),
              
                    Text('number'),
                    SizedBox(height: 20,),
              
                    Text('number'),
                  ],
                ),
              ),
            ],),
          )
        ],
      ),
    );
  }
}
