import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://uat.tez.hospital/xzy/webservice"; // Replace with your API URL

  Future<Map<String, dynamic>> getUserData(String patientId) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl/getPatientprofile'), // Replace with your user endpoint
        body: {
          'patientId': patientId
        },
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467'
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      return userData;
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
