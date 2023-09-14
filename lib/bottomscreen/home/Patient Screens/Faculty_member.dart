// // ignore_for_file: file_names, sized_box_for_whitespace

// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';

// class FacultyMembers extends StatefulWidget {
//   const FacultyMembers({Key? key}) : super(key: key);

//   @override
//   State<FacultyMembers> createState() => _FacultyMembersState();
// }

// class _FacultyMembersState extends State<FacultyMembers> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(.8),
//       appBar: AppBar(
//         backgroundColor: darkYellow,
//         title: const Text('Faculty Members'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             const Text(
//               "Members",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Container(
//               width: width,
//               height: height / 3,
//               child: Card(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         height: height/6,
//                         width: width / 4,
//                        decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Image.asset('assets/drtwo.png',fit: BoxFit.cover,),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top:10.0),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: width/2,
//                             height: height/25,
//                             decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('Abdul Nasir')),
//                           ),
//                           SizedBox(height: 5,),
//                            Container(
//                             width: width/2,
//                                                        height: height/25,

//                             decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('MBBS')),
//                           ),
//                           SizedBox(height: 5,),

//                            Container(
//                             width: width/2,
//                             height: height/25,
//                            decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('+92 3429107173')),
//                           ),
//                            SizedBox(height: 5,),

//                            Container(
//                             width: width/2,
//                             height: height/25,
//                            decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('abdulnasiricp@gmail.com')),
//                           ),
//                            SizedBox(height: 5,),

//                           Row(children: [
//                              Container(
//                             width: width/6,
//                             height: height/25,
//                            decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('MBBS')),
//                           ),
//                             Container(
//                             width: width/6,
//                             height: height/25,
//                            decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('16 years')),
//                           ),
//                             Container(
//                             width: width/6,
//                             height: height/25,
//                            decoration: BoxDecoration(
//                               border: Border.all()
//                             ),
//                             child: Center(child: Text('Doctor')),
//                           ),

//                           ],)
//                         ],
//                       ),
//                     ),
                    
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: avoid_unnecessary_containers, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, prefer_const_constructors

import 'package:TezHealthCare/utils/colors.dart';
// ignore: duplicate_import
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FacultyMembers extends StatefulWidget {
  const FacultyMembers({Key? key}) : super(key: key);

  @override
  State<FacultyMembers> createState() => _FacultyMembersState();
}

class _FacultyMembersState extends State<FacultyMembers> {
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  // List<dynamic>? DoneListData;
  List<dynamic>? DoneListData = [];
  String searchTerm = '';

  Future hitApi() async {
    final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['doctors'];
        print(DoneListData);
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    hitApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('Select a Faculty mamber'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Center(
            child: DoneListData != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                            
                            onChanged: (value) {
                              setState(() {
                                searchTerm = value;
                              });
                            },
                            decoration: const InputDecoration(

                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Search your Faculty mamber',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                prefixIcon: Icon(Icons.search)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                             
                              itemCount: DoneListData!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width ,
                                      child: Card(
                                          color:
                                              Colors.white.withOpacity(0.9),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Container(width: width/5,height: 100,
                                                child: Image.asset('assets/drtwo.png',fit: BoxFit.cover,),
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                   
                                                    Text(
                                                      'Dr. ${DoneListData![index]['name']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        // '${DoneListData![index]['specialization']}'),
                                                        'Surgery'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        '97 234322 3242  '),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        'abdulnasiricp@gmail.com'),
                                                    SizedBox(height: 10,),
                                                    Row(children: [
                                                      // Text('${DoneListData![index]['qualification']},'),
                                                      Text('Doctor'),
                                                      SizedBox(width: 10,),

                                                      // Text('${DoneListData![index]['work_exp']},'),
                                                      Text('20 years Experince'),
                                                      SizedBox(width: 10,),

                                                      
                                                      Text('${DoneListData![index]['user_type']}'),

                                                    ],)
                                                    // Container(
                                                    //   height: 30,
                                                    //   width: width,
                                                    //   decoration: BoxDecoration(
                                                    //     border: Border.all(),
                                                    //     color: yellow,
                                                    //     borderRadius:
                                                    //         BorderRadius.circular(
                                                    //             10),
                                                    //   ),
                                                    //   child: Center(
                                                    //     child: Text(
                                                    //       'Book Appointment',
                                                    //       style: TextStyle(
                                                    //           fontWeight:
                                                    //               FontWeight
                                                    //                   .bold),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator()));
  }
}
