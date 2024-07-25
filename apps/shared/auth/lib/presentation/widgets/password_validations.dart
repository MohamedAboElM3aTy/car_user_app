import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildValidationRow(
            'At least 1 lower Case letter',
            hasLowerCase,
            context,
          ),
          3.emptyHeight,
          buildValidationRow(
            'At least 1 upper Case letter',
            hasUpperCase,
            context,
          ),
          3.emptyHeight,
          buildValidationRow(
            'At least 1 special character',
            hasSpecialCharacters,
            context,
          ),
        ],
      ),
    );
  }

  Widget buildValidationRow(
    String text,
    bool hasValidated,
    BuildContext context,
  ) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: Colors.grey,
        ),
        const Gap(10),
        Text(
          text,
          style: context.textTheme.labelMedium!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.whiteColor : context.primaryColor,
          ),
        )
      ],
    );
  }
}
