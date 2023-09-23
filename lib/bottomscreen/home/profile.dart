// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';

import 'package:TezHealthCare/Splash_Screen.dart';
import 'package:TezHealthCare/bottomscreen/Profile/Information_profile.dart';
import 'package:TezHealthCare/bottomscreen/Profile/profile_model.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/utils/notifirecolors.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var profileData;

    Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('username');
    sharedPreferences.remove('password');

    // Navigate to the login screen
    Get.off(() => const Splash_Screen());
  }


String role = '', usernamerecord = '';
  String record = '', genderrecord = '';
  String imagerecord = '', email = '';
  String mobile = '', id = '';

 getAllData() async {
    await LoadData();

    await ProfileApi();
  }

  @override
  void initState() {
    getAllData();

    super.initState();
  }

  LoadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    role = sharedPreferences.getString('role') ?? '';
    email = sharedPreferences.getString('username') ?? '';
    record = sharedPreferences.getString('record') ?? '';
    genderrecord = sharedPreferences.getString('genderrecord') ?? '';
    imagerecord = sharedPreferences.getString('imagerecord') ?? '';
    usernamerecord = sharedPreferences.getString('usernamerecord') ?? '';
    mobile = sharedPreferences.getString('mobile') ?? '';
    setState(() {});
  }

  
Future<void> ProfileApi()async{
  const apiUrl = 'https://uat.tez.hospital/xzy/webservice/getPatientprofile';
  final headers = {
    'Soft-service': 'TezHealthCare',
    'Auth-key': 'zbuks_ram859553467',
  };

  final requestBody = jsonEncode({"patientId":10723});


   try {
    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: requestBody);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final profileJson = responseBody[0]; // Assuming your API returns a list with one item
      setState(() {
        profileData = ProfileData.fromJson(profileJson);
      });
    }else {
      // Request failed with an error status code
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle any exceptions that occur during the request
    print('Request error: $e');
  }
}

  late ColorNotifier notifier;

  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (_, child) => Scaffold(
        appBar: AppBar(backgroundColor: darkYellow,elevation: 0,),
        backgroundColor: notifier.getwihitecolor,
        body: profileData != null? Column(
          children: [
            Stack(children: [
                  Container(
                    color: darkYellow,
                    width: width,
                    height: height / 4,
                  ),
                 Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profileData.image??""),
                      radius: 50,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 5.5),
                    child:  Center(
                        child: Text(profileData.patientName??"",
                        
                      // DoneListData?['patient_name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: height / 4.7),
                    child:  Center(
                        child: Text(profileData.mobileNo??"",
                      // DoneListData?['patient_name'],

                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )),
                  ),
                
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      // height: height,
                      child: 
                       Card(
                        child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(()=>const InformationProfile());
                            },
                            child: const ListTile(
                              leading: Icon(Icons.perm_device_information_rounded,color: Colors.blue,),
                              title: Text('My Information',style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text('view your personal details'),
                            ),
                          ),
                           InkWell(
                            onTap: (){},
                            child: const ListTile(
                              leading: Icon(Icons.devices,color: Colors.blue,),
                              title: Text('Device & Credentials',style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text('manage your Devices,cridentials and notification ID'),
                            ),
                          ),
                           InkWell(
                            onTap: (){},
                            child: const ListTile(
                              leading: Icon(Icons.account_balance_wallet_rounded,color: Colors.blue,),
                              title: Text('Bank Account',style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text('manage your linked and save bank account'),
                            ),
                          ),
                           InkWell(
                            onTap: (){},
                            child: const ListTile(
                              leading: Icon(Icons.info,color: Colors.blue,),
                              title: Text('About Us',style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text('view your personal details'),
                            ),
                          ),
                           InkWell(
                            onTap: () {
                        _logout(context);
                      },
                            child: const ListTile(
                              leading: Icon(Icons.logout,color: Colors.blue,),
                              title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      ),),
                    )
                  ],),
                )


                

            // Stack(
            //   children: [
            //     Container(
            //       height: height / 4,
            //       decoration: BoxDecoration(
            //         color: notifier.getperple,
            //         borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(30.sp),
            //           bottomLeft: Radius.circular(30.sp),
            //         ),
            //       ),
            //       child: CustomAppBar(
            //           Colors.transparent,
            //           EnString.Profile,
            //           notifier.getwihitecolor,
            //           "assets/ic_back.png",
            //           height: height / 15),
            //     ),
            //     Column(
            //       children: [
            //         SizedBox(height: height / 5.5),
            //         Stack(
            //           children: [
            //             Center(
            //               child: Image.asset(
            //                 "assets/Avatar.png",
            //                 height: height / 9,
            //               ),
            //             ),
            //             Column(
            //               children: [
            //                 SizedBox(height: height / 15),
            //                 Padding(
            //                   padding: EdgeInsets.only(left: width / 1.9),
            //                   child: Container(
            //                     height: height / 24,
            //                     decoration: BoxDecoration(
            //                         color: notifier.getwihitecolor,
            //                         shape: BoxShape.circle),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8),
            //                       child: Image.asset("assets/ar-camera.png"),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),

            // Row(
            //   children: [
            //     SizedBox(width: width / 14),
            //     Text(
            //       EnString.firstName,
            //       style: TextStyle(
            //           fontSize: 14.sp,
            //           color: notifier.getgrey,
            //           fontFamily: 'Gilroy_Medium'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 80),
            // Padding(
            //   padding: EdgeInsets.only(left: width / 14, right: width / 14),
            //   child: Container(
            //     width: double.infinity,
            //     height: height/12,
            //     child: Card(
            //       child: Center(child: Text(usernamerecord.toString()))),
            //   )
              
            // ),

            // Row(
            //   children: [
            //     SizedBox(width: width / 14),
            //     Text(
            //       EnString.gender,
            //       style: TextStyle(
            //           fontSize: 14.sp,
            //           color: notifier.getgrey,
            //           fontFamily: 'Gilroy_Medium'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 80),
            // Padding(
            //   padding: EdgeInsets.only(left: width / 14, right: width / 14),
            //   child: Container(
            //     width: double.infinity,
            //     height: height/12,
            //     child: Card(
            //       child: Center(child: Text(genderrecord.toString()))),
            //   )
             
            // ),
            // SizedBox(height: height / 50),
           
        
            // Row(
            //   children: [
            //     SizedBox(width: width / 14),
            //     Text(
            //       EnString.phoneNumber,
            //       style: TextStyle(
            //           fontSize: 14.sp,
            //           color: notifier.getgrey,
            //           fontFamily: 'Gilroy_Medium'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 80),
            // Padding(
            //   padding: EdgeInsets.only(left: width / 14, right: width / 14),
            //   child:Container(
            //     width: double.infinity,
            //     height: height/12,
            //     child: Card(
            //       child: Center(child: Text(mobile.toString()))),
            //   )
               
            // ),
            // // SizedBox(height: height / 50),
            // Row(
            //   children: [
            //     SizedBox(width: width / 14),
            //     Text(
            //       EnString.email,
            //       style: TextStyle(
            //           fontSize: 14.sp,
            //           color: notifier.getgrey,
            //           fontFamily: 'Gilroy_Medium'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 80),
            // Padding(
            //   padding: EdgeInsets.only(left: width / 14, right: width / 14),
            //   child:Container(
            //     width: double.infinity,
            //     height: height/12,
            //     child: Card(
            //       child: Center(child: Text(email.toString()))),
            //   )
              
            // ),

          
          ],
        ):SizedBox()
      ),
    );
  }
}
