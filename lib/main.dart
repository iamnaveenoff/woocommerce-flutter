import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce_app/screens/home_screen.dart';
import 'package:woocommerce_app/screens/login_screen.dart';

import 'providers/GetAllProducts_provider.dart';
import 'providers/signup_provider.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(
          create: (_) => SignupProvider(),
        ),
        ChangeNotifierProvider<GetAllProductsProvider>(
          create: (_) => GetAllProductsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Product App',
        home: HomeScreen(),
      ),
    );
  }
}

