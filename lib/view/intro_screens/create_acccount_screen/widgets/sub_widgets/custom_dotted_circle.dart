import 'package:fizz/app_imports.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2.1;
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5
      ..style = PaintingStyle.fill;

    const double gapSize = 10; // Gap between dots
    double dotSize = 1.sp; // Size of each dot
    final int numDots = 360 ~/ (dotSize + gapSize); // Number of dots

    for (int i = 0; i < numDots; i++) {
      final double angle = 2 * pi * i / numDots;
      final double dx = radius * cos(angle) + size.width / 2;
      final double dy = radius * sin(angle) + size.height / 2;
      canvas.drawCircle(Offset(dx, dy), dotSize / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
