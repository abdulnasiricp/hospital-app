import 'dart:convert';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:http/http.dart' as http;

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/forgotpassword.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  String id = '';

  final formKey = GlobalKey<FormState>();

  var isloading = false;

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // Perform API call to authenticate the user
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/auth/doctor_login'),
      body: json.encode({'username': username, 'password': password}),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467'
      },
    );

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body.toString());

      // Successful login, store user credentials
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('username', username);
      sharedPreferences.setString('password', password);
      sharedPreferences.setString('emailrecord', json['record']['email']);
      sharedPreferences.setString('genderrecord', json['record']['gender']);
      sharedPreferences.setString(
          'doctorIdrecord', json['record']['employee_id']);
      sharedPreferences.setString('usernamerecord', json['record']['username']);
      sharedPreferences.setString('mobile', json['record']['mobile']);

      // Navigate to the home screen or any other screen you need
      Get.off(() => const Bottomhome());
      setState(() {
        Fluttertoast.showToast(msg: 'Login Successfully');
      });
    } else {
      // Handle login failure
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please try again.'),
      ));
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading? Center(child: Lottie.asset('assets/loading.json'),): SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 146, 99, 227)
              .withOpacity(0.2), 
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: height / 5,
              child: Lottie.asset('assets/login_animation.json'),
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '  Username',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Username';
                      }
                      //  else if (!value.contains('@')) {
                      //   return 'please enter valid email';
                      // }
                      else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: usernameController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor: yellow,
                        hintText: 'Enter Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '  Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your password';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    controller: passwordController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Password',
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: yellow,
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => Forgotpassword());
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: MyButton(
                      title:
                          //  isloading
                          //     ? const CircularProgressIndicator(color: Colors.white,)
                          // :
                          const Text('Sign In'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Loginvalues.patientLogin(
                          //   Loginvalues.emailController,
                          //   Loginvalues.passwordController
                          // );
                          _login();
                          setState(() {
                            isloading = true;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 10,
            )
          ],
        ),
      ),
    );
  }
}