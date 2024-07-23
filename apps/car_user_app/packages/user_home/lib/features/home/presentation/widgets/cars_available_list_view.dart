import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/home/data/dummy_cars.dart';
import 'package:user_home/features/home/presentation/screens/car_details_screen.dart';
import 'package:user_home/features/home/presentation/widgets/car_holder_container.dart';

class CarsAvailableListView extends StatelessWidget {
  const CarsAvailableListView({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height ?? context.screenHeight * 0.6,
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
    );
  }
}
