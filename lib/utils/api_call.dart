// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:TezHealthCare/utils/Api_Constant.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:shared_preferences/shared_preferences.dart';

Future api(Api_link, Body, type) async {
  try {
    final response = await http.post(
      Uri.parse(Api_link),
      headers: ApiLinks.MainHeader,
      body: json.encode(Body),
    );
    if (response.statusCode == 200) {
      if (type == 'json') {
        return json.decode(response.body);
      } else {
        return response.body;
      }
    } else {
      throw Exception('Failed to load data from the API');
    }
  } catch (error) {
    return const Text("Badka error Agel");
  }
}

class Dasboarddataapicall {
  static Future<double> fetchData(String table) async {
    try {
      final url = Uri.parse(ApiLinks.total_count);
      const headers = ApiLinks.MainHeader;
      SharedPreferences sp = await SharedPreferences.getInstance();
      String doctorId = sp.getString('id') ?? '';
      final body = {
        "doctor_id": doctorId,
        "table": table,
      };

      final response =
          await http.post(url, headers: headers, body: json.encode(body));
      
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        
        // Use double.parse to convert the response data to double
        return double.parse(responseData.toString());
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (error) {
      print('Error fetching data: $error');
      return 0; // Set a default value or handle the error appropriately
    }
  }
}
