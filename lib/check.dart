import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class lomilomi extends StatefulWidget {
  @override
  State<lomilomi> createState() => _lomilomiState();
}

class _lomilomiState extends State<lomilomi> {
  List<dynamic> departmentData = [];
  bool isLoading = true;
  String errorMessage = '';
  bool isDisposed = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/lists'),
      );

      if (isDisposed) {
        return; // Check if the widget is disposed before updating the state.
      }

      if (response.statusCode == 200) {
        try {
          final data = json.decode(response.body);

          if (data['department'] != null) {
            if (isDisposed) {
              return; // Check if the widget is disposed before updating the state.
            }
            setState(() {
              departmentData = data['department'];
              isLoading = false;
            });
          } else {
            throw FormatException('No department data found');
          }
        } catch (e) {
          if (isDisposed) {
            return; // Check if the widget is disposed before updating the state.
          }
          setState(() {
            isLoading = false;
            errorMessage = 'Invalid JSON response from the server.';
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (isDisposed) {
        return; // Check if the widget is disposed before updating the state.
      }
      setState(() {
        isLoading = false;
        errorMessage =
            'An error occurred while fetching data. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department List'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(errorMessage),
                )
              : departmentData.isEmpty
                  ? Center(
                      child: Text('No data found'),
                    )
                  : ListView.builder(
                      itemCount: departmentData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(departmentData[index]['name']),
                        );
                      },
                    ),
    );
  }
}
