// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith();
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey[300],
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      brightness: Brightness.dark,
      cardColor: Colors.grey,
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          )),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.grey),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.white));
}
