import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';


class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isloading = false;
 
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
                  height: 300,
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
                        children: [
                          
                        
                          Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: TextFormField(
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
