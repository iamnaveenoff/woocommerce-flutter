import 'package:flutter/material.dart';
import '../api/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() {
      isLoading = true;
    });

    final response = await ApiService().getProducts();

    setState(() {
      isLoading = false;
      if (response['success']) {
        products = response['data'];
      } else {
        // Handle error case
        print('Error fetching products: ${response['message']}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(
                    product['image'],
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product['name']),
                  subtitle: Text('Price: \$${product['price']}'),
                  onTap: () {
                    // Open the product link in a web browser or WebView
                    // Replace with your preferred method of opening a URL
                    // You may use packages like url_launcher or webview_flutter
                    print('Opening product link: ${product['permalink']}');
                  },
                );
              },
            ),
    );
  }
}
