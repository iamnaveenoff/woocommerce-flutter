import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/products.dart';
import '../utils/constants.dart';

class GetAllProductsProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> getAllProducts() async {
    final url = '${ApiConstants.baseUrl}/products';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('${ApiConstants.customerKey}:${ApiConstants.customerSecret}'))}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _products = responseData.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    } else {
      // Handle error response
      print('Failed to fetch products: ${response.statusCode}');
    }

    notifyListeners();
  }
}
