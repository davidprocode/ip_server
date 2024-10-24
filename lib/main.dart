import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  final WindowManager wm = WindowManager.instance;

  @override
  void initState() {
    super.initState();
    wm.center(animate: true);
    wm.setAlwaysOnTop(true);
    wm.setSize(const Size(100, 100), animate: true);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}
