import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/utils/token_file.dart';
import 'package:devfest_mobile_app/components/decide_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Config.colorPalette,
        brightness: Brightness.dark,
        accentColor: Color(0xFFFFFFFFFF),
      ),
      home: FutureBuilder(
        builder: (context, projectSnap) {
          if (projectSnap.data == null) {
            return LoadingScreen();
          } else if (projectSnap.data.isEmpty()) {
            return StartScreen();
          } else {
            return DecideAuth(projectSnap.data);
          }
        },
        future: TokenFile.readToken(),
      ),
    );
  }
}
