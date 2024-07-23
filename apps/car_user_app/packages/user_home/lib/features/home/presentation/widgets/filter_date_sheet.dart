import 'package:core/app/services/app_service.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_home/features/home/presentation/widgets/date_bottom_sheet.dart';

class FilterDateSheet extends StatefulWidget {
  const FilterDateSheet({super.key});

  @override
  State<FilterDateSheet> createState() => _FilterDateSheetState();
}

class _FilterDateSheetState extends State<FilterDateSheet> {
  PickerDateRange? _dateRange;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Date',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainTextColor,
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildColumn(
              context: context,
              label: 'From',
              hintText: 'Start Date',
              onTap: () async {
                final startDateResult =
                    await AppServices.showDefaultModalSheet<PickerDateRange?>(
                  context: context,
                  isDismissible: true,
                  isScrollable: true,
                  child: const DateBottomSheet(),
                );
                if (startDateResult != null) {
                  setState(() => _dateRange = startDateResult);
                }
              },
            ),
            _buildColumn(
              context: context,
              label: 'To',
              hintText: 'End Date',
              onTap: () async {
                final endDateResult =
                    await AppServices.showDefaultModalSheet<PickerDateRange?>(
                  context: context,
                  isDismissible: true,
                  isScrollable: true,
                  child: const DateBottomSheet(),
                );
                if (endDateResult != null) {
                  setState(() => _dateRange = endDateResult);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _buildColumn({
    required BuildContext context,
    required String label,
    required String hintText,
    required void Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.titleLarge?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainTextColor,
          ),
        ),
        10.emptyHeight,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: context.screenWidth * 0.4,
          height: context.screenHeight * 0.05,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextField(
            onTap: onTap,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
