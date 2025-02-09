import 'dart:async';
import 'package:core/core.dart';
import 'package:core/views/pages/car_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.carColor});

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
      () async => await context.navigator.pushNamed(AppRoutes.onBoardingRoute),
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
          builder: (context, child) => Transform.translate(
            offset: Offset(_slideAnimation.value, 0),
            child: CustomPaint(
              size: Size(200.w, 100.h),
              painter: CarPainter(carColor: widget.carColor),
            ),
          ),
        ),
      ),
    );
  }
}
