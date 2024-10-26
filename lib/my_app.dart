import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'server_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServerManager server = ServerManager();
  String _ipAddrLocal = 'Fetching IP...';

  @override
  void initState() {
    super.initState();
    _getWindowsEthernetIP();
    server.startServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IP Local: $_ipAddrLocal'),
          ],
        ),
      ),
    );
  }

  Future<void> _getWindowsEthernetIP() async {
    final networkInterfaces = await NetworkInterface.list();
    for (var networkInterface in networkInterfaces) {
      for (var address in networkInterface.addresses) {
        if (address.type == InternetAddressType.IPv4) {
          log('IP Local Address: ${address.address}');
          setState(() {
            _ipAddrLocal = address.address;
          });
        }
      }
    }
  }
}
