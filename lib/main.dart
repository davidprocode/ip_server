import 'package:flutter/material.dart';
import 'my_app.dart';

void main() {
  runApp(const MyAppWrapper()); // Run MyAppWrapper instead of MyApp
}

class MyAppWrapper extends StatelessWidget {
  // New wrapper
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // MaterialApp provides Directionality
      home: MyApp(), // Your original MyApp widget
    );
  }
}
