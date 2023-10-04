// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print, unused_element, deprecated_member_use

import 'dart:convert';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({Key? key}) : super(key: key);
  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  bool isLoading = true;
  final List<String> imgList = [
    'https://tse1.mm.bing.net/th?id=OIP.rf_UTwDKG7XALHaGmsYesQHaFj&pid=Api&P=0&h=180',
    'https://i.pinimg.com/originals/eb/35/91/eb3591c54fb651f20d157ed7099c4576.jpg',
    'https://www.medylife.com/blog/wp-content/uploads/2017/10/Best-Cardiology-Hospital.jpg',
    'https://northernvirginiamag.com/wp-content/uploads/2020/12/hospital.jpg',
    'https://www.krausanderson.com/wp-content/uploads/2018/11/01_U-of-M-Masonic-Childrens-Hospital-Amplatz-Exterior-View-of-Courtyard-Old-Hospital-and-New-Addition-1920x1080.jpg',
    'https://yesofcorsa.com/wp-content/uploads/2017/05/Hospital-Wallpaper.jpg',
    'https://s3.amazonaws.com/uchealth-wp-uploads/wp-content/uploads/sites/6/2018/01/02032200/UCHealth_Memorial_Hospital_Central_Morning.jpgeee.jpg',
    'https://media.consumeraffairs.com/files/news/Hospital_building_JazzIRT_GI.jpg',
  ];

  Future<void> openMapUrl() async {
    const url = 'https://maps.app.goo.gl/wsazHc8ssSPihXvR7';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall() async {
    const phoneNumber = 'tel:051-520012';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not make a phone call';
    }
  }

  Map<String, dynamic>? DataMap;
  Map<String, dynamic>? DoneDataMap;
  List<dynamic>? DoneListData = [];
  List<dynamic>? NewListData = [];

  Future hitApi() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467'
      },
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

  @override
  void initState() {
    hitApi();
    super.initState();
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isLoading = true; // Set isLoading to true when refreshing
    });

    await hitApi();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: height / 3,
                          width: width,
                          child: Container(
                            child: CarouselSlider(
                              items: imgList
                                  .map(
                                    (item) => Container(
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  )
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
                            top: height / 4,
                            left: width / 25,
                            right: width / 25,
                          ),
                          child: Container(
                            height: height / 3.5,
                            width: width,
                            child: Card(
                              color: Colors.grey[200],
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
                                          width: 100,
                                          child:
                                              Image.asset('assets/mayao.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'hospitalName'.tr,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('hospitalNameCity'.tr),
                                            Text('hospitalNameCityLocation'.tr),
                                            Container(
                                              height: 50,
                                              width: 175,
                                              child: const Card(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        '   200 \n General',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        '     20 \n ICU/CCU',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        '     20 \n Emergency',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      makePhoneCall();
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
                                            const Text(
                                              '051-520012',
                                              style: TextStyle(
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
                        Card(
                          color: Colors.white70.withOpacity(0.6),
                          child: Container(
                            width: width,
                            height: height / 2.5,
                            child: isLoading
                                ? Center(
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.transparent,
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
                                            height: height / 3,
                                            child: Card(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        '${DoneListData![index]['image']}', // Replace with your image URL
                                                        width:
                                                            100.0, // Set the width (optional)
                                                        height:
                                                            100.0, // Set the height (optional)
                                                        fit: BoxFit
                                                            .cover, // Set the BoxFit (optional)
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          } else {
                                                            return CircularProgressIndicator(
                                                              color: darkYellow,
                                                              backgroundColor:
                                                                  yellow,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
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
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              SelectDateScreen(
                                                                doctorId:
                                                                    DoneListData![
                                                                            index]
                                                                        ['id'],
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
                                                              ));
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            'bookAppointment'
                                                                .tr,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
