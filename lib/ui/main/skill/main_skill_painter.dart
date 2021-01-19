import 'package:flutter/material.dart';

class MainSkillPainter extends CustomPainter {
  const MainSkillPainter({
    required this.color,
    required this.value,
    required this.maxValue,
  });

  final Color color;
  final double value;
  final int maxValue;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width * (value / maxValue), 0),
      Paint()
        ..color = color
        ..strokeWidth = 8,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
