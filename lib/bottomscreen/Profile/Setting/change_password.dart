// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

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
            isloading = false;
          });
        } else if (responseJson['status'] == '1') {
          // Handle successful password change scenario
          setState(() {
            isloading = false;
          });
          Get.off(() => const Bottomhome());

          Fluttertoast.showToast(
            msg: 'Password changed Successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Change Password'),
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
                      child: const LoadingIndicatorWidget())),
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
                                'Current Password',
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
                                    return 'Enter Current password';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: currentPasswordController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Old password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'New Password',
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
                                    return 'Enter New password';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: newPasswordController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter new password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Confirm New Password',
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
                                    return 'Enter confirm password';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: confirmNewPasswordController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter confirm password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: MyButton(
                                  title: const Text('Change Password'),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      changePassword();
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
