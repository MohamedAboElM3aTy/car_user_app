import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/screens/search_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.07,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              CupertinoIcons.bell,
              color: Colors.white,
            ),
            InkWell(
              onTap: () => context.navigator.push(
                MaterialPageRoute(
                  builder: (_) => const SearchPage(),
                ),
              ),
              child: const Icon(
                CupertinoIcons.search,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
