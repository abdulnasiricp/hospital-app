// ignore_for_file: file_names

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget title;
  final VoidCallback onPressed;

  const MyButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  // const MyButton( {super.key, required this.title, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(darkYellow),
      ),
      child: title,
    );
  }
}
