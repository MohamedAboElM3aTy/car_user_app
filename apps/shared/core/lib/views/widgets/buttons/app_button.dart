import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isPrimary = true,
    this.width,
    this.child,
    this.iconSpace,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius = 14,
    this.padding = const EdgeInsets.all(18),
    this.hasSide = true,
    this.borderColor,
    this.isLoading = false,
    this.height,
  });

  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool isPrimary;
  final Widget? child;
  final double? iconSpace;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;
  final bool hasSide;
  final Color? borderColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: hasSide
                ? BorderSide(
                    color: onPressed != null && !isLoading
                        ? borderColor ?? backgroundColor ?? context.primaryColor
                        : AppColors.lightSecondaryColor,
                    width: 2,
                  )
                : BorderSide.none,
          ),
          backgroundColor: backgroundColor ??
              (isPrimary ? context.primaryColor : Colors.transparent),
          padding: padding,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: AppColors.lightSecondaryColor,
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 40,
                  child: Lottie.asset(
                    AppLottie.loadingLottie,
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (child != null) ...[
                    child!,
                    SizedBox(width: iconSpace ?? 4),
                  ],
                  Text(
                    label,
                    style: textStyle ??
                        context.textTheme.labelSmall?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: onPressed == null
                              ? Colors.grey[400]
                              : isPrimary
                                  ? Colors.white
                                  : context.primaryColor,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
