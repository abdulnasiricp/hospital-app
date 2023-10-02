import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Input date string
    String inputDateString = '2023-10-01 12:49:25';

    // Parse the input date string into a DateTime object
    DateTime inputDate = DateTime.parse(inputDateString);

    // Format the DateTime object to display only the month and day
    String formattedDate = '${inputDate.month}-${inputDate.day}';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Conversion'),
        ),
        body: Center(
          child: Text(
            'Formatted Date: $formattedDate',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
