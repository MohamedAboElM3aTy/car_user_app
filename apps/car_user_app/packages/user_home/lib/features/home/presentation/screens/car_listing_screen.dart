import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/widgets/cars_available_list_view.dart';
import 'package:core/views/widgets/page_title.dart';

class CarListingScreen extends StatefulWidget {
  const CarListingScreen({super.key});

  @override
  State<CarListingScreen> createState() => _CarListingScreenState();
}

class _CarListingScreenState extends State<CarListingScreen> {
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
          CarsAvailableListView(
            height: context.screenHeight * 0.38,
          ),
        ],
      ),
    );
  }
}
