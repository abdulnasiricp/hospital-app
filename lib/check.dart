// // ignore_for_file: sized_box_for_whitespace

// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class PaymentSuccessfullScreen extends StatelessWidget {
//   const PaymentSuccessfullScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true,backgroundColor: darkYellow),
//       body: Container(
//         // height: height / 1.6,
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(15.0),
//                   child: Center(
//                       child: Text(
//                     'Payment Successfull!',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//                 Container(
//                     width: width / 3,
//                     height: height / 7,
//                     child: Lottie.asset('assets/done.json')),
//                 Column(
//                   children: [
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Payment Mode',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
                              
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Transaction id',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Pathology Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Radiology Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Direct Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Pharmacy Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Ambulance Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Blood Bank Dues',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Net Banking',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
                             
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('12123434',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Pathology Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text('22',
//                     //               // "${widget.path_Amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Radiology Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //           right: 20, top: 10, left: 10, bottom: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text('200',
//                     //               // "${widget.radio_Amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Direct Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //           right: 20, top: 10, left: 10, bottom: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text('',
//                     //               // "${widget.direct_amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Pharmacy Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //           right: 20, top: 10, left: 10, bottom: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text('',
//                     //               // "${widget.phrma_Amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Ambulance Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //           right: 20, top: 10, left: 10, bottom: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text('',
//                     //               // "${widget.ambulance_Amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // const Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.all(10.0),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text(
//                     //             'Blood Bank Dues',
//                     //             style: TextStyle(fontWeight: FontWeight.bold),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //           right: 20, top: 10, left: 10, bottom: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Text("",
//                     //               // "${widget.blood_Amount}",
//                     //               style: TextStyle(fontWeight: FontWeight.bold)),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     const Padding(
//                       padding: EdgeInsets.only(
//                         right: 20,
//                         left: 10,
//                       ),
//                       child: Divider(
//                         color: Colors.black54,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'totalhospitalDueAmount'.tr,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding:
//                               EdgeInsets.only(right: 20, left: 10, bottom: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('',
//                                   // "${widget.totalAmountInRs}",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                           width: width / 4,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text('Save'),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all(darkYellow),
//                             ),
//                           )),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Container(
//                           width: width / 4,
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 Get.back();
//                               },
//                               child: const Text('Close'),
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(darkYellow),
//                               ))),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }












// const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Pathology Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.all(10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text('22',
                  //               // "${widget.path_Amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Radiology Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: 20, top: 10, left: 10, bottom: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text('200',
                  //               // "${widget.radio_Amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Direct Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: 20, top: 10, left: 10, bottom: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text('',
                  //               // "${widget.direct_amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Pharmacy Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: 20, top: 10, left: 10, bottom: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text('',
                  //               // "${widget.phrma_Amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Ambulance Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: 20, top: 10, left: 10, bottom: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text('',
                  //               // "${widget.ambulance_Amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Blood Bank Dues',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: 20, top: 10, left: 10, bottom: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text("",
                  //               // "${widget.blood_Amount}",
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),