import 'package:flutter/material.dart';

class GUGLogo extends StatelessWidget {
  final double height;
  final double opacity;

  GUGLogo({Key key, this.height = 30.0, this.opacity = 1.0});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image(
        image: AssetImage("assets/gug_logo.png"),
        height: height,
      ),
    );
  }
}
