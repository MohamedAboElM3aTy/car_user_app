import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/home/domain/car_model.dart';

class CarHolderContainer extends StatelessWidget {
  const CarHolderContainer({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100.h,
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
            child: Image.asset(
              car.imagePath,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.year,
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
                    '\$${car.price}',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  size: 20.0,
                  color: AppColors.heartGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
