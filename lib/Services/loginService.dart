// ignore_for_file: file_names
// // ignore_for_file: file_names, avoid_print

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import 'dart:convert';

// import 'package:TezHealthCare/bottombar/bottombar.dart';

// class PatientLoginService {
//   static loginFun(TextEditingController emailController,
//       TextEditingController passwordController) async {
//     try {
//       var headers = {
//         'Soft-service': 'TezHealthCare',
//         'Auth-key': 'zbuks_ram859553467'
//       };
//       var body = {
//         'username': emailController.text.trim(),
//         'password': passwordController.text.trim(),
//       };
//       http.Response response = await http.post(
//           Uri.parse('https://uat.tez.hospital/xzy/auth/login'),
//           headers: headers,
//           body: jsonEncode(body));
//       if (response.statusCode == 200) {
//         Map json = jsonDecode(response.body.toString());
//         print(json['token']);
//         if (json['token'] != '') {
//           Get.off(() => const Bottomhome());
//         } else {
//           print("Invalid Details");
//         }
//       }
//     } catch (e) {
//       print('Error $e');
//     }
//   }
// }
