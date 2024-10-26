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
  String _ipAddrLocal = 'Fetching IP...';
  String _ipAddrServer = 'Starting server...';

  @override
  void initState() {
    super.initState();
    _getWindowsEthernetIP();
    _startServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IP Local: $_ipAddrLocal'),
            const SizedBox(width: 20),
            Text('IP Server: $_ipAddrServer')
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
          log('IP address: ${address.address}');
          setState(() {
            _ipAddrLocal = address.address;
          });
        }
      }
    }
  }

  Future<void> _startServer() async {
    ServerManager server = ServerManager();
    server.startServer();

    setState(() {
      _ipAddrServer = '${server.address}:${server.port}';
    });
  }
}
