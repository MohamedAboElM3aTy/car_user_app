import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolidHeartComponent extends StatelessWidget {
  const SolidHeartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.28,
      right: 25.w,
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.heartRedColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 1),
              ),
            ]),
        child: const Icon(
          FontAwesomeIcons.solidHeart,
          size: 25.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
