import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';

class SurgeryPrescriptionList extends StatefulWidget {
  @override
  State<SurgeryPrescriptionList> createState() =>
      _SurgeryPrescriptionListState();
}

class _SurgeryPrescriptionListState extends State<SurgeryPrescriptionList> {
  Future<List<Map<String, dynamic>>?>? _futureData;
  bool isRefreshing = false; // Track refresh state

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<List<Map<String, dynamic>>?> fetchData() async {
    try {
      final Map<String, String> headers = {
        'Soft-service': 'TezHealthCare',
        'Auth-key': 'zbuks_ram859553467',
        'Content-Type': 'application/json',
      };

      final Map<String, dynamic> requestBody = {
        "ipd_id": "313",
        "patient_id": "10909",
      };

      final response = await http.post(
        Uri.parse(
            "https://uat.tez.hospital/xzy/webservice/getipdSurgeryPrescription"),
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map && data.containsKey('getIpdOperation')) {
          final prescriptions =
              List<Map<String, dynamic>>.from(data['getIpdOperation']);
          if (prescriptions.isNotEmpty) {
            return prescriptions;
          }
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<void> _handleRefresh() async {
    setState(() {
      isRefreshing = true; // Set isRefreshing to true when refreshing
    });

    await fetchData();

    setState(() {
      isRefreshing = false; // Set isRefreshing to false after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surgery'.tr),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder<List<Map<String, dynamic>>?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                isRefreshing) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.transparent,
                    child: const LoadingIndicatorWidget(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset(
                    'assets/No_Data_Found.json',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                              'Prescription ID: ${item['prescripton_id']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date: ${item['date']}'),
                              Text('Charge Name: ${item['charge_name']}'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: yellow, // Change the background color here
                          ),
                          onPressed: () {
                            // Handle opening the prescription report URL
                          },
                          child: Text('View Prescription Report'),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
