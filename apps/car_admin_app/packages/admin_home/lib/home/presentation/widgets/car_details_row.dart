import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CarDetailsRow extends StatelessWidget {
  const CarDetailsRow({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildRow(
          context: context,
          iconPath: CupertinoIcons.color_filter,
          label: car.color,
        ),
        const Expanded(child: SizedBox()),
        _buildRow(
          context: context,
          iconPath: CupertinoIcons.speedometer,
          label: car.speed,
        ),
        const Expanded(child: SizedBox()),
        _buildRow(
          context: context,
          iconPath: Icons.calendar_today_outlined,
          label: car.year,
        ),
      ],
    );
  }
}

Row _buildRow({
  required IconData iconPath,
  required String label,
  required BuildContext context,
}) {
  return Row(
    children: [
      Icon(
        iconPath,
        size: 18.w,
        color: AppColors.whiteColor,
      ),
      const Gap(4),
      Text(
        label,
        style: context.textTheme.labelSmall!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    ],
  );
}
