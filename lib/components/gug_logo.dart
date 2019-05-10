import 'package:flutter/material.dart';

class GUGLogo extends StatelessWidget {
  final double height;

  GUGLogo({Key key, this.height = 30.0});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/gug_logo.png"),
      height: height,
    );
  }
}
