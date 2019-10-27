import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TokenFile {
  static Future<File> writeToken(Credentials credentials) async {
    final file = await _localFile;
    return file.writeAsString(credentials.userNumber + '\n' + credentials.token);
  }

  static Future<Credentials> readToken() async {
    try {
      final file = await _localFile;
      var lines = (await file.readAsString()).split('\n');
      return Credentials(lines[0], lines[1]);
    } catch (e) {
      return Credentials('', '');
    }
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/token.txt');
  }
}

class Credentials {
  String userNumber, token;

  Credentials(this.userNumber, this.token);

  bool isEmpty() {
    return this.userNumber == '' || this.token == '';
  }
}