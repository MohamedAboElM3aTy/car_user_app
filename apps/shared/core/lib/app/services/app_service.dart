import 'package:core/app/constants/app_colors.dart';
import 'package:core/app/extensions/context.dart';
import 'package:core/app/extensions/double.dart';
import 'package:core/views/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/widgets/filter_date_sheet.dart';

class AppServices {
  const AppServices._();

  static Future<T?> showDefaultModalSheet<T>({
    required BuildContext context,
    required bool isDismissible,
    required bool isScrollable,
    required Widget child,
    bool expand = false,
    bool useSafeArea = false,
    Color backgroundColor = const Color(0xffF1F1F1),
  }) async =>
      showModalBottomSheet(
        context: context,
        backgroundColor: backgroundColor,
        barrierColor: Colors.black.withOpacity(0.5),
        enableDrag: isDismissible,
        isDismissible: isDismissible,
        isScrollControlled: true,
        useSafeArea: useSafeArea,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) => isScrollable
            ? SingleChildScrollView(
                child: SafeArea(
                  bottom: false,
                  child: child,
                ),
              )
            : child,
      );

  static Future<void> bookNowSheet({required BuildContext context}) async {
    return AppServices.showDefaultModalSheet(
      context: context,
      isDismissible: true,
      isScrollable: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SizedBox(
          height: context.screenHeight * 0.6,
          width: context.screenWidth,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(flex: 3),
                  Text(
                    'Book Now',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(flex: 2),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: Color(0xFF27272A),
                    ),
                    onPressed: () => context.navigator.pop(),
                  ),
                ],
              ),
              const Divider(color: AppColors.divider),
              const FilterDateSheet(),
              const Spacer(),
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                onPressed: () {},
                label: 'Book',
                width: context.screenWidth * 0.9,
              ),
              20.emptyHeight,
            ],
          ),
        ),
      ),
    );
  }
}
