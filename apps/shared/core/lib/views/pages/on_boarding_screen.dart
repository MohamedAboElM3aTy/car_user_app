import 'package:core/core.dart';
import 'package:core/views/pages/onboarding_labels.dart';
import 'package:core/views/widgets/onboarding/custom_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          OnBoardingLabels(currentPage: _currentPage),
          Positioned(
            bottom: 60.h,
            left: 10.w,
            child: CustomizedDotsIndicator(
              currentPage: _currentPage,
              dotsCount: 2,
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 15.w,
            child: InkWell(
              onTap: () => context.navigator.pushNamed(AppRoutes.authRoute),
              child: Text(
                'Skip',
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: context.primaryColor,
                ),
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (pageNumber) {
              setState(() => _currentPage = pageNumber);
              if (pageNumber == 1) {
                context.navigator.pushNamed(AppRoutes.authRoute);
              }
            },
            children: [
              Center(
                child: Image.asset(
                  AppImages.carSet,
                  fit: BoxFit.cover,
                  width: 300.w,
                ),
              ),
              Center(
                child: Image.asset(
                  AppImages.manWithCar,
                  fit: BoxFit.cover,
                  width: 300.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
