import 'package:flutter/material.dart';

class TopicCircle extends CustomPainter {
  Paint _paint;

  TopicCircle(MaterialColor color) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
     canvas.drawCircle(Offset(0.0, 0.0), 4.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}