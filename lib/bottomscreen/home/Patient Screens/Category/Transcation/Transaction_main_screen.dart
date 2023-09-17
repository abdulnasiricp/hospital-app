// ignore_for_file: file_names

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Direct_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/Pathology_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/pharmacy_bill.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Transcation/radiology_bill.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class MainTransactionScreen extends StatefulWidget {
  const MainTransactionScreen({Key? key}) : super(key: key);

  @override
  State<MainTransactionScreen> createState() => _MainTransactionScreenState();
}

class _MainTransactionScreenState extends State<MainTransactionScreen> {
  @override
 Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Transaction'),),
        // backgroundColor: darkYellow,
        body: DefaultTabController(
          length: 4,
          child: Column(children: [
            ButtonsTabBar(
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
                        child: Text('Pathology Bill',style: TextStyle(
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
                        child: Text('Direct Bill',style: TextStyle(
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
                        child: Text('Radiology Bill ',style: TextStyle(
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
                        child: Text('Pharmacy Bill',style: TextStyle(
                            wordSpacing: 5,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),),
                      ),
                    ),


                  ),

                ]),
             const Expanded(
              child: TabBarView(
                children: [
                  PathologyBill(),
                  DirectBill(),
                  RadiologyBill(),
                  PharmacyBill(),
                ],
              ),
            ),
          
          ]),
        ),
      
      ),
    );
  }
}







