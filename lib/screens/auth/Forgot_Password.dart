// ignore_for_file: sized_box_for_whitespace, body_might_complete_normally_nullable, non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:http/http.dart' as http;

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController DobController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isloading = false;

  void resetPassword(String email) async {
    const apiUrl = 'https://uat.tez.hospital/xzy/webservice/forgotpassword';
    final body = {
      'username': email
    }; // You can change 'email' to 'username' based on your API requirements.

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467'
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      // Password reset request successful
      // You can handle the success response here
    } else {
      // Password reset request failed
      // You can handle the error response here
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Forgot Password'),
          centerTitle: true,
          backgroundColor: darkblue,
          foregroundColor: Utils.appbarForgroundColor,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                    color: darkblue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Utils.containerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '  Username',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter UserName';
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
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.amber,
                                ),
                                hintText: 'Enter Yor Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              } else if (!value.contains(
                                '@',
                              )) {
                                return 'please enter valid email';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: EmailController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: Colors.amber,
                                ),
                                hintText: 'Enter Your Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                         const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Date Of Birth',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Dob';
                              }
                              // else if (!value.contains(
                              //   '',
                              // )) {
                              //   return 'please enter valid email';
                              // } else {
                              //   return null;
                              // }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: DobController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.amber,
                                ),
                                hintText: 'Example:- 2057-01-02 / 2000-04-14',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: double.infinity,
                              height: 50,
                              child: MyButton(
                                title: isloading
                                    ? const CircularProgressIndicator()
                                    : const Text('Forgot'),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    resetPassword;
                                    setState(() {
                                      isloading = true;
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
