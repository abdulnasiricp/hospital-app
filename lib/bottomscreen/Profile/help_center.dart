// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  void launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchEmailClient(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $email';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          title: Text('HelpCenter'.tr),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          child: Image.asset(
                            'assets/tezash.png', // Replace with your logo file path
                            width: width / 3,
                            height: height / 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/help.svg',
                      color: darkYellow,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: const Text(
                          'For linked Bank account specific queries and \n transaction error.'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/call.svg',
                              color: darkYellow,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Support Call',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('2438479234782'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  makePhoneCall('2438479234782');
                                },
                                child: const Text(
                                  'Call',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 40.0, right: 10, bottom: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('2438479234782'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  makePhoneCall('2438479234782');
                                },
                                child: const Text(
                                  'Call',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 40.0, right: 10, bottom: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('2438479234782 (Toll Free-NTC)'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  makePhoneCall('2438479234782');
                                },
                                child: const Text(
                                  'Call',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 40.0, right: 10, bottom: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('2438479234782 (Toll Free-NTC)'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  makePhoneCall('2438479234782');
                                },
                                child: const Text(
                                  'Call',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/mail.svg',
                              color: darkYellow,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Supportteam@gmail.com'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  launchEmailClient('Supportteam@gmail.com');
                                },
                                child: const Text(
                                  'Mail',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/website.svg',
                              color: darkYellow,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Website',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('https://tezash.com/'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  launchWebsite('https://tezash.com/');
                                },
                                child: const Text(
                                  'Visit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/helpcenter.svg',
                              color: darkYellow,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Help Desk',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('https://tezash.com/'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  launchWebsite('https://tezash.com/');
                                },
                                child: const Text(
                                  'Report query',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        // child: Card(
        //   color: Colors.white,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Card(
        //         child: Padding(
        //           padding: const EdgeInsets.all(2.0),
        //           child: Container(
        //             child: Image.asset(
        //               'assets/tezash.png', // Replace with your logo file path
        //               width: width / 3,
        //               height: height / 12,
        //             ),
        //           ),
        //         ),
        //       ),
        //       Card(
        //         child: Container(
        //           child: const Padding(
        //             padding: EdgeInsets.all(2.0),
        //             child: Text(
        //               'Tezash & Group Pvt Ltd',
        //               style: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       const Divider(
        //         thickness: 1,
        //         indent: 20,
        //         endIndent: 20,
        //       ),
        //       Card(
        //         child: Container(
        //           child: const Padding(
        //             padding: EdgeInsets.all(2.0),
        //             child: Text(
        //               'Tezash & Group Pvt Ltd',
        //               style: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       // Address
        //       const ListTile(
        //         leading: Icon(Icons.location_on),
        //         title: Text('123 Main Street'),
        //         subtitle: Text('City, Country'),
        //       ),
        //       // Contact Information
        //       const ListTile(
        //         leading: Icon(Icons.email),
        //         title: Text('Email: support@yourapp.com'),
        //       ),
        //       // Phone Number
        //       const ListTile(
        //         leading: Icon(Icons.phone),
        //         title: Text('Phone: +123-456-7890'),
        //       ),
        //       // Divider
        //       const Divider(
        //         thickness: 1,
        //         indent: 20,
        //         endIndent: 20,
        //       ),
        //       // Search Bar
        //     ],
        //   ),
        // ),
        );
  }
}
