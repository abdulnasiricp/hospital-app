// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print, unused_element, deprecated_member_use, unnecessary_null_comparison

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({Key? key}) : super(key: key);
  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  bool isLoading = true;

//////////////////////////////////////////////////////////////////////////////////////////
// about us detials

  List<String> sliderImages = []; // Declare the sliderImages list here

  late String HospitalName = '';
  late String HospitalEmail = '';
  late String HospitalPhone = '';
  late String HospitalAddress = '';
  late String HospitalLocation = '';
  late String HospitalLogo = '';
  late String SliderImages = '';
  // SliderImages

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

        // Get hospital data
        HospitalName = data['0']['name'];
        HospitalEmail = data['0']['email'];
        HospitalPhone = data['0']['phone'];
        HospitalAddress = data['0']['address'];
         HospitalLocation = data['map_link'];
         HospitalLogo = data['0']['hospital_front'];

        // Parse the 'slider_image' array
        sliderImages = (data['slider_image'] as List).cast<String>();

       

        // Set the state to rebuild the widget
        setState(() {});
      } else {
        // Handle the error
      }
    } catch (error) {
      print(error);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
// map and phone call
  Future<void> openMapUrl() async {
    final url = HospitalLocation;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  /// Get All Doctor
  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
  List<dynamic>? NewListData = [];

  Future hitApi() async {
    final response = await http.post(
      Uri.parse(ApiLinks.getAllDoctor),
      headers: ApiLinks.MainHeader,
    );
    if (response.statusCode == 200) {
      setState(() {
        DataMap = jsonDecode(response.body);
        DoneListData = DataMap!['doctors'];
        print(DoneListData);
        isLoading = false;
      });
    } else {
      print('Error getting Products: ${response.statusCode}');
    }
    for (var i = 0; i < DoneListData!.length; i++) {
      NewListData?.add({
        "name": DoneListData?[i]["name"],
        "id": DoneListData?[i]["id"],
        "email": DoneListData?[i]["email"],
      });
    }
    // TO SHOW ALL LIST AT INITIAL
    setState(() {
      NewListData = DoneListData;
    });
  }

//////////////////////////////////////////////////////////////////////////////////////////
  ///
  @override
  void initState() {
    getAboutUsDetails();

    hitApi();
    super.initState();
  }

//////////////////////////////////////////////////////////////////////////////////////////
  /// refresh screen
  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await hitApi();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }
//////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: darkYellow, // Set the status bar color here
      ),
    );
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Colors.lightBlue[50],
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: isLoading
            ? Center(
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: const LoadingIndicatorWidget(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: width,
                          child: Container(
                            child: CarouselSlider(
                              items: sliderImages
                                  .map((item) => Container(
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return CircularProgressIndicator(
                                                color: darkYellow,
                                                backgroundColor: yellow,
                                              );
                                            }
                                          },
                                        ),
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                aspectRatio: 2.0,
                                autoPlay: true,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 150,
                            left: width / 25,
                            right: width / 25,
                          ),
                          child: Container(
                            height: height / 4,
                            width: width,
                            child: Card(
                              // color: Colors.grey[200],
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 100,
                                          width: 70,
                                          child:
                                              Image.network(HospitalLogo),
                                              
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              HospitalName,
                                              maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                           
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(HospitalAddress,
                                            style: const TextStyle(
                                                fontSize: 12
                                              ),
                                             overflow: TextOverflow
                                  .ellipsis, // Use ellipsis to cut off the text
                              maxLines: 1,),
                                            Text(HospitalEmail,
                                            style: const TextStyle(
                                                fontSize: 12
                                              ), overflow: TextOverflow
                                  .ellipsis, // Use ellipsis to cut off the text
                              maxLines: 1,),
                                       
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      makePhoneCall(HospitalPhone);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: SvgPicture.asset(
                                                'assets/phone.svg',
                                                width: 15,
                                                height: 15,
                                                color: darkYellow,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              HospitalPhone,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {
                                          openMapUrl();
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              child: SvgPicture.asset(
                                                'assets/location.svg',
                                                width: 15,
                                                height: 15,
                                                color: darkYellow,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'viewLocation'.tr,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'doctors'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: width,
                          height: 250,
                          child: isLoading
                              ? Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white70,
                                    child: const LoadingIndicatorWidget(),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: DoneListData!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: width / 2,
                                          height: 250,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: '${DoneListData![index]['image']}' !=
                                                                null &&
                                                            '${DoneListData![index]['image']}' !=
                                                                ''
                                                        ? Image.network(
                                                            '${DoneListData![index]['image']}',
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.fill,
                                                            loadingBuilder:
                                                                (context, child,
                                                                    loadingProgress) {
                                                              if (loadingProgress ==
                                                                  null) {
                                                                return child;
                                                              } else {
                                                                return CircularProgressIndicator(
                                                                  color:
                                                                      darkYellow,
                                                                  backgroundColor:
                                                                      yellow,
                                                                );
                                                              }
                                                            },
                                                          )
                                                        : Center(
                                                            child: SvgPicture.asset(
                                                                'assets/Noimagedoctor.svg',
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                                color:
                                                                    darkYellow),
                                                          ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Dr. ${DoneListData![index]['name']} ${DoneListData![index]['surname']}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${DoneListData![index]['specialization']}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${DoneListData![index]['qualification']}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: width,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      color: yellow,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final sharedPreferences =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        if (sharedPreferences
                                                            .containsKey(
                                                                'role')) {
                                                          final String? role =
                                                              sharedPreferences
                                                                  .getString(
                                                                      'role');
                                                          print(
                                                              '==============================> Role: $role');

                                                          if (role == '3') {
                                                            // User is logged in as a doctor
                                                            // You can show a message or take any other action here
                                                            Fluttertoast
                                                                .showToast(
                                                              msg:
                                                                  'You cant book appointments. Logged in as a doctor.',
                                                            );
                                                            print(
                                                                'You are logged in as a doctor!');
                                                          } else {
                                                            // User is not logged in as a doctor, navigate to the appointment screen
                                                            Get.to(() =>
                                                                SelectDateScreen(
                                                                  workExp: DoneListData![
                                                                          index]
                                                                      [
                                                                      'work_exp'],
                                                                  doctorId:
                                                                      DoneListData![
                                                                              index]
                                                                          [
                                                                          'id'],
                                                                  doctorImage:
                                                                      DoneListData![
                                                                              index]
                                                                          [
                                                                          'image'],
                                                                  doctorName: DoneListData![
                                                                              index]
                                                                          [
                                                                          'name'] +
                                                                      DoneListData![
                                                                              index]
                                                                          [
                                                                          'surname'],
                                                                  doctorSpecialization:
                                                                      DoneListData![
                                                                              index]
                                                                          [
                                                                          'specialization'],
                                                                  department_id:
                                                                      DoneListData![
                                                                              index]
                                                                          [
                                                                          'department_id'],
                                                                ));
                                                          }
                                                        } else {
                                                          Fluttertoast
                                                              .showToast(
                                                            msg:
                                                                'Oops! Something went to wrong.',
                                                          );
                                                        }
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'bookAppointment'.tr,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Text(
                              'Powered by:',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: yellow),
                            ),
                            Image.asset(
                              'assets/Tezashlogo.png',
                              width: 120, // Adjust the width as needed
                              height: 50, // Adjust the height as needed
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
