import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildLabel extends StatelessWidget {
  const BuildLabel({
    super.key,
    required this.label,
    this.horizontalPadding,
    this.verticalPadding,
    this.fontSize,
    this.fontWeight,
    this.labelHeight,
    this.labelColor,
  });

  final String label;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? fontSize;
  final double? labelHeight;
  final FontWeight? fontWeight;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 10.w,
        vertical: verticalPadding ?? 0.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: context.textTheme.labelLarge!.copyWith(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize ?? 20.sp,
            color: labelColor ?? AppColors.mainTextColor,
            height: labelHeight,
          ),
        ),
      ),
    );
  }
}
