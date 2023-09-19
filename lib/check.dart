import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Image Example'),
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
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
