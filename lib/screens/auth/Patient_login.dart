// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:convert';
import 'dart:io';
import 'package:TezHealthCare/DoctorPannel/Bottombar/Doctor_Home_Bottom_bar.dart';
import 'package:TezHealthCare/screens/auth/Forgot_Password.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);
  @override
  State<PatientLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {

  
  late String HospitalLogo = '';
  bool isLoading = true;

  Future<void> getAboutUsDetails() async {
    try {
      // Make the POST request
      final response = await http.post(
        Uri.parse(ApiLinks.aboutUs),
        headers: ApiLinks.MainHeader,
      );

      // Check if the response was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);
        HospitalLogo = data['0']['app_logo'];
        // Set the state to rebuild the widget
        print('--------------$HospitalLogo');
        setState(() {
          isLoading = false;
        });
      } else {
        // Handle the error
        isLoading = false;
      }
    } catch (error) {
      isLoading = false;

      print(error);
    }
  }

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

  Future<void> initPlatformState() async {
    if (!mounted) return;
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("01f97e4b-6814-42f6-942e-55112650f054");
    OneSignal.Notifications.requestPermission(true);
    WidgetsFlutterBinding.ensureInitialized();
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Future<void> _login() async {
    final String username = usernameController.text;
    final String password = _passwordController.text;

    // Perform API call to authenticate the user

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceID;

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceID = androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceID = iosInfo.identifierForVendor!;
      } else {
        deviceID = "Unknown";
      }
    } catch (e) {
      deviceID = "Unknown";
    }
    print(
        "Device id : +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$deviceID");
    final response = await http.post(
      Uri.parse(ApiLinks.Loginapiforboth),
      body: json.encode({
        'username': username,
        'password': password,
        'deviceToken': deviceID,
      }),
      headers: ApiLinks.MainHeader,
    );
    if (response.statusCode == 200) {
      initPlatformState();
      Map json = jsonDecode(response.body.toString());
      var externalId = json['record']
          ['app_key']; // You will supply the external id to the OneSignal SDK
      OneSignal.login(externalId);
      if (json['role'] is List && json['role'].contains('patient')) {
        final sp = await SharedPreferences.getInstance();
        sp.setString('username', username);
        sp.setString('password', password);
        sp.setString('role', 'patient');
        sp.setString('NotificationToken', externalId);
        sp.setString('imagerecord', json['record']['image']);
        sp.setString('genderrecord', json['record']['gender']);
        sp
            .setString('patientidrecord', json['record']['patient_id'])
            .toString();
        sp.setString('usernamerecord', json['record']['username']);
        sp.setString('mobilerecord', json['record']['mobile']).toString();
        sp.setString('caseId', json['record']['case_id']).toString();
        Get.off(() => const Bottomhome());
        setState(() {
          Fluttertoast.showToast(
            msg: 'Login Successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        });
      } else if (json['role'] is Map && json['role'].containsKey('Doctor')) {
        final sp = await SharedPreferences.getInstance();
        sp.setString('username', username);
        sp.setString('password', password);
        sp.setString('NotificationToken', externalId);
        sp.setString('role', json['record']['role']['Doctor']);
        sp.setString('employee_id', json['record']['employee_id']);
        sp.setString('id', json['record']['id']);
        sp.setString('username', json['record']['username']);
        sp.setString('mobile', json['record']['mobile']);
        sp.setString('email', json['record']['email']);
        sp.setString('gender', json['record']['gender']);
        sp.setString('local_address', json['record']['local_address']);
        sp.setString('permanent_address', json['record']['permanent_address']);
        sp.setString('date_format', json['record']['date_format']);
        sp.setString('time_format', json['record']['time_format']);
        sp.setString('dob', json['record']['dob']);
        sp.setString('currency_symbol', json['record']['currency_symbol']);
        sp.setString('timezone', json['record']['timezone']);
        sp.setString('image', json['record']['image']);
        sp.setString('token', json['record']['token']);
        Get.offAll(() => const Doctor_Home_Bottom_bar());
        setState(() {
          Fluttertoast.showToast(
            msg: 'Login Successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isloading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
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

  getdata() async {}
  @override
  void initState() {
    getAboutUsDetails();

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
                    child:HospitalLogo.isEmpty
                
                ? Container():
                  Image.network(
                      '$HospitalLogo',
                      fit: BoxFit.fill,
                     
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: EnString.username,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                        Container(
                          width: width,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return EnString.enterusername;
                              } else {
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: EnString.password,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                        Container(
                          width: width,
                          child: TextFormField(
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
                            TextButton(
                              onPressed: () {
                                Get.to(() => const Forgotpassword());
                              },
                              child: const Text(
                                EnString.forgotpassword,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(yellow),
                            ),
                            child: const Text(EnString.login),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _login();
                                _saveLoginDateTime();
                                _loadLoginDateTime();
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
