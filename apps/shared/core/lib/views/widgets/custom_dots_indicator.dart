import 'package:core/core.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedDotsIndicator extends StatelessWidget {
  const CustomizedDotsIndicator({
    required this.currentPage,
    required this.dotsCount,
    super.key,
  });

  final int currentPage;
  final int dotsCount;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: currentPage,
      decorator: DotsDecorator(
        activeColor: context.primaryColor,
        size: const Size(30, 8),
        activeSize: const Size(50, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
