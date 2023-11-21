// // ignore_for_file: sized_box_for_whitespace, file_names, unused_local_variable

// import 'package:TezHealthCare/utils/colors.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:flutter/material.dart';

// class IpdOperations extends StatefulWidget {
//   const IpdOperations({Key? key}) : super(key: key);

//   @override
//   State<IpdOperations> createState() => _IpdOperationsState();
// }

// class _IpdOperationsState extends State<IpdOperations> {
//   TextEditingController surgeryController = TextEditingController();
//    TextEditingController noteController = TextEditingController();
//   List<Widget> surguryrows = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child:Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Surgery advised',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 15),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: width / 3.5,
//                             height: 40,
//                             child: Center(
//                               child: InkWell(
//                                   child: TextFormField(
//                                     controller: surgeryController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'This field is required';
//                                   }
//                                   return null;
//                                 },
//                                 readOnly:
//                                     true, // Set this to true to disable the keyboard
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   hintText: 'Select options',
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 10),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                 ),
//                               )),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Note for surgery',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 15),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: width / 2,
//                             height: 40,
//                             child: Center(
//                               child: TextFormField(
//                                 controller: noteController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'This field is required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 10),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             ' ',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                           Container(
//                             width: width / 9,
//                             // height: 40,
//                             child: Center(
//                               child: CircleAvatar(
//                                 child: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       // Add a new row when the "Add" button is clicked
//                                       surguryrows.add(dragBuildRow());
//                                     });
//                                   },
//                                   icon: Icon(
//                                     Icons.add,
//                                     color: whitecolor,
//                                   ),

//                                 ),
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Container(

//                   height: surguryrows.isNotEmpty ? null : 0,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),

//                     itemCount: surguryrows.length,
//                     itemBuilder: (context, index) {
//                       return surguryrows[index];
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Container(
//                     width: double.infinity,
//                     height: 40,
//                     child: ElevatedButton(
//                       child: const Text('Save'),
//                       onPressed: () {},
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(yellow),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: double.infinity,
//                     color: Colors.green,
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Surgery Id',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Is Billed',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Bill No',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Action',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Note for surgery',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ),

//     );
//   }

//   Widget dragBuildRow() {
//     TextEditingController textFieldController = TextEditingController();

//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: width / 3.5,
//             height: 40,
//             child: Center(
//               child: InkWell(
//                   child: TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'This field is required';
//                   }
//                   return null;
//                 },
//                 readOnly: true, // Set this to true to disable the keyboard
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Select options',
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               )),
//             ),
//           ),

//           Container(
//             width: width / 2,
//             height: 40,
//             child: Center(
//               child: TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'This field is required';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//             ),
//           ),

//           Container(
//             width: width / 9,
//             // height: 40,
//             child: Center(
//               child: CircleAvatar(
//                 child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         // Remove the row when the "Cancel" button is clicked
//                         surguryrows.removeLast();
//                       });
//                     },
//                     icon: Icon(
//                       Icons.cancel,
//                       color: whitecolor,
//                     )),
//                 radius: 20,
//                 backgroundColor: Colors.green,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: sized_box_for_whitespace, file_names, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class IpdOperations extends StatefulWidget {
  const IpdOperations({Key? key}) : super(key: key);

  @override
  State<IpdOperations> createState() => _IpdOperationsState();
}

class _IpdOperationsState extends State<IpdOperations> {
  bool isSurgeryDataFetched = false; // Add this flag

  List<dynamic>? surgerydata = [];
  List<dynamic>? surgeryfilteredData = [];
  bool isLoading = true;

  Future<void> fetchsurgeryData() async {
    if (isSurgeryDataFetched) {
      return; // If data has already been fetched, return without fetching again
    }
    Uri.parse(ApiLinks.singleTableDataDetector);

    final body = {"table": "radio"};

    final response = await http.post(
      Uri.parse(ApiLinks.singleTableDataDetector),
      headers: ApiLinks.MainHeader,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      setState(() {
        surgerydata = dataMap['result'];
        surgeryfilteredData = surgerydata;
        isLoading = false;

        isSurgeryDataFetched = true; // Set the flag to true after fetching data
      });
    } else {
      handleNonJsonResponse();
    }
  }

