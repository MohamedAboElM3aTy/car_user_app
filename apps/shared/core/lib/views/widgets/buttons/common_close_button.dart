import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonCloseButton extends StatelessWidget {
  const CommonCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigator.pop(),
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: context.primaryColor,
        child: const Icon(
          Icons.close,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
