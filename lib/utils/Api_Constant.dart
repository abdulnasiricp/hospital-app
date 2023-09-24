// api_constants.dart

// ignore_for_file: constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart';
const String BASE_URL = 'https://uat.tez.hospital/xzy/webservice';
const String CREATE_USER_API = '$BASE_URL/users';
const String UPDATE_USER_API = '$BASE_URL/users/:id';
const String Doctor_List_API = '$BASE_URL/getDoctor';
Future<Response> postRequest(String apiEndpoint, Map<String, dynamic> body) async {
  final response = await post(Uri.parse(apiEndpoint), body: jsonEncode(body),
  );
  return response;
}
