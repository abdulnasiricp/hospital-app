import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.red, // Set your desired title text color here
            fontSize: 20, // You can set other title text styles as well
          ),
          iconTheme: IconThemeData(
            color: Colors.green, // Set your desired back icon color here
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Examination"),
          centerTitle: true,
          // backgroundColor: darkYellow, // You can set the background color here if needed
        ),
        body: YourBodyWidget(),
      ),
    );
  }
}

class YourBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your App Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
