import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CarHolderContainer extends StatelessWidget {
  const CarHolderContainer({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: context.screenHeight * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CachedNetworkImage(
              imageUrl: car.imagePath,
              width: 100.w,
              height: context.screenHeight,
              fit: BoxFit.fill,
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Model ${car.year}',
                style: context.textTheme.labelLarge!.copyWith(
                  color: AppColors.secondText,
                  fontSize: 13.sp,
                ),
              ),
              const Gap(10),
              Text(
                car.modelName,
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.mainTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${car.speed} km/h',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    car.color,
                    style: context.textTheme.labelMedium!.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    '\$${car.price}/Day',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