  void handleNonJsonResponse() {
    print('Non-JSON response or API error');
    setState(() {
      isLoading = false;
    });
  }

  ////////////////////

 
 void surgeryfilterData(String query) {
    setState(() {
      surgeryfilteredData = surgerydata
          ?.where((element) =>
              element['test_name']
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element['id'].toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  TextEditingController surgeryController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<Widget> surgeryRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Surgery advised',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width / 3.5,
                          height: 50,
                          child: Center(
                            child: InkWell(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                controller: surgeryController,
                                maxLines: null, // Allow multiple lines
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      _showSurgerySelection(context);
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Select Other test',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                onTap: () {
                                  _showSurgerySelection(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Note for surgery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width / 2,
                          height: 50,
                          child: Center(
                            child: TextFormField(
                              controller: noteController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Container(
                          width: width / 9,
                          child: Center(
                            child: CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  addNewRow();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: whitecolor,
                                ),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: surgeryRows.isNotEmpty ? null : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surgeryRows.length,
                  itemBuilder: (context, index) {
                    return surgeryRows[index];
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(yellow),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surgery Id',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Is Billed',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill No',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Action',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Note for surgery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dragBuildRow(TextEditingController surgeryController,
      TextEditingController noteController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 3.5,
                height: 50,
                child: Center(
                  child: InkWell(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      readOnly: true,
                      controller: surgeryController,
                      maxLines: null, // Allow multiple lines
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                          ),
                          onPressed: () {
                            _showSurgerySelection(context);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Select Other test',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        _showSurgerySelection(context);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 2,
                height: 50,
                child: Center(
                  child: TextFormField(
                    controller: noteController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: width / 9,
            child: Center(
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      surgeryRows.removeLast();
                    });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: whitecolor,
                  ),
                ),
                radius: 20,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNewRow() {
    TextEditingController newSurgeryController = TextEditingController();
    TextEditingController newNoteController = TextEditingController();

    setState(() {
      surgeryRows.add(dragBuildRow(newSurgeryController, newNoteController));
    });
  }

  TextEditingController surgerysearchController = TextEditingController();
  String selectedsurgerydata = '';
  String selectedsurgeryId = '';

  void _showSurgerySelection(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items at the ends
                    children: <Widget>[
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close), // Close icon
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      width: width / 0.8,
                      height: 50,
                      child: TextFormField(
                        controller: surgerysearchController,
                        onChanged: (query) {
                          setState(() {
                            surgeryfilterData(query);
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Search here...',
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: fetchsurgeryData(),
                    builder: (context, snapshot) {
                      return isLoading
                          ? Expanded(
                              child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.transparent,
                                child: const LoadingIndicatorWidget(),
                              ),
                            ))
                          : surgeryfilteredData!.isEmpty
                              ? Expanded(
                                  child: Center(
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: Lottie.asset(
                                      'assets/No_Data_Found.json',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ))
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: surgeryfilteredData?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int itemNumber = index + 1;
                                      return Card(
                                        color: Colors.white70.withOpacity(0.7),
                                        child: ListTile(
                                          title: Text(
                                            '$itemNumber. ${surgeryfilteredData?[index]['test_name'] ?? ''}',
                                          ),
                                          onTap: () {
                                            selectedsurgerydata =
                                                surgeryfilteredData?[index]
                                                        ['test_name'] ??
                                                    '';
                                            selectedsurgeryId =
                                                surgeryfilteredData?[index]
                                                        ['id'] ??
                                                    '';
                                            surgeryController.text =
                                                '($selectedsurgeryId) $selectedsurgerydata';

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
