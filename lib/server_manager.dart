import 'dart:io';

class ServerManager {
  late String _address = '';
  late String _port = '';

  String get address {
    return _address;
  }

  String get port {
    return _port;
  }

  startServer() async {
    await HttpServer.bind(InternetAddress.loopbackIPv4, 3333).then(
      (server) async {
        _address = server.address.toString();
        _port = server.port.toString();

        await for (var request in server) {
          request.response
            ..headers.contentType =
                ContentType("text", "plain", charset: "utf-8")
            ..write('Hello, world')
            ..close();
        }
      },
    );
  }
}
