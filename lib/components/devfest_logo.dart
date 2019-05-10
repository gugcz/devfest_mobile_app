import 'package:flutter/material.dart';

class DevFestLogo extends StatelessWidget {
  final double height;

  DevFestLogo({Key key, this.height = 96.0});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/devfest2019_logo.png"),
      height: height,
    );
  }
}
