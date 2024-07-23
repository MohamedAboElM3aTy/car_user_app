import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordRequirements extends StatelessWidget {
  const PasswordRequirements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  Password Must have 1 Capital letter',
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          3.emptyHeight,
          Text(
            '•  Password Must have 1 Small letter',
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          3.emptyHeight,
          Text(
            '•  Password Must have 1 special Character',
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
