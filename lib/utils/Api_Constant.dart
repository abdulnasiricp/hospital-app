// api_constants.dart

// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';

const String BASE_URL = 'https://uat.tez.hospital/xzy/webservice';

// Constants for different POST API endpoints
const String CREATE_USER_API = '$BASE_URL/users';
const String UPDATE_USER_API = '$BASE_URL/users/:id';
const String Doctor_List_API = '$BASE_URL/getDoctor';

// Function to make a POST request to the given API endpoint
Future<Response> postRequest(String apiEndpoint, Map<String, dynamic> body) async {
  final response = await post(Uri.parse(apiEndpoint), body: jsonEncode(body),
  
  );
  return response;
}
