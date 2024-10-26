import 'dart:io';

class CommandManager {
  String turnOfTheMachine() {
    if (Platform.isWindows) {
      Process.run('shutdown', ['/s', '/f', '/t', '0']).then((result) {
        return "${result.stdout}";
      });
    }
    return "This script only works on Windows.";
  }
}
