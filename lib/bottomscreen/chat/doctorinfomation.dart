// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:get/get.dart';
// import 'package:TezHealthCare/bottomscreen/chat/chat.dart';
// import 'package:TezHealthCare/bottomscreen/home/pickatime.dart';
// import 'package:TezHealthCare/bottomscreen/sehedule.dart';
// import 'package:TezHealthCare/custtom/custtombutton.dart';
// import 'package:TezHealthCare/custtom/custtomdoctorexpriancecard.dart';
// import 'package:TezHealthCare/custtom/doctorlistappbar.dart';
// import 'package:TezHealthCare/custtom/doctorratinglist.dart';
// import 'package:TezHealthCare/stringfile/enstring.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:provider/provider.dart';
//
// class Doctorinfo extends StatefulWidget {
//   const Doctorinfo({Key? key}) : super(key: key);
//
//   @override
//   State<Doctorinfo> createState() => _DoctorinfoState();
// }
//
// class _DoctorinfoState extends State<Doctorinfo> {
//   late ColorNotifier notifier;
//
//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     return ScreenUtilInit(
//       builder: (_ , child)  => Scaffold(
//         floatingActionButton: SizedBox(
//           height: height / 8,
//           width: width / 1.1,
//           child: GestureDetector(
//             onTap: () {
//               Get.to(const Schedule());
//             },
//             child: Button(EnString.solution, notifier.getperple,
//                 notifier.getwihitecolor, 2.sp, notifier.getwihitecolor),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         backgroundColor: notifier.getwihitecolor,
//         appBar: Doctorlistappbar(
//           notifier.getwihitecolor,
//           EnString.doctorInformation,
//           notifier.getblack,
//           "assets/doctorlistbackarrow.png",
//           GestureDetector(
//             onTap: () {
//               share();
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Image.asset("assets/share.png", scale: 3.5),
//             ),
//           ),
//           height: height / 15,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: SizedBox(
//                         height: height / 3.2,
//                         width: width / 1.1,
//                         child: notifier.isDark
//                             ? Image.asset("assets/doctorinformationcard.png",
//                                 color: notifier.getwihitecolor)
//                             : Image.asset(
//                                 "assets/doctorinformationcard.png",
//                               ),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 SizedBox(height: height / 50),
//                                 Row(
//                                   children: [
//                                     SizedBox(width: width / 11),
//                                     Image.asset("assets/Rectangledoctorinf.png",
//                                         height: height / 9),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 SizedBox(height: height / 50),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.only(left: width / 50),
//                                       child: Text(
//                                         EnString.drDon,
//                                         style: TextStyle(
//                                             color: notifier.getblack,
//                                             fontFamily: 'Gilroy_Bold',
//                                             fontSize: 15.sp),
//                                       ),
//                                     ),
//                                     SizedBox(width: width / 20),
//                                     Image.asset("assets/icochatpng.png",
//                                         height: height / 20)
//                                   ],
//                                 ),
//                                 SizedBox(height: height / 300),
//                                 Padding(
//                                   padding: EdgeInsets.only(right: width / 3.5),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.star,
//                                         color: Colors.yellow,
//                                         size: 20.sp,
//                                       ),
//                                       SizedBox(width: width / 50),
//                                       Text(
//                                         "4.5",
//                                         style: TextStyle(
//                                             fontSize: 12.sp,
//                                             color: notifier.getgrey),
//                                       ),
//                                       SizedBox(width: width / 50),
//                                       Text(
//                                         "(834)",
//                                         style: TextStyle(
//                                             fontSize: 12.sp,
//                                             color: notifier.getgrey),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.person_outline_outlined,
//                                       color: notifier.getperple,
//                                       size: 22.sp,
//                                     ),
//                                     Text(
//                                       EnString.psychologySurgery,
//                                       style: TextStyle(
//                                           fontFamily: 'Gilroy_Medium',
//                                           fontSize: 12.sp,
//                                           color: notifier.getgrey),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: height / 35),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: width / 9.5, right: width / 7.5),
//                           child: Divider(
//                             thickness: 1,
//                             color: notifier.getgrey,
//                           ),
//                         ),
//                         SizedBox(height: height / 50),
//                         Row(
//                           children: [
//                             SizedBox(width: width / 11),
//                             catogery(height / 25, width / 3.5,
//                                 "assets/Reviews.png", EnString.reviews),
//                             SizedBox(width: width / 50),
//                             catogery(height / 25, width / 3.5,
//                                 "assets/Thanks.png", EnString.thanks)
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: width / 15),
//                   Text(
//                     EnString.chooseDoctor,
//                     style: TextStyle(
//                         color: notifier.getblack,
//                         fontSize: 16.sp,
//                         fontFamily: 'Gilroy_Bold'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: height / 100),
//               GestureDetector(
//                   onTap: () {
//                     Get.to(const Chat());
//                   },
//                   child: chatwithdoctor()),
//               SizedBox(height: height / 50),
//               Row(
//                 children: [
//                   SizedBox(width: width / 15),
//                   Text(
//                     EnString.specialList,
//                     style: TextStyle(
//                         color: notifier.getblack,
//                         fontSize: 16.sp,
//                         fontFamily: 'Gilroy_Bold'),
//                   ),
//                   const Spacer(),
//                   Text(
//                     EnString.seeAll,
//                     style: TextStyle(
//                         color: const Color(0xff2AD3E7), fontSize: 12.sp),
//                   ),
//                   SizedBox(width: width / 12),
//                 ],
//               ),
//               SizedBox(height: height / 150),
//               Container(
//                 color: Colors.transparent,
//                 height: height / 6.9,
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(width: width / 25),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const PickATime());
//                           },
//                           child: selection(
//                               const Color(0xffedf2fe),
//                               Icons.person_outline,
//                               const Color(0xff679cff),
//                               "1000+",
//                               "patients",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const Chat());
//                           },
//                           child: selection(
//                               const Color(0xfffef0f2),
//                               Icons.account_tree_outlined,
//                               const Color(0xfffe79bc),
//                               "5 yr+",
//                               "Experience",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const Doctorinfo());
//                           },
//                           child: selection(
//                               const Color(0xfffef6ec),
//                               Icons.star_border,
//                               const Color(0xffffd237),
//                               "4.9",
//                               "Rating",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const PickATime());
//                           },
//                           child: selection(
//                               const Color(0xffedf2fe),
//                               Icons.person_outline,
//                               const Color(0xff679cff),
//                               "1000+",
//                               "patients",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const Chat());
//                           },
//                           child: selection(
//                               const Color(0xfffef0f2),
//                               Icons.account_tree_outlined,
//                               const Color(0xfffe79bc),
//                               "5 yr+",
//                               "Experience",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const Doctorinfo());
//                           },
//                           child: selection(
//                               const Color(0xfffef6ec),
//                               Icons.star_border,
//                               const Color(0xffffd237),
//                               "4.9",
//                               "Rating",
//                               height / 8,
//                               width / 4,
//                               height / 17,
//                               width / 8,
//                               20.sp,
//                               15.sp,
//                               11.sp,
//                               notifier.getblack,
//                               notifier.getgrey,
//                               notifier.getwihitecolor),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: height / 50),
//               Row(
//                 children: [
//                   SizedBox(width: width / 15),
//                   Text(
//                     EnString.reviewsUsers,
//                     style: TextStyle(
//                         color: notifier.getblack,
//                         fontSize: 16.sp,
//                         fontFamily: 'Gilroy_Bold'),
//                   ),
//                   const Spacer(),
//                   Text(
//                     EnString.seeAll,
//                     style: TextStyle(
//                         color: const Color(0xff2AD3E7), fontSize: 12.sp),
//                   ),
//                   SizedBox(width: width / 12),
//                 ],
//               ),
//               Doctorratinglist("assets/drone.png", Colors.transparent,
//                   EnString.jung, EnString.youLike, "12:35", width / 14),
//               SizedBox(height: height / 150),
//               Doctorratinglist("assets/drtwo.png", Colors.transparent,
//                   EnString.push, EnString.youLike, "12:35", width / 14),
//               SizedBox(height: height / 150),
//               Doctorratinglist("assets/drone.png", Colors.transparent,
//                   EnString.jung, EnString.youLike, "12:35", width / 14),
//               SizedBox(height: height / 7.5),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> share() async {
//     await FlutterShare.share(
//         title: 'Example share',
//         text: 'Example share text',
//         linkUrl: 'https://flutter.dev/',
//         chooserTitle: 'Example Chooser Title');
//   }
//
//   Widget chatwithdoctor() {
//     return Card(
//       color: notifier.getwihitecolor,
//       child: Container(
//         color: Colors.transparent,
//         height: height / 15,
//         width: width / 1.2,
//         child: Row(
//           children: [
//             SizedBox(width: width / 30),
//             Image.asset(
//               "assets/doctorchat.png",
//               height: height / 25,
//               color: notifier.getperple,
//             ),
//             SizedBox(width: width / 30),
//             Text(
//               EnString.doctorChat,
//               style: TextStyle(
//                   color: notifier.getblack,
//                   fontFamily: 'Gilroy_Medium',
//                   fontSize: 14.sp),
//             ),
//             const Spacer(),
//             Icon(
//               Icons.arrow_forward_ios_outlined,
//               color: notifier.getperple,
//               size: 14.sp,
//             ),
//             SizedBox(width: width / 30),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget catogery(ht, wt, image, txt) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Card(
//             color: notifier.getwihitecolor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(11.sp),
//               ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(11.sp),
//                 ),
//               ),
//               height: ht,
//               width: wt,
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: width / 13),
//                   child: Text(
//                     txt,
//                     style: TextStyle(
//                         color: notifier.getgrey,
//                         fontFamily: 'Gilroy_Medium',
//                         fontSize: 12.sp),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: width / 40),
//           child: Image.asset(image, height: height / 22),
//         )
//       ],
//     );
//   }
// }
