import 'package:flutter/material.dart';
import 'my_app.dart';

Future<void> main() async {
  runApp(const MyAppWrapper());
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppWrapper();
  }
}

class _MyAppWrapper extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}
