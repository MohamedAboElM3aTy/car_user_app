import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({super.key});

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  late final DateRangePickerController _dateController;

  @override
  void initState() {
    _dateController = DateRangePickerController();
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.5,
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.4,
            child: SfDateRangePicker(
              headerHeight: 50.h,
              controller: _dateController,
              backgroundColor: AppColors.whiteColor,
              rangeSelectionColor: context.primaryColor,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              showNavigationArrow: true,
              view: DateRangePickerView.month,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),
              selectionMode: DateRangePickerSelectionMode.range,
            ),
          ),
          15.emptyHeight,
          AppButton(
            label: 'Done',
            width: context.screenWidth * 0.9,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            onPressed: () {
              Navigator.pop(context, _dateController.selectedRange);
            },
          ),
        ],
      ),
    );
  }
}
