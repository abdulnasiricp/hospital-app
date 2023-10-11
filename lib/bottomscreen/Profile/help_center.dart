import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('HelpCenter'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
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
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Tezash & Group Pvt Ltd',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Tezash & Group Pvt Ltd',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Address
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('123 Main Street'),
                subtitle: Text('City, Country'),
              ),
              // Contact Information
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email: support@yourapp.com'),
              ),
              // Phone Number
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone: +123-456-7890'),
              ),
              // Divider
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              // Search Bar
            ],
          ),
        ),
      ),
    );
  }
}
