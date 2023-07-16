import 'package:flutter/material.dart';
import 'package:woocommerce_app/screens/home_screen.dart';
import 'package:woocommerce_app/screens/login_screen.dart';

import 'screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignupScreen(),
        // Add other routes here
      },
    );
  }
}
