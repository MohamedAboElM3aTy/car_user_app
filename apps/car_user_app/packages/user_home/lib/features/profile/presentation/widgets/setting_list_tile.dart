import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(
        label,
        style: context.textTheme.labelMedium!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w200,
        ),
      ),
      minLeadingWidth: 0,
      leading: icon == null
          ? null
          : Icon(
              icon,
              size: 30,
              color: context.primaryColor,
            ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: context.primaryColor,
        size: 20,
      ),
    );
  }
}
