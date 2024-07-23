import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/domain/car_model.dart';

class ModelWithPriceRow extends StatelessWidget {
  const ModelWithPriceRow({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          car.modelName,
          style: context.textTheme.labelMedium!.copyWith(
            fontSize: 24.sp,
            color: AppColors.mainTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),
        Text(
          '\$${car.price}',
          style: context.textTheme.labelMedium!.copyWith(
            fontSize: 21.sp,
            color: AppColors.mainTextColor,
          ),
        ),
      ],
    );
  }
}
