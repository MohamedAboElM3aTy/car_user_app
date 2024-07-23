import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/model/dummy_cars.dart';
import 'package:user_home/view/pages/car_details_screen.dart';
import 'package:user_home/view/widgets/car_category_list_view.dart';
import 'package:user_home/view/widgets/car_holder_container.dart';
import 'package:user_home/view/widgets/custom_app_bar.dart';
import 'package:user_home/view/widgets/elliptical_container.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const EllipticalContainer(),
        const CustomAppBar(),
        Positioned(
          top: context.screenHeight * 0.14,
          left: 25.0,
          right: 0.0,
          bottom: 0.0,
          child: Text(
            "Browse",
            style: context.textTheme.labelMedium!.copyWith(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const CarCategoryListView(),
        Positioned(
          top: context.screenHeight * 0.22,
          left: 25.0,
          right: 25.0,
          bottom: 0.0,
          child: Row(
            children: [
              Text(
                'Most Rented',
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                // TODO: to implement it
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.blackColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: context.screenHeight * 0.6,
          left: 25.0,
          right: 25.0,
          bottom: 0.0,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                4,
                (index) => InkWell(
                  onTap: () => context.navigator.push(
                    MaterialPageRoute(
                      builder: (_) => CarDetailsScreen(
                        car: dummyCars[index],
                      ),
                    ),
                  ),
                  child: CarHolderContainer(
                    car: dummyCars[index],
                  ),
                ),
              ).toList().addSeparator(const Gap(20)),
            ),
          ),
        ),
      ],
    );
  }
}
