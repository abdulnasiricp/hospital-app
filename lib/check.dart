import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController combinedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Combine TextFields'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller1,
                decoration: InputDecoration(labelText: 'Text Field 1'),
              ),
              TextField(
                controller: controller2,
                decoration: InputDecoration(labelText: 'Text Field 2'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  combineText();
                },
                child: Text('Combine Text'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: combinedController,
                decoration: InputDecoration(labelText: 'Combined Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void combineText() {
    final text1 = controller1.text;
    final text2 = controller2.text;
    final combinedText = '$text1 $text2'; // Combine the text from both controllers
    combinedController.text = combinedText; // Update the third controller's text
  }
}
