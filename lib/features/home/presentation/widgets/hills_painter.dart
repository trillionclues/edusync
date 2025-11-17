import 'package:flutter/material.dart';

class HillsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backHillPaint = Paint()
      ..color = const Color(0xFF6B9D7A)
      ..style = PaintingStyle.fill;

    final backHillPath = Path();
    backHillPath.moveTo(0, size.height * 0.4);
    backHillPath.quadraticBezierTo(
      size.width * 0.25, size.height * 0.25,
      size.width * 0.5, size.height * 0.35,
    );
    backHillPath.quadraticBezierTo(
      size.width * 0.75, size.height * 0.45,
      size.width, size.height * 0.3,
    );
    backHillPath.lineTo(size.width, size.height);
    backHillPath.lineTo(0, size.height);
    backHillPath.close();

    canvas.drawPath(backHillPath, backHillPaint);

    final midHillPaint = Paint()
      ..color = const Color(0xFF7FB892)
      ..style = PaintingStyle.fill;

    final midHillPath = Path();
    midHillPath.moveTo(0, size.height * 0.5);
    midHillPath.quadraticBezierTo(
      size.width * 0.3, size.height * 0.35,
      size.width * 0.6, size.height * 0.45,
    );
    midHillPath.quadraticBezierTo(
      size.width * 0.8, size.height * 0.5,
      size.width, size.height * 0.4,
    );
    midHillPath.lineTo(size.width, size.height);
    midHillPath.lineTo(0, size.height);
    midHillPath.close();

    canvas.drawPath(midHillPath, midHillPaint);

    final frontGrassPaint = Paint()
      ..color = const Color(0xFF92D3A7)
      ..style = PaintingStyle.fill;

    final frontGrassPath = Path();
    frontGrassPath.moveTo(0, size.height * 0.6);
    frontGrassPath.quadraticBezierTo(
      size.width * 0.4, size.height * 0.5,
      size.width * 0.7, size.height * 0.55,
    );
    frontGrassPath.quadraticBezierTo(
      size.width * 0.85, size.height * 0.58,
      size.width, size.height * 0.5,
    );
    frontGrassPath.lineTo(size.width, size.height);
    frontGrassPath.lineTo(0, size.height);
    frontGrassPath.close();

    canvas.drawPath(frontGrassPath, frontGrassPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}