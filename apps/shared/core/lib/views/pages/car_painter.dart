import 'package:flutter/material.dart';

class CarPainter extends CustomPainter {
  final Color carColor;

  const CarPainter({required this.carColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = carColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.4)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(0, size.height * 0.8)
      ..close();

    final wheelPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final leftWheelCenter = Offset(size.width * 0.25, size.height * 0.8);
    final rightWheelCenter = Offset(size.width * 0.75, size.height * 0.8);

    canvas.drawPath(path, paint);
    canvas.drawCircle(leftWheelCenter, size.height * 0.1, wheelPaint);
    canvas.drawCircle(rightWheelCenter, size.height * 0.1, wheelPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
