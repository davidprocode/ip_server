import 'dart:developer';
import 'dart:io';

class ServerManager {
  late String _address = "...";
  late String _port = "...";

  String get address {
    return _address;
  }

  String get port {
    return _port;
  }

  void startServer() async {
    await HttpServer.bind(InternetAddress.anyIPv4, 3333).then(
      (server) async {
        _address = server.address.toString();
        _port = server.port.toString();

        log("Addr: $_address");
        log("Port: $_port");

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
