import 'package:TezHealthCare/screens/auth/Doctor_Login.dart';
import 'package:TezHealthCare/screens/auth/Patient_login.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
class MainSiginScreen extends StatefulWidget {
  const MainSiginScreen({Key? key}) : super(key: key);
  @override
  State<MainSiginScreen> createState() => _MainSiginScreenState();
}

class _MainSiginScreenState extends State<MainSiginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkblue,
        body: DefaultTabController(
          length: 2,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ButtonsTabBar(
                  height: 50,
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  backgroundColor: yellow,
                  unselectedBackgroundColor: darkblue,
                  labelStyle: const TextStyle(
                      wordSpacing: 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  borderWidth: 1,

                  //  elevation: 30,

                  tabs:  [
                    Tab(
                      child: Container(
                        width: 150,
                        child: const Center(
                          child: Text('Patient Login',style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        ),
                      ),


                    ),
                    Tab(
                      child: Container(
                        width: 150,
                        child: const Center(
                          child: Text('Doctor Login',style: TextStyle(
                              wordSpacing: 5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        ),
                      ),


                    ),

                  ]),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PatientLogin(),
                  DoctorLogin(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5,),
                child: Text(
                  '©2023 Tez Care. All Right Reserved',
                  style: TextStyle(
                      fontSize: 8, fontWeight: FontWeight.bold, color: yellow),
                ),
              ),
            ),
          ]),
        ),
        // extendBodyBehindAppBar: true, // Extend the body behind the app bar
      ),
    );
  }
}







