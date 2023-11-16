// ignore_for_file: sized_box_for_whitespace, file_names, dead_code, unused_local_variable

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class IPDCardex extends StatefulWidget {
  const IPDCardex({Key? key}) : super(key: key);

  @override
  State<IPDCardex> createState() => _IPDCardexState();
}

class _IPDCardexState extends State<IPDCardex> {
  List<Widget> dragrows = [];
  List<Widget> drainagegrows = [];
  List<Widget> obesvationrows = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.pink[50],
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Drug/Medicine',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Colors.green[300],
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Medicine',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),
                              Text(
                                'Dosage',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),

                              Text(
                                'Date & time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                ' ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: width / 4.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: width / 4.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          Container(
                            width: width / 6,
                            height: 40,
                            child: Center(
                              child: CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // Add a new row when the "Add" button is clicked
                                        dragrows.add(dragBuildRow());
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: whitecolor,
                                    )),
                                radius: 20,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(

                        height: dragrows.isNotEmpty ? null : 0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: dragrows.length,
                          itemBuilder: (context, index) {
                            return dragrows[index];
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Save'),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(darkYellow),
                              ),
                            )),
                      ),
                      const Center(
                        child: Text(
                          'Report',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Colors.green[300],
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Medicine',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),
                              Text(
                                'Dosage',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),

                              Text(
                                'Date & time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.yellow[100],
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Observation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Colors.green[300],
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date & time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),
                              Text(
                                'BP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),

                              Text(
                                'P',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'R',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'Tem',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                '   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width / 4.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width / 7.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width / 7.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width / 7.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width / 7.5,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              )),
                            ),
                          ),
                          Container(
                            width: width / 7,
                            height: 40,
                            child: Center(
                              child: CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // Add a new row when the "Add" button is clicked
                                        obesvationrows
                                            .add(observationBuildRow());
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: whitecolor,
                                    )),
                                radius: 20,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(

                        height: obesvationrows.isNotEmpty ? null : 0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: obesvationrows.length,
                          itemBuilder: (context, index) {
                            return obesvationrows[index];
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Save'),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(darkYellow),
                              ),
                            )),
                      ),
                      const Center(
                        child: Text(
                          'Report',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        color: Colors.green[300],
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date & time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),
                              Text(
                                'BP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              // SizedBox(width: 10,),

                              Text(
                                'P',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'R',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'Tem',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.yellow[100],
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  'Drainage',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.green[300],
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      // SizedBox(width: 10,),
                                      Text(
                                        'Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      // SizedBox(width: 10,),

                                      Text(
                                        'Date & time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        ' ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: width / 4.5,
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
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: width / 4.5,
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
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      )),
                                    ),
                                  ),
                                  Container(
                                    width: width / 6,
                                    height: 40,
                                    child: Center(
                                      child: CircleAvatar(
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                // Add a new row when the "Add" button is clicked
                                                drainagegrows
                                                    .add(drainageBuildRow());
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: whitecolor,
                                            )),
                                        radius: 20,
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Container(

                                height: drainagegrows.isNotEmpty ? null : 0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),

                                  itemCount: drainagegrows.length,
                                  itemBuilder: (context, index) {
                                    return drainagegrows[index];
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Save'),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                darkYellow),
                                      ),
                                    )),
                              ),
                              const Center(
                                child: Text(
                                  'Report',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.green[300],
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      // SizedBox(width: 10,),
                                      Text(
                                        'Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      // SizedBox(width: 10,),

                                      Text(
                                        'Date & time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.yellow[100],
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  'Diet',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.green[300],
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Diet',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      // SizedBox(width: 10,),
                                      SizedBox(
                                        width: 10,
                                      ),

                                      Text(
                                        'Date & time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width / 2.3,
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
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: width / 2.3,
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
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Save'),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                darkYellow),
                                      ),
                                    )),
                              ),
                              const Center(
                                child: Text(
                                  'Report',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.green[300],
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Diet',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Date & time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dragBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width / 3.5,
          height: 40,
          child: Center(
            child: InkWell(
                child: TextFormField(
              controller: textFieldController,
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
            )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: width / 4.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: width / 4.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        Container(
          width: width / 6,
          height: 40,
          child: Center(
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      // Remove the row when the "Cancel" button is clicked
                      dragrows.removeLast();
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
    );
  }

  Widget drainageBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width / 3.5,
          height: 40,
          child: Center(
            child: InkWell(
                child: TextFormField(
              controller: textFieldController,
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
            )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: width / 4.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: width / 4.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        Container(
          width: width / 6,
          height: 40,
          child: Center(
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      // Remove the row when the "Cancel" button is clicked
                      drainagegrows.removeLast();
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
    );
  }

  Widget observationBuildRow() {
    TextEditingController textFieldController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width / 4.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 7.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 7.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 7.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: width / 7.5,
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                fillColor: Colors.white,
                filled: true,
              ),
            )),
          ),
        ),
        Container(
          width: width / 7,
          height: 40,
          child: Center(
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      // Remove the row when the "Cancel" button is clicked
                      obesvationrows.removeLast();
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
    );
  }
}