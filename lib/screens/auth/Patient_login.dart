// ignore_for_file: unused_local_variable, sized_box_for_whitespace, non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:TezHealthCare/Controller/loginController.dart';
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bottomscreen/home/forgotpassword.dart';
import 'package:http/http.dart' as http;

class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
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
      Uri.parse('https://uat.tez.hospital/xzy/auth/login'),
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
      sharedPreferences.setString('role', json['role']);
      sharedPreferences.setString('imagerecord', json['record']['image']);
      sharedPreferences.setString('genderrecord', json['record']['gender']);
      sharedPreferences.setString(
          'patientidrecord', json['record']['patient_id']);
      sharedPreferences.setString('usernamerecord', json['record']['username']);

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
      isloading=false;
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final loginProvider = Provider.of<LoginController>(context, listen: false);
    return isloading? Center(child: Lottie.asset('assets/loading.json')):SafeArea(
      child: Scaffold(
        backgroundColor: Utils.scaffoldBackgroundColor,
       
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stack(children: [
              //   Container(width:double.infinity,
              //   height: 230,
              //           color: Utils.bgColor,

              //   ),
              //   Center(
              //     child: ClipRRect(
              //         borderRadius: BorderRadius.circular(20),
              //         child: Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Image(
              //               image: AssetImage('assets/newlogo.png'),
              //               height: height / 4),
              //         )),
              //   ),
              // ]),
              Stack(
                children: [
                  Container(
                    height: height/1.6,
                    decoration: BoxDecoration(
                        color: Utils.bgColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Utils.containerColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Consumer<LoginController>(
                            builder: (context, Loginvalues, child) {
                          return Form(
                            // key: Loginvalues.loginFormKey,
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 20, right: 20),
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      //  else if (!value.contains('@')) {
                                      //   return 'please enter valid email';
                                      // }
                                      else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    // controller: Loginvalues.emailController,
                                    controller: usernameController,
                                    onTapOutside: (event) =>
                                        FocusScope.of(context).unfocus(),
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.phone),
                                        prefixIconColor: Colors.blue,
                                        hintText:
                                            'Enter email and phone number',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
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
                                    // controller: Loginvalues.passwordController,
                                    controller: passwordController,
                                    onTapOutside: (event) =>
                                        FocusScope.of(context).unfocus(),
                                    decoration: InputDecoration(
                                        hintText: 'Enter Password',
                                        prefixIcon: const Icon(Icons.lock),
                                        prefixIconColor: Colors.blue,
                                        suffixIcon:
                                            const Icon(Icons.visibility),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  Container(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Get.to(() => Forgotpassword());
                                        },
                                        child: const Text('Forgot Password'),
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
                                        //     : 
                                            const Text('Sign In'),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            // Loginvalues.patientLogin(
                                            //   Loginvalues.emailController,
                                            //   Loginvalues.passwordController
                                            // );
                                            setState(() {
                                              isloading=true;
                                            });
                                            _login();
                                          }
                                        },
                                      )),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
