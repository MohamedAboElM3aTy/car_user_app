import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          context.textTheme.labelMedium!.copyWith(
            fontSize: 32.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
