// ignore_for_file: file_names, sized_box_for_whitespace

import 'dart:convert';
import 'package:TezHealthCare/screens/auth/Forgot_Password.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);

  @override
  State<PatientLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  bool _rememberMeFlag = false;
  String id = '';
  bool _isPasswordVisible = false;
  String loginDateTime = '';
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isloading = false;
  Future<void> _login() async {
    final String username = usernameController.text;
    final String password = _passwordController.text;

    // Perform API call to authenticate the user
    final response = await http.post(
      Uri.parse(ApiLinks.patientLogin),
      body: json.encode({'username': username, 'password': password}),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467'
      },
    );

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body.toString());

      // Successful login, store user credentials
      final sp = await SharedPreferences.getInstance();
      sp.setString('username', username);
      sp.setString('password', password);
      sp.setString('role', json['role']);
      sp.setString('imagerecord', json['record']['image']);
      sp.setString('genderrecord', json['record']['gender']);
      sp.setString('patientidrecord', json['record']['patient_id']).toString();
      sp.setString('usernamerecord', json['record']['username']);
      sp.setString('mobilerecord', json['record']['mobile']).toString();

      // Navigate to the home screen ERTYU D
      Get.off(() => const Bottomhome());
      setState(() {
        Fluttertoast.showToast(
          msg: 'Login Successfully',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      });
    } else {
      // Handle login failure
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please try again.'),
        backgroundColor: Colors.red,
      ));
      setState(() {
        isloading = false;
      });
    }
  }

    _loadLoginDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginDateTime = prefs.getString('loginDateTime') ?? '';
    });
  }

  _saveLoginDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String now = DateTime.now().toString();
    await prefs.setString('loginDateTime', now);
  }

@override
  void initState() {
    _loadLoginDateTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: Lottie.asset('assets/log_load.json'),
          )
        : SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 146, 99, 227).withOpacity(0.2),
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
                    child: Image.asset('assets/logo.png'),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          EnString.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return EnString.enterusername;
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: yellow,
                              hintText: EnString.enterusername,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          EnString.password,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return EnString.pleaseEnterpassword;
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: InputDecoration(
                              focusColor: yellow,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xfffabd0a),
                              ),
                              hintText: 'Enter Password',
                              suffixIconColor: yellow,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: yellow,
                                  focusColor: yellow,
                                  checkColor: darkblue,
                                  value: _rememberMeFlag,
                                  onChanged: (value) => setState(() {
                                    _rememberMeFlag = !_rememberMeFlag;
                                  }),
                                ),
                                const Text(
                                  EnString.rememberMe,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0), // Spacer
                            InkWell(
                                onTap: () {
                                  // Add your Forgot Password functionality here
                                },
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const Forgotpassword());
                                  },
                                  child: const Text(
                                    EnString.forgotpassword,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: MyButton(
                            title: const Text(EnString.login),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                               
                                _login();
                                _saveLoginDateTime();
                _loadLoginDateTime();
                                setState(() {
                                  isloading = true;
                                }
                                );
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
