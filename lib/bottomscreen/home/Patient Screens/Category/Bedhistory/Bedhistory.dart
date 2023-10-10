import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Bedhistory extends StatefulWidget {
  @override
  State<Bedhistory> createState() => _BedhistoryState();
}

class _BedhistoryState extends State<Bedhistory> {
  final List<Map<String, dynamic>> bedHistory = [
    {
      "ward": "GENERAL",
      "bed_name": "14",
      "floor_name": "BLOCK A- GROUND FLOOR",
      "from_date": "2023-10-08 11:44:00",
      "to_date": "",
      "is_active": "yes"
    },
    {
      "ward": "GENERAL",
      "bed_name": "21",
      "floor_name": "BLOCK A- GROUND FLOOR",
      "from_date": "2023-10-09 14:37:00",
      "to_date": "",
      "is_active": "yes"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedhistory'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: ListView.builder(
        itemCount: bedHistory.length,
        itemBuilder: (context, index) {
          final historyItem = bedHistory[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              title: Text('Bed Name: ${historyItem["bed_name"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ward: ${historyItem["ward"]}'),
                  Text('Floor Name: ${historyItem["floor_name"]}'),
                  Text('From Date: ${historyItem["from_date"]}'),
                  Text('To Date: ${historyItem["to_date"] ?? 'N/A'}'),
                ],
              ),
              trailing: Text(
                'Status: ${historyItem["is_active"]}',
                style: TextStyle(
                  color: historyItem["is_active"] == "yes"
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
