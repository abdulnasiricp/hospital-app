import 'dart:convert';
import 'dart:io';

import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/screens/auth/authwidget/ForgotPasswordtoast.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:TezHealthCare/widgets/Toast_dialog.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  String _errorMessage = '';
  late bool isloading;

  // Controllers for text fields
  final PatientIdController = TextEditingController();
  final PhonenumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isloading = false;
    ForgotPassword();
  }

  Future<void> ForgotPassword() async {
    final String PatientId = PatientIdController.text;
    final String Phonenumber = PhonenumberController.text;

    setState(() {
      isloading = true; // Set loading to true before making the API request
    });

    try {
      final response = await http.post(
        Uri.parse(ApiLinks.forget_password),
        body: json.encode({
          "patient_id": PatientId,
          "mobile_no": Phonenumber,
        }),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
      );

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        if (responseJson['status'] == '1') {
          Get.dialog(Forgotpasswordtoast(
            title: 'Password Send successfully',
            message:
                'Your new password has been sent to your registered phone number and email. Please check for login within the app',
            btnnName: 'Ok',
          ));
        } else {
          setState(() {
            final message = responseJson['message'];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
      }
    } catch (e) {
      // Handle network or other errors
      setState(() {
        if (e is SocketException) {
          // Network error
          _errorMessage =
              'Network error. Please check your internet connection.';
        } else {
          // Other errors
          _errorMessage = 'Something went wrong. Please try again.';
        }
      });
    } finally {
      setState(() {
        isloading =
            false; // Set loading to false when the API request is completed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: darkblue,
        foregroundColor: Utils.appbarForgroundColor,
      ),
      body: isloading
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: const LoadingIndicatorWidget(),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
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
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Patient ID ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required'; // Display a message when the field is empty
                                  } else {
                                    return null; // No error when the field has a value
                                  }
                                },
                                controller: PatientIdController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Enter Patient ID',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Phone Number ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required'; // Display a message when the field is empty
                                  } else {
                                    return null; // No error when the field has a value
                                  }
                                },
                                controller: PhonenumberController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Enter Phone Number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: MyButton(
                                  title: const Text('Forgot Password'),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // Only perform the ForgotPassword action if both fields are filled
                                      ForgotPassword();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
