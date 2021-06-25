import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.shader = ui.Gradient.linear(
      ui.Offset(size.width, 0),
      ui.Offset(size.width, size.height),
      [Color(0xFF654ea3), Color(0xFFeaafc8)],
      [0, 1],
    );
    canvas.drawRect(ui.Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  // ignore: missing_return
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
