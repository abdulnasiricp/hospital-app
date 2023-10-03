// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Category/Doctor_profile.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Old_or_newPatient.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: darkYellow,
        title: Text('selectADate'.tr),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.to(()=>const DoctorProfile());
          }, icon: const Icon(Icons.info))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
                color: Colors.white70,

              child: Container(
                width: width,
                height: height / 10,
                child: Row(
                  children: [
                    Container(
                      height: height,
                      width: width / 5,
                      child: Image.asset(
                        'assets/drtwo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dr.Ramjinish Kushwaha',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('NEUROLOGY')
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Get.to(()=>const OldorNewPatientScreen());

                
              },
              child: Card(
                color: Colors.white70,
                child: Container(
                  width: width,
                  height: height / 10,
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width / 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('14',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 30)),
                            const Text('  Thuesday'),
                          ],
                        )
                      ),
                      const SizedBox(width: 40,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('[14/09/2023]  [14/09/2030] ',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                        Text('           (4 token left)',style: TextStyle(color: Colors.red),)
                      
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>const OldorNewPatientScreen());

              },
              child: Card(
                color: Colors.white70,

                child: Container(
                  width: width,
                  height: height / 10,
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width / 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('16',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 30)),
                            const Text('  Friday'),
                          ],
                        )
                      ),
                      const SizedBox(width: 40,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('[16/09/2023]  [16/09/2030] ',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                        Text('           (5 token left)',style: TextStyle(color: Colors.red),)
                      
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
                color: Colors.white70,

              child: Container(
                width: width,
                height: height / 10,
                child: Row(
                  children: [
                    Container(
                      height: height,
                      width: width / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('18',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 30)),
                          const Text('  sunday'),
                        ],
                      )
                    ),
                    const SizedBox(width: 40,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('[14/09/2023]  [18/09/2030] ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                      Text('           (3 token left)',style: TextStyle(color: Colors.red),)
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                color: Colors.white70,

              child: Container(
                width: width,
                height: height / 10,
                child: Row(
                  children: [
                    Container(
                      height: height,
                      width: width / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('20',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 30)),
                          const Text('  Thuesday'),
                        ],
                      )
                    ),
                    const SizedBox(width: 40,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('[20/09/2023]  [12/09/2030] ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                      Text('           (4 token left)',style: TextStyle(color: Colors.red),)
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                color: Colors.white70,

              child: Container(
                width: width,
                height: height / 10,
                child: Row(
                  children: [
                    Container(
                      height: height,
                      width: width / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('22',style: TextStyle(fontWeight: FontWeight.bold,color: darkYellow,fontSize: 30)),
                          const Text('  Friday'),
                        ],
                      )
                    ),
                    const SizedBox(width: 40,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('[22/09/2023]  [14/09/2030] ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                      Text('           (7 token left)',style: TextStyle(color: Colors.red),)
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
