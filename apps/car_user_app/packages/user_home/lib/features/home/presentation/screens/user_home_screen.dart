import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/widgets/car_category_list_view.dart';
import 'package:user_home/features/home/presentation/widgets/cars_available_list_view.dart';
import 'package:user_home/features/home/presentation/widgets/custom_app_bar.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarListCubit()..fetchCars(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EllipticalContainer(
          bottom: context.screenHeight * 0.7,
        ),
        const CustomAppBar(),
        Positioned(
          top: context.screenHeight * 0.14,
          left: 25.0,
          right: 0.0,
          bottom: 0.0,
          child: const PageTitle(title: 'Browse'),
        ),
        const CarCategoryListView(),
        Positioned(
          top: context.screenHeight * 0.25,
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
                onTap: () => context.navigator.pushNamed(
                  AppRoutes.userCarListingRoute,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.blackColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
        const CarsAvailableListView(),
      ],
    );
  }
}
