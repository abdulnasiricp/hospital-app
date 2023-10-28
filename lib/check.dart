import 'dart:convert';
import 'package:TezHealthCare/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class MaritalStatusList extends StatefulWidget {
  @override
  _MaritalStatusListState createState() => _MaritalStatusListState();
}

class _MaritalStatusListState extends State<MaritalStatusList> {
  List<String> maritalStatusList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Fetch marital status data from your API
    fetchMaritalStatusData();
  }

  Future<void> fetchMaritalStatusData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .post(Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final maritalStatus = data['marital_status'];
      setState(() {
        maritalStatusList = maritalStatus.values.toList().cast<String>();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load marital status data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marital Status List'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: 50,
            width: 50,
            color: Colors.transparent,
            child: const LoadingIndicatorWidget(),
          ),
        ),
      );
    } else if (maritalStatusList.isEmpty) {
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
      return ListView.builder(
        itemCount: maritalStatusList.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          final statusValue = maritalStatusList[index];
          return Card(
            color: Colors.white70.withOpacity(0.7),
            child: ListTile(
              title: Text(" $itemNumber. $statusValue"),
            ),
          );
        },
      );
    }
  }
}



