import 'package:core/app/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetLabel extends StatelessWidget {
  const BottomSheetLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 3),
        Text(
          label,
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
    );
  }
}
