// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourWidget extends StatefulWidget {
  const YourWidget({Key? key}) : super(key: key);

  @override
  _YourWidgetState createState() => _YourWidgetState();
}
//kkkkkkkkkkkkkkkkkkkkkkkkk

class _YourWidgetState extends State<YourWidget> {
  String selectedItem = 'Registered';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'OPD ID',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Patient Name',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Consultant',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Last Visit",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'status',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const OpdMainScreen());
                                      },
                                      child: Container(
                                        width: width / 8,
                                        child: const Center(
                                          child: Text(
                                            "OPDN7695",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width / 6, // Adjusted width
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          child: const Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Center(
                                              child: Text(
                                                "chhotelal ram",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width / 4,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          child: const Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Center(
                                              child: Text(
                                                'Madhurendra Tiwari (9001)',
                                                overflow:
                                                TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width / 4,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          child: const Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Center(
                                              child: Text(
                                                '13/11/2023 11:58 AM',
                                                overflow:
                                                TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: DropdownButton<String>(
                                        value: selectedItem,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedItem = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Registered',
                                          'Pre-Checking',
                                          'Examination',
                                          'Investigation',
                                          'Report',
                                          'Checkout',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpdMainScreen extends StatelessWidget {
  const OpdMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPD Main Screen'),
      ),
      body: const Center(
        child: Text('This is the OPD Main Screen'),
      ),
    );
  }
}
//  TextEditingController DiagnosisController = TextEditingController();
//   String selectedOtherItemsId = '';
//   String selectedOtherItemsName = '';
//   List<String> selectedOtherItems = [];
//   List<dynamic>? otherdata = [];
//   List<dynamic>? otherfilteredData = [];

//   Future<void> fetchotherData() async {
//     Uri.parse(ApiLinks.singleTableDataDetector);

//     final body = {"table": "finding"};

//     final response = await http.post(
//       Uri.parse(ApiLinks.singleTableDataDetector),
//       headers: ApiLinks.MainHeader,
//       body: json.encode(body),
//     );

//     if (response.statusCode == 200) {
//       final dataMap = json.decode(response.body);
//       setState(() {
//         otherdata = dataMap['result'];
//         otherfilteredData = otherdata;
//         isLoading = false;
//       });
//     } else {
//       handleNonJsonResponse();
//     }
//   }

//   bool isLoading = true;
//   void handleNonJsonResponse() {
//     print('Non-JSON response or API error');
//     setState(() {
//       isLoading = false;
//     });
//   }
//   ////////////////////

//   void otherfilterData(String query) {
//     setState(() {
//       otherfilteredData = otherdata
//           ?.where((element) =>
//               element['name'].toLowerCase().contains(query.toLowerCase()) ||
//               element['id'].toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
// //=================================================================================



  // TextEditingController othersearchController = TextEditingController();
  // String selectedotherdata = '';
  // String selectedotherId = '';
  // TextEditingController otherController = TextEditingController();

  // void _showOtherSelection(BuildContext context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
  //     ),
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState) {
  //           return Container(
  //             height: MediaQuery.of(context).size.height * 0.8,
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment
  //                       .spaceBetween, // Align items at the ends
  //                   children: <Widget>[
  //                     const Expanded(
  //                       child: Center(
  //                         child: Text(
  //                           'Select Data',
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     IconButton(
  //                       icon: const Icon(Icons.close), // Close icon
  //                       onPressed: () {
  //                         Navigator.of(context).pop(); // Close the bottom sheet
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 8.0, right: 8),
  //                   child: Container(
  //                     width: width / 0.8,
  //                     height: 50,
  //                     child: TextFormField(
  //                       controller: othersearchController,
  //                       onChanged: (query) {
  //                         setState(() {
  //                           otherfilterData(query);
  //                         });
  //                       },
  //                       decoration: const InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         suffixIcon: Icon(Icons.search),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 isLoading
  //                     ? Expanded(
  //                         child: Padding(
  //                         padding: const EdgeInsets.all(10.0),
  //                         child: Container(
  //                           height: 50,
  //                           width: 50,
  //                           color: Colors.transparent,
  //                           child: const LoadingIndicatorWidget(),
  //                         ),
  //                       ))
  //                     : otherfilteredData!.isEmpty
  //                         ? Expanded(
  //                             child: Center(
  //                             child: Container(
  //                               height: 150,
  //                               width: 150,
  //                               child: Lottie.asset(
  //                                 'assets/No_Data_Found.json',
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ))
  //                         : Expanded(
  //                             child: ListView.builder(
  //                               itemCount: otherfilteredData?.length,
  //                               itemBuilder: (BuildContext context, int index) {
  //                                 String itemName =
  //                                     otherfilteredData?[index]['name'] ?? '';
  //                                 String itemId =
  //                                     otherfilteredData?[index]['id'] ?? '';
  //                                 bool isSelected =
  //                                     selectedOtherItems.contains(itemName);

  //                                 int itemNumber = index + 1;
  //                                 return Card(
  //                                   color: isSelected
  //                                       ? Colors.green
  //                                       : Colors.white70.withOpacity(0.7),
  //                                   child: ListTile(
  //                                     title: Text(
  //                                       '$itemNumber.$itemName',
  //                                       style: TextStyle(
  //                                         fontWeight: isSelected
  //                                             ? FontWeight.bold
  //                                             : FontWeight.normal,
  //                                       ),
  //                                     ),
  //                                     onTap: () {
  //                                       setState(() {
  //                                         if (isSelected) {
  //                                           selectedOtherItems.remove(itemName);
  //                                         } else {
  //                                           selectedOtherItems.add(itemName);
  //                                         }
  //                                         DiagnosisController.text =
  //                                             selectedOtherItems.join(', ');

  //                                         // Update the selectedOtherItemsId based on selectedOtherItems
  //                                         selectedOtherItemsId =
  //                                             selectedOtherItems
  //                                                 .map((itemName) =>
  //                                                     otherfilteredData
  //                                                         ?.firstWhere((data) =>
  //                                                             data['name'] ==
  //                                                             itemName)['id'])
  //                                                 .join(',');

  //                                         // Update the selectedOtherItemsName based on selectedOtherItems
  //                                         selectedOtherItemsName =
  //                                             selectedOtherItems.join(', ');
  //                                       });
  //                                     },
  //                                   ),
  //                                 );
  //                               },
  //                             ),
  //                           ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
// // //==========================================================================================



// Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Diagnosis',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     width: width / 2.2,
//                     height: 30,
//                     color: Colors.green[300],
//                     child: const Center(
//                         child: Text(
//                       'Diagnosis',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                     )),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     width: width / 2.2,
//                     height: 50,
//                     child: Center(
//                       child: InkWell(
//                           child: TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'This field is required';
//                           }
//                           return null;
//                         },
//                         readOnly:
//                             true, // Set this to true to disable the keyboard
//                         controller: DiagnosisController,
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: const Icon(
//                               Icons.arrow_drop_down_sharp,
//                               size: 40,
//                             ),
//                             onPressed: () {
//                               _showOtherSelection(context);
//                             },
//                           ),
//                           border: const OutlineInputBorder(),
//                           hintText: 'Select Diagnosis',
//                           fillColor: Colors.white,
//                           filled: true,
//                         ),
//                         onTap: () {
//                           _showOtherSelection(context);
//                         },
//                       )),
//                     ),
//                   ),
//                 ],
//               // ),