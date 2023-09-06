// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:TezHealthCare/bottomscreen/home/forgotpassword.dart';
// import 'package:TezHealthCare/custtom/appbar.dart';
// import 'package:TezHealthCare/custtom/custtombutton.dart';
// import 'package:TezHealthCare/custtom/textfild.dart';
// import 'package:TezHealthCare/screens/auth/authwidget/authwidget.dart';
// import 'package:TezHealthCare/screens/auth/signup.dart';
// import 'package:TezHealthCare/stringfile/enstring.dart';
// import 'package:TezHealthCare/utils/notifirecolors.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../bottombar/bottombar.dart';
// import '../../custtom/passwordtextfild.dart';
// import '../../utils/mediaqury.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   late ColorNotifier notifier;
//   bool isChecked = false;
//   getdarkmodepreviousstate() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? previusstate = prefs.getBool("setIsDark");
//     if (previusstate == null) {
//       notifier.setIsDark = false;
//     } else {
//       notifier.setIsDark = previusstate;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getdarkmodepreviousstate();
//   }

//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return ScreenUtilInit(
//       builder: (_ , child)  => Scaffold(
//         backgroundColor: notifier.getwihitecolor,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: height / 2.8,
//                     decoration: BoxDecoration(
//                       color: notifier.getperple,
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(30.sp),
//                         bottomLeft: Radius.circular(30.sp),
//                       ),
//                     ),
//                     child: CustomAppBar(Colors.transparent, EnString.login,
//                         notifier.getwihitecolor, "assets/ic_back.png",
//                         height: height / 15),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(height: height / 5),
//                       Stack(
//                         children: [
//                           Center(
//                             child: Card(
//                               color: notifier.getwihitecolor,
//                               elevation: 1.sp,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.sp),
//                               ),
//                               child: Container(
//                                 height: height / 2.6,
//                                 width: width / 1.1,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20.sp),
//                                   ),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     SizedBox(height: height / 50),
//                                     // Row(
//                                     //   children: [
//                                     //     SizedBox(width: width / 20),
//                                     //     Text(
//                                     //       EnString.Emailorphonenumber,
//                                     //       style: TextStyle(
//                                     //           color: notifier.getgrey,
//                                     //           fontSize: 15.sp,
//                                     //           fontFamily: 'Gilroy_Medium'),
//                                     //     ),
//                                     //   ],
//                                     // ),
//                                     SizedBox(height: height / 50),
//                                     Customtextfild.textField(
//                                         EnString.enterusername,
//                                         notifier.getperple,
//                                         notifier.getgrey,
//                                         notifier.getblack,
//                                         notifier.getgrey,
//                                         45.h,
//                                         300.w,
//                                         Icons.person,
//                                         notifier.getperple),
//                                     SizedBox(height: height / 50),
//                                     // Row(
//                                     //   children: [
//                                     //     SizedBox(width: width / 20),
//                                     //     Text(
//                                     //       EnString.Emailorphonenumber,
//                                     //       style: TextStyle(
//                                     //           color: notifier.getgrey,
//                                     //           fontSize: 15.sp,
//                                     //           fontFamily: 'Gilroy_Medium'),
//                                     //     ),
//                                     //   ],
//                                     // ),
//                                     SizedBox(height: height / 50),
//                                     Customtextfildpassword.textField(
//                                         EnString.enterpassword,
//                                         notifier.getperple,
//                                         notifier.getgrey,
//                                         notifier.getblack,
//                                         notifier.getgrey,
//                                         Icons.lock,
//                                         notifier.getperple),
//                                     Row(
//                                       children: [
//                                         SizedBox(width: width / 100),
//                                         Transform.scale(
//                                           scale: 1.sp,
//                                           child: Checkbox(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                 Radius.circular(5.sp),
//                                               ),
//                                             ),
//                                             activeColor: notifier.getperple,
//                                             side: BorderSide(
//                                                 color: notifier.getperple),
//                                             value: isChecked,
//                                             onChanged: (bool? value) {
//                                               setState(() {
//                                                 isChecked = value!;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Text(
//                                                   EnString.remeberme,
//                                                   style: TextStyle(
//                                                       fontSize: height / 55,
//                                                       color: notifier.getgrey),
//                                                 ),
//                                                 SizedBox(width: width / 4.8),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     Get.to(
//                                                         const Forgotpassword());
//                                                   },
//                                                   child: Text(
//                                                     EnString.forgotpassword,
//                                                     style: TextStyle(
//                                                         color: const Color(
//                                                             0xff2AD3E7),
//                                                         fontSize: 13.sp),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(height: height / 3),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     left: width / 25, right: width / 27),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Get.to(const Bottomhome());
//                                   },
//                                   child: Button(
//                                       EnString.login,
//                                       notifier.getperple,
//                                       notifier.getwihitecolor,
//                                       0,
//                                       Colors.transparent),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   // Column(
//                   //   children: [
//                   //     SizedBox(height: height / 1.9),
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(left: 20, right: 20),
//                   //       child: button(EnString.login, notifier.getgrey,
//                   //           notifier.getwihitecolor, 0, Colors.transparent),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//               Row(children: <Widget>[
//                 Expanded(
//                   child: Container(
//                       margin: const EdgeInsets.only(left: 110.0, right: 15.0),
//                       child: Divider(
//                         color: notifier.getblack,
//                         height: 50.h,
//                       )),
//                 ),
//                 Text(
//                   EnString.or,
//                   style: TextStyle(color: notifier.getblack, fontSize: 15.sp),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.only(left: 15.0, right: 110.0),
//                     child: Divider(
//                       color: notifier.getblack,
//                       height: 50.h,
//                     ),
//                   ),
//                 ),
//               ]),
//               SizedBox(height: height / 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   authlogin(EnString.google, notifier.getblack,
//                       "assets/google.png", notifier.getwihitecolor),
//                   SizedBox(width: width / 50),
//                   authlogin(EnString.apple, notifier.getblack,
//                       "assets/apple.png", notifier.getwihitecolor),
//                 ],
//               ),
//               SizedBox(height: height / 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     EnString.donthaveanaccount,
//                     style: TextStyle(
//                         color: notifier.getblack,
//                         fontFamily: 'Gilroy_Medium',
//                         fontSize: 13.sp),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(const Signup());
//                     },
//                     child: Text(
//                       EnString.signupnow,
//                       style: TextStyle(
//                           color: notifier.getperple,
//                           fontFamily: 'Gilroy_Bold',
//                           fontSize: 13.sp),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottomscreen/home/forgotpassword.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isloading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Utils.appbarColor,
          foregroundColor: Utils.appbarForgroundColor,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 170,
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
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top:30.0,left: 20,right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!value.contains('@')) {
                                return 'please enter valid email';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.phone),
                                prefixIconColor: Colors.blue,
                                hintText: 'Enter email and phone number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                            controller: passwordController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor: Colors.blue,
                                suffixIcon: const Icon(Icons.visibility),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => const Forgotpassword());
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
                                title: isloading
                                    ? const CircularProgressIndicator()
                                    : const Text('Sign In'),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {}
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
