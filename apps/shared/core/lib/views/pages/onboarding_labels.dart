import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoardingLabels extends StatelessWidget {
  const OnBoardingLabels({
    required this.currentPage,
    super.key,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentPage == 0
              ? 'Welcome To our car \nrental app!'
              : 'Find the perfect car\nfor your needs.',
          style: context.textTheme.labelLarge!.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: context.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Text(
          currentPage == 0
              ? 'Here you can browse\nand book a wide selection of \nvehicles'
              : 'Choose from a variety of\nmakes and models',
          style: context.textTheme.labelLarge!.copyWith(
            fontSize: 16.sp,
            color: context.primaryColor,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );
  }
}
