// ignore_for_file: sized_box_for_whitespace, file_names, unused_local_variable

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class IpdOperations extends StatefulWidget {
  const IpdOperations({Key? key}) : super(key: key);

  @override
  State<IpdOperations> createState() => _IpdOperationsState();
}

class _IpdOperationsState extends State<IpdOperations> {
  List<Widget> surguryrows = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:Column(
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
                            height: 40,
                            child: Center(
                              child: InkWell(
                                  child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                readOnly:
                                    true, // Set this to true to disable the keyboard
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Select options',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
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
                            height: 40,
                            child: Center(
                              child: TextFormField(
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
                            // height: 40,
                            child: Center(
                              child: CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // Add a new row when the "Add" button is clicked
                                      surguryrows.add(dragBuildRow());
                                    });
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
                  
                  height: surguryrows.isNotEmpty ? null : 0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: surguryrows.length,
                    itemBuilder: (context, index) {
                      return surguryrows[index];
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

  Widget dragBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 3.5,
            height: 40,
            child: Center(
              child: InkWell(
                  child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                readOnly: true, // Set this to true to disable the keyboard
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select options',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  fillColor: Colors.white,
                  filled: true,
                ),
              )),
            ),
          ),
         
          Container(
            width: width / 2,
            height: 40,
            child: Center(
              child: TextFormField(
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
         
          Container(
            width: width / 9,
            // height: 40,
            child: Center(
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        // Remove the row when the "Cancel" button is clicked
                        surguryrows.removeLast();
                      });
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: whitecolor,
                    )),
                radius: 20,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
