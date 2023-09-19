import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image Example'),
      ),
      body: Center(
        child: Image.network(
          'https://example.com/image.jpg', // Replace with your image URL
          width: 200.0, // Set the width (optional)
          height: 200.0, // Set the height (optional)
          fit: BoxFit.cover, // Set the BoxFit (optional)
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
