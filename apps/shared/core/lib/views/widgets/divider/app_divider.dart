import 'package:core/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 8.h,
      thickness: 8.h,
      color: AppColors.backgroundColor,
    );
  }
}
