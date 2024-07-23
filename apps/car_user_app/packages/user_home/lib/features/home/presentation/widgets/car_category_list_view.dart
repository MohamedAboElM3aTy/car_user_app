import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:user_home/features/home/data/dummy_car_categories.dart';
import 'package:user_home/features/home/presentation/widgets/car_category_card.dart';

class CarCategoryListView extends StatelessWidget {
  const CarCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.28,
      left: 0.0,
      right: 0.0,
      bottom: context.screenHeight * 0.36,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            carCategories.length,
            (index) => CarCategoryCard(
              carCategory: carCategories[index],
            ),
          ).toList(),
        ),
      ),
    );
  }
}
