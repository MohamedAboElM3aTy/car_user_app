import 'package:core/app/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.width = 150,
    this.height = 150,
    super.key,
  });
  
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 30.h,
              width: 30.w,
              child: CircularProgressIndicator(
                color: context.primaryColor,
              )),
          const SizedBox(height: 20),
          Text(
            'loading',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
