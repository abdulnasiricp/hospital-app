import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VitalsListView extends StatefulWidget {
  @override
  _VitalsListViewState createState() => _VitalsListViewState();
}

class _VitalsListViewState extends State<VitalsListView>  {

  Future<Map<String, dynamic>> fetchVitalsData() async {
    final response = await http.post(
      Uri.parse('https://uat.tez.hospital/xzy/webservice/getipdVitals'), // Replace with your API URL
      headers: {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
      },
      body: jsonEncode({
        "ipd_id": 313,
        "patient_id": 10909,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load vitals data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitals Data'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchVitalsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final vitalsData = snapshot.data!['vitals'];

            return ListView(
              children: <Widget>[
                ListTile(
                  title: Text('ID: ${vitalsData['id']}'),
                  subtitle: Text('Patient ID: ${vitalsData['patient_id']}'),
                ),
                ListTile(
                  title: Text('Height: ${vitalsData['Height']}'),
                  subtitle: Text('Weight: ${vitalsData['weight']}'),
                ),
                // Add more ListTile widgets for other vitals data here
              ],
            );
          }
        },
      ),
    );
  }
}