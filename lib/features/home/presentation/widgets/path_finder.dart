import 'package:flutter/material.dart';
import 'package:glypha/features/home/data/model/level_data.dart';

class PathPainter extends CustomPainter {
  final List<LevelData> levels;
  final double screenWidth;

  PathPainter(this.levels, this.screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final grayPaint = Paint()
      ..color = const Color(0xFFD1B899).withOpacity(0.6)
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final grayPath = Path();

    for (int i = 0; i < levels.length; i++) {
      final level = levels[i];
      final x = screenWidth * level.xPosition;
      final y = (levels.length - i) * 180.0 + 90;

      if (i == 0) {
        grayPath.moveTo(x, y);
      } else {
        final prevLevel = levels[i - 1];
        final prevX = screenWidth * prevLevel.xPosition;
        final prevY = (levels.length - (i - 1)) * 180.0 + 90;

        final controlX = (x + prevX) / 2;
        final controlY = (y + prevY) / 2 - 40;

        grayPath.quadraticBezierTo(controlX, controlY, x, y);
      }
    }

    canvas.drawPath(grayPath, grayPaint);

    final coloredPaint = Paint()
      ..color = const Color(0xFF8B7355)
      ..strokeWidth = 32
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final coloredPath = Path();
    bool hasStarted = false;

    for (int i = 0; i < levels.length; i++) {
      if (!levels[i].isCompleted) break;

      final level = levels[i];
      final x = screenWidth * level.xPosition;
      final y = (levels.length - i) * 180.0 + 90;

      if (!hasStarted) {
        coloredPath.moveTo(x, y);
        hasStarted = true;
      } else {
        final prevLevel = levels[i - 1];
        final prevX = screenWidth * prevLevel.xPosition;
        final prevY = (levels.length - (i - 1)) * 180.0 + 90;

        final controlX = (x + prevX) / 2;
        final controlY = (y + prevY) / 2 - 40;

        coloredPath.quadraticBezierTo(controlX, controlY, x, y);
      }
    }

    canvas.drawPath(coloredPath, coloredPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}