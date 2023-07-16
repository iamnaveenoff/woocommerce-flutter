import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../providers/GetAllProducts_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetAllProductsProvider>(context);
    final List<ProductModel> products = provider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.productName),
            subtitle: Text(product.shortDescription),
            leading: Image.network(product.image),
            trailing: Text(product.rate),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.getAllProducts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
