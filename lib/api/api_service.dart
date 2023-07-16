import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://skimportexport.live/wp-json';

  static const String customerKey = 'ck_b88b1e696868f9c4a8a5e049e535f452a8124520';
  static const String customerSecret = 'cs_64acb47fa03099c284a48909373d1e70f8f06d91';

  Future<Map<String, dynamic>> _performRequest(
    String endpoint,
    String method, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$customerKey:$customerSecret'))}',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Request failed. Please try again.',
        };
      }
    } catch (error) {
      print('Error occurred during request: $error');
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }

  Future<Map<String, dynamic>> signup(String email, String password) async {
    final endpoint = '/wc/v3/customers';
    final data = {
      'email': email,
      'password': password,
    };

    return _performRequest(endpoint, 'POST', data: data);
  }

  Future<Map<String, dynamic>> getProducts() async {
    final endpoint = '/wc/v3/products';
    return _performRequest(endpoint, 'GET');
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final endpoint = '/wp-json/jwt-auth/v1/token';
    final data = {
      'username': email,
      'password': password,
    };

    return _performRequest(endpoint, 'POST', data: data);
  }

}
