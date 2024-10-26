import 'dart:developer';
import 'dart:io';

class ServerManager {
  late String _address;
  late String _port;

  String get address {
    return _address;
  }

  String get port {
    return _port;
  }

  void startServer() async {
    var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3333);
    log("Server running on IP : ${server.address} On Port : ${server.port}");
    _address = server.address as String;
    _port = server.port as String;
    await for (var request in server) {
      request.response
        ..headers.contentType = ContentType("text", "plain", charset: "utf-8")
        ..write('Hello, world')
        ..close();
    }
  }
}
