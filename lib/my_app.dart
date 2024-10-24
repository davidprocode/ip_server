import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _ipAddr = '0.0.0.0';

  @override
  void initState() {
    super.initState();
    _getWindowsEthernetIP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('IP: $_ipAddr')),
    );
  }

  Future<void> _getWindowsEthernetIP() async {
    final networkInterfaces = await NetworkInterface.list();

    for (var networkInterface in networkInterfaces) {
      for (var address in networkInterface.addresses) {
        if (address.type == InternetAddressType.IPv4) {
          log('IP address: ${address.address}');
          setState(() {
            _ipAddr = address.address;
          });
        }
      }
    }
  }
}
