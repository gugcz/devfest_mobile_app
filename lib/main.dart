import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Config.colorPalette,
      ),
      home: StartScreen(),
    );
  }
}
