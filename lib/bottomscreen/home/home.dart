// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:TezHealthCare/bottomscreen/profile.dart';
// import 'package:TezHealthCare/custtom/custtomdoctorexpriancecard.dart';
// import 'package:TezHealthCare/custtom/doctorlist/custtomdoctorlist.dart';
// import 'package:TezHealthCare/custtom/homeappbar/homeappbar.dart';
// import 'package:TezHealthCare/stringfile/enstring.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:provider/provider.dart';

// import '../../utils/mediaqury.dart';
// import 'doctotlist.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late ColorNotifier notifier;
//   late List<AnimatedTextExample> _examples;
//   int index = 0;
//   int tapCount = 0;
//   bool showImageWidget = false;
//   @override
//   void initState() {
//     super.initState();
//     _examples = animatedTextExamples(onTap: () {
//       setState(() {
//         tapCount++;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final animatedTextExample = _examples[index];
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     return ScreenUtilInit(
//       builder:(ctx, child)=> Scaffold(
//         backgroundColor: notifier.getwihitecolor,
//         appBar: HomeCustomAppBar(
//           Colors.transparent,
//           "",
//           Colors.transparent,
//           "assets/pro.png",
//           "assets/alarm.png",
//           GestureDetector(
//             onTap: () {
//               Get.to(
//                 const Profile(),
//               );
//             },
//             child: Image.asset("assets/pro.png", scale: 3.5),
//           ),
//           height: height / 15,
//         ),

//       ),
//     );
//   }

//   Widget locatename(txt, iconcolor, textcolor, locationcolor) {
//     return Container(
//       color: Colors.transparent,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Icon(
//               Icons.location_on_outlined,
//               size: 20.sp,
//               color: locationcolor,
//             ),
//             SizedBox(width: width / 100),
//             Text(
//               txt,
//               style: TextStyle(
//                   fontFamily: 'Gilroy_Medium',
//                   fontSize: 14.5.sp,
//                   color: textcolor),
//             ),
//             const Spacer(),
//             Icon(
//               Icons.done,
//               size: 17.sp,
//               color: iconcolor,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget doctorap(color, value, child) {
//     return Container(
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(color: notifier.getgrey),
//         borderRadius: BorderRadius.all(
//           Radius.circular(13.sp),
//         ),
//       ),
//       height: 50.0.h,
//       width: 300.0.w,
//       child: Center(
//         key: ValueKey(value),
//         child: child,
//       ),
//     );
//   }
// }

// class AnimatedTextExample {
//   final String label;
//   final Color? color;
//   final Widget child;

//   const AnimatedTextExample({
//     required this.label,
//     required this.color,
//     required this.child,
//   });
// }

// List<AnimatedTextExample> animatedTextExamples(
//     {VoidCallback? onTap, context}) =>
//     <AnimatedTextExample>[
//       AnimatedTextExample(
//         label: 'Rotate',
//         color: Colors.transparent,
//         child: Row(
//           children: [
//             SizedBox(width: width / 30),
//             Image.asset("assets/medical-history.png", height: height / 30),
//             SizedBox(width: width / 40),
//             Container(
//               color: Colors.transparent,
//               height: 200.h,
//               width: 240.w,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       AnimatedTextKit(
//                         animatedTexts: [
//                           RotateAnimatedText(EnString.meetDrChikanso,
//                               textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                           RotateAnimatedText(EnString.drJustin,
//                               textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                           RotateAnimatedText(EnString.drMaria,
//                               textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                         ],
//                         onTap: onTap,
//                         isRepeatingAnimation: true,
//                         totalRepeatCount: 10,
//                       ),
//                       SizedBox(width: width / 4),
//                       AnimatedTextKit(
//                         animatedTexts: [
//                           RotateAnimatedText("14:30 PM",
//                               textStyle: TextStyle(
//                                   color: const Color(0xff2AD3E7),
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                           RotateAnimatedText("1:45 PM",
//                               textStyle: TextStyle(
//                                   color: const Color(0xff2AD3E7),
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                           RotateAnimatedText("1:3 AM",
//                               textStyle: TextStyle(
//                                   color: const Color(0xff2AD3E7),
//                                   fontSize: 12.sp,
//                                   fontFamily: 'Gilroy_Bold')),
//                         ],
//                         onTap: onTap,
//                         isRepeatingAnimation: true,
//                         totalRepeatCount: 10,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ];

// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  // Get.to(() => const NotificationScreen());
                },
                icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.notifications))),
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  // Get.to(()=>const MyProfile());
                },
                icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.search))),
          ],
          // backgroundColor: Utils.appbarColor,
          // foregroundColor: Utils.appbarForgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Friday, 4 Sep'),
                const Text(
                  'Hi, Dr.Abdul Nasir',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/doctor.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Doctors",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/Dentist.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Dentist",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/ambulance.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Ambulance",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/medisin.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Medicine",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/eye.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Eye",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/care.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Care",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Hire Now ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 130,
                  child: Card(
                    child: Row(children: [
                      Container(
                        width: 130,
                        child: Image.asset('assets/drone.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Dr. Chhaya Gaikvad',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Angiolory'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5(835)')
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [Icon(Icons.location_on), Text('2 KM')],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 130,
                  child: Card(
                    child: Row(children: [
                      Container(
                          width: 130, child: Image.asset('assets/drtwo.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Dr. Justin Biber',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Angiolory'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5(835)')
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [Icon(Icons.location_on), Text('2 KM')],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 130,
                  child: Card(
                    child: Row(children: [
                      Container(
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/drthree.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Dr. Maria Anna',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Angiolory'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5(835)')
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [Icon(Icons.location_on), Text('2 KM')],
                        ),
                      ),
                    ]),
                  ),
                ),
                 const SizedBox(
                  height: 20,
                ),
                const Text("Hire Expert",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 130,
                  child: Card(
                    child: Row(children: [
                      Container(
                        width: 130,
                        child: Image.asset('assets/drone.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Dr. Chhaya Gaikvad',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Angiolory'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5(835)')
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [Icon(Icons.location_on), Text('2 KM')],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 130,
                  child: Card(
                    child: Row(children: [
                      Container(
                          width: 130, child: Image.asset('assets/drtwo.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Dr. Justin Biber',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Angiolory'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5(835)')
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [Icon(Icons.location_on), Text('2 KM')],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
