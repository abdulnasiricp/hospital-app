// // ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, file_names, avoid_print

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/bill_model.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/view_bill.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionBill extends StatefulWidget {
  const TransactionBill({Key? key}) : super(key: key);

  @override
  _TransactionBillState createState() => _TransactionBillState();
}

class _TransactionBillState extends State<TransactionBill> {
  String username = '';
  late String patient = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    username = sp.getString('usernamerecord') ?? '';
    patient = sp.getString('patientidrecord') ?? '';
    print(patient);
    setState(() {});
  }

  List<BillItem> billItems = [];

  getAllData() async {
    await LoadData();

    await fetchData();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllPayment'),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
        // Adjust content type if needed
      },
      body: jsonEncode({
        "patient_id": patient,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['pathology_bill'] != null) {
        for (var item in data['pathology_bill']) {
          billItems.add(PathologyBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      if (data['radiology_bill'] != null) {
        for (var item in data['radiology_bill']) {
          billItems.add(RadiologyBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      if (data['pharmacy_bill'] != null) {
        for (var item in data['pharmacy_bill']) {
          billItems.add(PharmacyBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      if (data['direct_bill'] != null) {
        for (var item in data['direct_bill']) {
          billItems.add(DirectBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      if (data['ambulance_bill'] != null) {
        for (var item in data['ambulance_bill']) {
          billItems.add(AmbulanceBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      if (data['bloodbank'] != null) {
        for (var item in data['bloodbank']) {
          billItems.add(BloodbankBillItem(
            id: item['id'],
            total: double.tryParse(item['total'].toString()) ?? 0.0,
            patientId: item['patient_id'],
            name: 'name',
          ));
        }
      }
      // Add similar code for other bill types if needed

      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  String getListName(BillItem item) {
    if (item is PathologyBillItem) {
      return 'pathology';
    } else if (item is RadiologyBillItem) {
      return 'radiology';
    } else if (item is PharmacyBillItem) {
      return 'pharmacy';
    } else if (item is DirectBillItem) {
      return 'direct';
    } else if (item is AmbulanceBillItem) {
      return 'ambulance';
    } else if (item is BloodbankBillItem) {
      return 'bloodbank';
    } else {
      return 'Unknown'; // Handle other types if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcation Bill'),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Column(children: [
        Card(
          child: Container(
            width: width,
            height: height / 15,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Section',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Bill No.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: billItems.length,
              itemBuilder: (context, index) {
                final item = billItems[index];
                final listName = getListName(item);
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ViewBillDetiles(
                        billNo: item.id.toString(),
                        billname: listName,
                      ),
                    );
                    print(listName);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: height / 15,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  {index + 1}.toString(),
                                  style: const TextStyle(),
                                ),
                                Text(
                                  listName,
                                  style: const TextStyle(),
                                ),
                                Text(
                                  item.id.toString(),
                                  style: const TextStyle(),
                                ),
                                Text(
                                  'Rs.${item.total}',
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ]),
      bottomSheet: Card(
        child: Container(
          height: height / 15,
          width: width,
          color: darkYellow,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Rs. 2000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
