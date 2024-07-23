import 'package:core/app/services/app_service.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookNow extends StatelessWidget {
  const BookNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: AppButton(
          onPressed: () => AppServices.bookNowSheet(context: context),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          width: context.screenWidth * 0.9,
          label: 'Book Now',
        ),
      ),
    );
  }
}
