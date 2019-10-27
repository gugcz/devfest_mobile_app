import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/main_screen.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:devfest_mobile_app/utils/token_file.dart';
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
          if (projectSnap.connectionState == ConnectionState.none && projectSnap.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          } else if (projectSnap.data.userNumber == '' && projectSnap.data.token == '') {
            return StartScreen();
          } else {
            return MainScreen();
          }
        },
        future: TokenFile.readToken(),
      ),
    );
  }
}
