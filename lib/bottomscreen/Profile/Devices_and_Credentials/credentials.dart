// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Credentials extends StatefulWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.2),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: width,
                height: height / 5,
                child:  Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,left: 20,),
                        child: Row(
                      
                          children: [
                            SvgPicture.asset('assets/dev.svg',color: Colors.green,width: 25,height: 25,),
                             const SizedBox(width: 10,),
                            const Text('Techno Common 15',style: TextStyle(fontWeight: FontWeight.bold),),
                           
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('App version'),
                                Text('version 11.0.01'),

                                  ],
                                ),
                                 Column(
                                  children: [
                                    Text('Added on'),
                                Text('27-09-2023,9:15'),

                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
