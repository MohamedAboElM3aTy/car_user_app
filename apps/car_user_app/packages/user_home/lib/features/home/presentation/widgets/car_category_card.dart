import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/home/domain/car_category.dart';

class CarCategoryCard extends StatelessWidget {
  const CarCategoryCard({
    super.key,
    required this.carCategory,
  });

  final CarCategory carCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 0.0,
        bottom: 20.0,
        top: 0.0,
      ),
      child: Container(
        width: context.screenWidth * 0.4,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 8.0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: carCategory.circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  carCategory.carPicture,
                  width: 140,
                ),
              ],
            ),
            const Gap(15),
            Column(
              children: [
                Text(
                  carCategory.categoryName,
                  style: context.textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(8),
                Text(
                  carCategory.categoryHint,
                  style: context.textTheme.labelSmall!.copyWith(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
