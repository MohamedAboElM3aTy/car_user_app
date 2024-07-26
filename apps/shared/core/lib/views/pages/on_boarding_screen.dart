import 'package:core/core.dart';
import 'package:core/views/pages/onboarding_labels.dart';
import 'package:core/views/widgets/custom_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: OnBoardingLabels(currentPage: _currentPage)),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (pageNumber) {
                    setState(() => _currentPage = pageNumber);
                  },
                  children: [
                    Image.asset(
                      AppImages.carSet,
                      width: context.screenWidth * 0.5,
                    ),
                    Image.asset(
                      AppImages.manWithCar,
                      width: context.screenWidth * 0.5,
                      height: context.screenWidth * 0.4,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomizedDotsIndicator(
                      currentPage: _currentPage,
                      dotsCount: 2,
                    ),
                    const Gap(3),
                    InkWell(
                      onTap: () => context.navigator.pushNamed(
                        AppRoutes.authRoute,
                      ),
                      child: Text(
                        _currentPage == 0 ? 'Skip' : 'Start',
                        style: context.textTheme.labelSmall!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: context.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
