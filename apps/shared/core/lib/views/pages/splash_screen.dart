import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.carColor,
  });

  final Color carColor;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    Timer(
      const Duration(seconds: 6),
      () async {
        await context.navigator.pushNamed(AppRoutes.onBoardingRoute);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_slideAnimation.value, 0),
              child: CustomPaint(
                size: Size(200.w, 100.h),
                painter: CarPainter(
                  carColor: widget.carColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
