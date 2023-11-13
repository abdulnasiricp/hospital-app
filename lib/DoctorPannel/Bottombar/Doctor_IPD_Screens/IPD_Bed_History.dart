// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IpdBedHistory extends StatefulWidget {
  const IpdBedHistory({Key? key}) : super(key: key);

  @override
  State<IpdBedHistory> createState() => _IpdBedHistoryState();
}

class _IpdBedHistoryState extends State<IpdBedHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('IPD Bed History'),
      //     centerTitle: true,
      //     backgroundColor: darkYellow),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bed History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green[100],
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bed Group',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Bed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'From Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'To Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Active Bed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
