// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class IpdOperations extends StatefulWidget {
  const IpdOperations({Key? key}) : super(key: key);

  @override
  State<IpdOperations> createState() => _IpdOperationsState();
}

class _IpdOperationsState extends State<IpdOperations> {

  List<Widget> surgeryRows = [];
  TextEditingController surgeryController = TextEditingController();
  TextEditingController surgeryNoteController = TextEditingController();

  
  bool isLoading = false;
  // Future<void> makePostRequest() async {
  //   final String surgery = surgeryController.text;
  //   final String surgeryNote = surgeryNoteController.text;
   

  //   const String apiUrl =
  //       'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

  //   Map<String, dynamic> requestBody = {
  //     "table": "Visit_details",
  //     "fields": {
  //       // "opd_details_id": "${widget.opdID}",
  //       "symptoms": surgery,
  //       "height": surgeryNote,
       
  //     }
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: jsonEncode(requestBody),
  //       headers: ApiLinks.MainHeader,
  //     );

  //     if (response.statusCode == 200) {
  //       // Successful response
  //       print('Response: ${response.body}');
  //       Map<String, dynamic> responseData = jsonDecode(response.body);
  //       print('Status: ${responseData["staus"]}');
  //       print('Message: ${responseData["message"]}');
  //       print('ID: ${responseData["id"]}');
  //       setState(() {
  //         Fluttertoast.showToast(
  //           msg: '${responseData["message"]}',
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //         );
  //       });
  //     } else {
  //       setState(() {
  //         Fluttertoast.showToast(
  //           msg: '${response.reasonPhrase}',
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //         );
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       Fluttertoast.showToast(
  //         msg: '$e',
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //       );
  //     });
  //   }
  // }


Future<void> makePostRequest() async {
  final String mainSurgery = surgeryController.text;
  final String mainSurgeryNote = surgeryNoteController.text;

  // Extract data from dynamically generated rows
  List<dynamic> additionalRowsData = [];

  for (var controllerMap in surgeryControllersList) {
    String rowSurgery = controllerMap['surgery']?.text ?? '';
    String rowNote = controllerMap['note']?.text ?? '';

    // Check if both fields in the row have data
    if (rowSurgery.isNotEmpty && rowNote.isNotEmpty) {
      additionalRowsData.add({
       
         rowSurgery,
        rowNote,
      });
    }
  }

  // Combine the main surgery data with additional rows data
  List< dynamic> requestBodyList = [
    
   mainSurgery,
     mainSurgeryNote,
    
    ...additionalRowsData,
  ];

  const String apiUrl = 'https://uat.tez.hospital/xzy/webservice/submit_opd_process';

  Map<String, dynamic> requestBody = {
    "table": "Visit_details",
    "fields": "$requestBodyList",
  };
    print('----------------$requestBodyList');
    print('----------------$requestBody');

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: requestBody,
      headers: ApiLinks.MainHeader,
    );

    if (response.statusCode == 200) {
      // Successful response
      print('Response: ${response.body}');
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('Status: ${responseData["staus"]}');
      print('Message: ${responseData["message"]}');
      print('ID: ${responseData["id"]}');
      setState(() {
        Fluttertoast.showToast(
          msg: '${responseData["message"]}',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
          msg: '${response.reasonPhrase}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }
  } catch (e) {
    setState(() {
      Fluttertoast.showToast(
        msg: '$e',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    });
  }
}





  List<Map<String, TextEditingController>> surgeryControllersList = [];
  bool isSurgeryDataFetched = false;

  List<dynamic>? surgerydata = [];
  List<dynamic>? surgeryfilteredData = [];

  Future<void> fetchsurgeryData() async {
    if (isSurgeryDataFetched) {
      return;
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

        isSurgeryDataFetched = true;
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
                          height: 55,
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
                                maxLines: null,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      _showSurgerySelection(context,surgeryController,surgeryNoteController);
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Select Surgery',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                onTap: () {
                                  _showSurgerySelection(context,surgeryController,surgeryNoteController);
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
                          height: 60,
                          child: Center(
                            child: TextFormField(
                              controller: surgeryNoteController,
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
                    onPressed: () {
                      makePostRequest();
                    },
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
                height: 55,
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
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                          ),
                          onPressed: () {
                            _showSurgerySelection(context, surgeryController, noteController);
                          },
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Select Other test',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onTap: () {
                        _showSurgerySelection(context, surgeryController, noteController);
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
                height: 55,
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
          const SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ],
      ),
    );
  }


  void addNewRow() {
    TextEditingController newSurgeryController = TextEditingController();
    TextEditingController newNoteController = TextEditingController();

    Map<String, TextEditingController> newControllersMap = {
      'surgery': newSurgeryController,
      'note': newNoteController,
    };

    setState(() {
      surgeryRows.add(dragBuildRow(newSurgeryController, newNoteController));
      surgeryControllersList.add(newControllersMap);
    });
  }

  TextEditingController surgerysearchController = TextEditingController();

  void _showSurgerySelection(BuildContext context, TextEditingController surgeryController, TextEditingController noteController) {
    TextEditingController localSurgeryController = TextEditingController();
    TextEditingController localNoteController = TextEditingController();
    String localSelectedsurgerydata = '';
    String localSelectedsurgeryId = '';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
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
                                            localSelectedsurgerydata =
                                                surgeryfilteredData?[index]
                                                        ['test_name'] ??
                                                    '';
                                            localSelectedsurgeryId =
                                                surgeryfilteredData?[index]
                                                        ['id'] ??
                                                    '';

                                            localSurgeryController.text =
                                                '($localSelectedsurgeryId) $localSelectedsurgerydata';

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
    ).whenComplete(() {
      setState(() {
        surgeryController.text = localSurgeryController.text;
        noteController.text = localNoteController.text;
      });
    });
  }
}
