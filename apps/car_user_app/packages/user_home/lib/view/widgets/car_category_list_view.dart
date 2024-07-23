import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:user_home/view/widgets/car_category_card.dart';

class CarCategoryListView extends StatelessWidget {
  const CarCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.28,
      left: 0.0,
      right: 0.0,
      bottom: context.screenHeight * 0.36,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            CarCategoryCard(
              carPicture: AppImages.camaroImage,
              categoryName: 'Camaro',
              categoryText: '245 cars',
              circleColor: AppColors.redCircleColor,
            ),
            CarCategoryCard(
              carPicture: AppImages.toyotaImage,
              categoryName: 'Toyota',
              categoryText: '808 cars',
              circleColor: AppColors.purpleCircleColor,
            ),
            CarCategoryCard(
              carPicture: AppImages.teslaImage,
              categoryName: 'Tesla',
              categoryText: '1250 cars',
              circleColor: AppColors.yellowCircleColor,
            ),
            CarCategoryCard(
              carPicture: AppImages.bmwImage,
              categoryName: 'BMW',
              categoryText: '189 cars',
              circleColor: AppColors.blueCircleColor,
            ),
            CarCategoryCard(
              carPicture: AppImages.chevroImage,
              categoryName: 'Chevrolet',
              categoryText: '2487 cars',
              circleColor: AppColors.redPurpleCircleColor,
            ),
          ],
        ),
      ),
    );
  }
}
