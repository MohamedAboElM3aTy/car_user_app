import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/widgets/page_title.dart';
import 'package:user_home/features/home/presentation/widgets/cars_available_list_view.dart';
import 'package:user_home/features/home/presentation/widgets/elliptical_container.dart';

class CarListingScreen extends StatelessWidget {
  const CarListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const EllipticalContainer(),
          Positioned(
            top: context.screenHeight * 0.15,
            left: 25.0,
            right: 0.0,
            bottom: 0.0,
            child: const PageTitle(title: 'Available Cars'),
          ),
          Positioned(
            top: 30.h,
            left: 20.w,
            child: CommonCloseButton(
              backgroundColor: context.seedColor.secondary,
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.38,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const SingleChildScrollView(
                child: CarsAvailableListView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
