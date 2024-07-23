import 'package:core/core.dart';
import 'package:core/views/widgets/divider/build_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: context.screenWidth * 0.8,
      child: Row(
        children: [
          const BuildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Or',
              style: context.textTheme.labelSmall?.copyWith(
                color: AppColors.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const BuildDivider(),
        ],
      ),
    );
  }
}
