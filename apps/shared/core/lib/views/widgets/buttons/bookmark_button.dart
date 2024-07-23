import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor: AppColors.basicBorderColor,
      child: Icon(
        Icons.bookmark_border_outlined,
        size: 24.sp,
        color: AppColors.whiteColor,
      ),
    );
  }
}
