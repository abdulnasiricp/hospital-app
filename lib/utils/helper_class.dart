// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static Color? appbarColor = Colors.blue[700];
  static Color? appbarForgroundColor = Colors.white;
  static Color? buttonColor = Colors.blue[700];
  static Color? bgColor = Colors.blue[700];
  static Color? containerColor = Colors.white;
  static Color? scaffoldBackgroundColor = Colors.grey[100];
  static Color? bottomsheetColor = Colors.grey[100];


  static TextStyle? headingtextStyle = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle? normaltextStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black);

      void toastmassage(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        backgroundColor: Colors.green[400],
        fontSize: 16,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR);
  }
}
