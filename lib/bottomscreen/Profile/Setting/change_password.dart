// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/screens/auth/Sigin_main_screen.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  // const Change_Password({super.key});

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  String _errorMessage = '';
////////////////////////////////////////////////////////////////////////////////////////////
// get Shared prefernce data

  late String patientId = '';
  LoadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    patientId = sp.getString('patientidrecord') ?? '';
    print(patientId);
    setState(() {});
  }

////////////////////////////////////////////////////////////////////////////////////////////
  ///
  getData() async {
    await LoadData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
////////////////////////////////////////////////////////////////////////////////////////////

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isloading = false;

  Future<void> changePassword() async {
    final String currentPassword = currentPasswordController.text;
    final String newPassword = newPasswordController.text;
    final String confirmNewPassword = confirmNewPasswordController.text;

    if (newPassword != confirmNewPassword) {
      setState(() {
        _errorMessage = 'New Passwords do not match.';
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(ApiLinks.update_password),
        body: json.encode({
          "password": newPassword,
          "patient_id": patientId,
          "confirm_password": confirmNewPassword,
          "old_password": currentPassword
        }),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        },
      );

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);

        if (responseJson['status'] == '4') {
          // Handle wrong password scenario
          setState(() {
            _errorMessage = responseJson['message'];
          });
        } else if (responseJson['status'] == '1') {
          // Handle successful password change scenario

          Fluttertoast.showToast(
            msg: 'Password changed Successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );

          Get.off(() => const Bottomhome());
        }
      } else {
        // Handle API response error
        final errorResponse = json.decode(response.body);
        setState(() {
          _errorMessage = errorResponse['message'];
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Change password failed. Please try again.'),
          backgroundColor: Colors.red,
        ));
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      // Handle network or other errors
      setState(() {
        _errorMessage = 'An error occurred. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: Lottie.asset('assets/log_load.json'),
          )
        : AlertDialog(
            title: const Text('Change Password'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Current password';
                        } else {
                          return null;
                        }
                      },
                      controller: currentPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'Current Password'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter New password';
                        } else {
                          return null;
                        }
                      },
                      controller: newPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'New Password'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter confirm password';
                        } else {
                          return null;
                        }
                      },
                      controller: confirmNewPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'Confirm New Password'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: darkYellow)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                yellow, // Change the background color
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              changePassword();
                            }
                          },
                          child: const Text('Change Password'),
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
