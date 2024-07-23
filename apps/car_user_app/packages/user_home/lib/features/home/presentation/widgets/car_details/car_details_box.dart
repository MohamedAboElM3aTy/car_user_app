import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/domain/car_model.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildLabel(
          context: context,
          label: '${car.speed} km/h',
        ),
        Expanded(child: Container()),
        _buildLabel(
          context: context,
          label: car.color,
        ),
        Expanded(child: Container()),
        _buildLabel(
          context: context,
          label: 'Location',
        ),
      ],
    );
  }
}

SizedBox _buildLabel({required BuildContext context, required String label}) {
  return SizedBox(
    height: 40.0,
    width: 100.0,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.backgroundColor,
      ),
      child: Center(
        child: Text(
          label,
          style: context.textTheme.labelSmall!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    ),
  );
}
