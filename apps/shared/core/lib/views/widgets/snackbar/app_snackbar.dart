import 'package:core/core.dart';
import 'package:core/app/enums/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar extends StatelessWidget {
  const AppSnackBar({super.key, required this.message, required this.state});

  final String message;
  final SnackBarStates state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: _generateSnackBarColor(state),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: _generateSnackBarIconBGColor(state),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FittedBox(
              child: Icon(
                _generateSnackBarIcons(state),
                color: Colors.white,
              ),
            ),
          ),
          12.emptyWidth,
          Expanded(
            child: Text(
              message,
              style: context.textTheme.labelSmall?.copyWith(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _generateSnackBarIcons(SnackBarStates states) {
    switch (states) {
      case SnackBarStates.idle:
        return Icons.info_rounded;
      case SnackBarStates.success:
        return Icons.check_circle;
      case SnackBarStates.error:
        return Icons.cancel;
      case SnackBarStates.warning:
        return Icons.warning_rounded;
      case SnackBarStates.noInternet:
        return Icons.wifi_off_rounded;
    }
  }

  Color _generateSnackBarColor(SnackBarStates states) {
    switch (states) {
      case SnackBarStates.idle:
        return AppColors.lightAccentColor;
      case SnackBarStates.success:
        return AppColors.lightSuccessColor;
      case SnackBarStates.noInternet:
      case SnackBarStates.error:
        return AppColors.lightError;
      case SnackBarStates.warning:
        return AppColors.lightWarningColor;
    }
  }

  Color _generateSnackBarIconBGColor(SnackBarStates states) {
    switch (states) {
      case SnackBarStates.idle:
        return AppColors.accentColor;
      case SnackBarStates.success:
        return AppColors.successColor;
      case SnackBarStates.noInternet:
      case SnackBarStates.error:
        return AppColors.error;
      case SnackBarStates.warning:
        return AppColors.warningColor;
    }
  }
}
