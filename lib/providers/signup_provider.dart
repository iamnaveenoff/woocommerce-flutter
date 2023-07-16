import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/signup.dart';
import '../utils/constants.dart';

class SignupProvider extends ChangeNotifier {
  Future<void> signup(SignupModel signupModel) async {
    final url = '${ApiConstants.baseUrl}/customers';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ${base64Encode(utf8.encode('${ApiConstants.customerKey}:${ApiConstants.customerSecret}'))}',
      },
      body: json.encode(signupModel.toJson()),
    );

    if (response.statusCode == 200) {
      // Signup successful
      // Handle success response if needed
      print('Signup successful');
    } else {
      // Signup failed
      final errorMessage = json.decode(response.body)['message'];
      // Handle error response if needed
      print('Signup failed: $errorMessage');
    }
  }
}
