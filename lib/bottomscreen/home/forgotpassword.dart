// // ignore_for_file: sized_box_for_whitespace

// import 'dart:convert';

// import 'package:TezHealthCare/utils/My_button.dart';
// import 'package:TezHealthCare/utils/helper_class.dart';
// import 'package:flutter/material.dart';
// import 'package:TezHealthCare/utils/mediaqury.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:http/http.dart' as http;


// class Forgotpassword extends StatefulWidget {
//   const Forgotpassword({Key? key}) : super(key: key);

//   @override
//   State<Forgotpassword> createState() => _ForgotpasswordState();
// }

// class _ForgotpasswordState extends State<Forgotpassword> {
//   TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   var isloading = false;


// void resetPassword(String email) async {
//   const apiUrl = 'https://uat.tez.hospital/xzy/webservice/forgotpassword';
//   final body = {'username': email}; // You can change 'email' to 'username' based on your API requirements.

//   final response = await http.post(
//     Uri.parse(apiUrl),
//     headers: {
//        'Soft-service': 'TezHealthCare',
//         'Auth-key': 'zbuks_ram859553467'
//     },
//     body: json.encode(body),
//   );

//   if (response.statusCode == 200) {
//     // Password reset request successful
//     // You can handle the success response here
//   } else {
//     // Password reset request failed
//     // You can handle the error response here
//   }
// }

// //   Future<void> resetPassword() async {
// //   final url = Uri.parse('https://uat.tez.hospital/xzy/webservice/forgotpassword');
// //   final response = await http.post(
// //     url,
// //     headers: {
// //         'Soft-service': 'TezHealthCare',
// //         'Auth-key': 'zbuks_ram859553467'
// //       },
// //     body: {

// //     },
    
// //   );

// //   if (response.statusCode == 200) {
// //     Fluttertoast.showToast(msg: 'Password reset request sent successfully');
// //   } else {
// //     // Handle errors,
// //     Fluttertoast.showToast(msg: 'invalid email or server issues');
// //     setState(() {
// //       isloading=false;
// //     });

// //   }
// // }
 
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Utils.scaffoldBackgroundColor,
//         appBar: AppBar(
//           title: const Text('Forgot Password'),
//           centerTitle: true,
//           backgroundColor: Utils.appbarColor,
//           foregroundColor: Utils.appbarForgroundColor,
//         ),
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 height: 170,
//                 decoration: BoxDecoration(
//                     color: Utils.bgColor,
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Utils.containerColor,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Form(
//                     key: formKey,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Column(
//                         children: [
                          
                        
//                           Padding(
//                             padding: const EdgeInsets.only(top:30),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please Enter your Username or email';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               controller: passwordController,
//                               onTapOutside: (event) =>
//                                   FocusScope.of(context).unfocus(),
//                               decoration: InputDecoration(
//                                   hintText: 'Enter Usermame or Email',

//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                           ),
                         
//                           const SizedBox(
//                             height: 30,
//                           ),
                          
//                           Container(
//                               width: double.infinity,
//                               height: 50,
//                               child: MyButton(
//                                 title: isloading
//                                     ? const CircularProgressIndicator()
//                                     : const Text('Forgot'),
//                                 onPressed: () {
//                                   if (formKey.currentState!.validate()) {
//                                     resetPassword;
//                                     setState(() {
//                                       isloading=true;
//                                     });
//                                   }
//                                 },
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
             
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Forgotpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Adjust opacity for the glass effect
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/loading.json'),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add authentication logic here
                    // For example, check user credentials and navigate to the app's main screen if valid.
                    // You can use packages like Firebase for authentication.
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 90),

                // ElevatedButton(
                //   onPressed: () {
                //     // Add authentication logic here
                //     // For example, check user credentials and navigate to the app's main screen if valid.
                //     // You can use packages like Firebase for authentication.
                //   },
                //   child: const Text('Sign In'),
                // ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}