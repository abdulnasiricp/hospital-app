// // ignore_for_file: avoid_print, file_names

// import 'package:TezHealthCare/Services/loginService.dart';
// import 'package:flutter/material.dart';

// class LoginController extends ChangeNotifier {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   var isloading = false;
//   GlobalKey<FormState> loginFormKey=GlobalKey();

//   Future patientLogin(
//     TextEditingController emailController,
//     TextEditingController passwordController,
//   )async {
//     if (emailController.text==''&& passwordController.text=='') {
//       print('Please enter your detials');
//       notifyListeners();
      
//     }else{
//       PatientLoginService.loginFun(emailController,passwordController);
//     }
    
//   }
// }
