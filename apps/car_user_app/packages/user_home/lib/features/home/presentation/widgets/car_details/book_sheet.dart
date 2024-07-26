import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/bottom_sheet_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_home/features/home/data/models/request/book_request_model.dart';
import 'package:user_home/features/home/presentation/widgets/filter_date_sheet.dart';

class BookSheet extends StatefulWidget {
  const BookSheet({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  State<BookSheet> createState() => _BookSheetState();
}

class _BookSheetState extends State<BookSheet> {
  PickerDateRange? _dateRange;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              height: context.screenHeight * 0.4,
              width: context.screenWidth,
              child: Column(
                children: [
                  const BottomSheetLabel(label: 'Book Now'),
                  const Divider(color: AppColors.divider),
                  FilterDateSheet(
                    onDateRangeSelected: (dateRange) {
                      if (dateRange != null) {
                        setState(() => _dateRange = dateRange);
                      }
                    },
                  ),
                  const Spacer(),
                  BlocListener<BookCubit, BookState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        loaded: () {
                          context.showSnackBar(
                            message: 'Car Booked Successfully',
                            state: SnackBarStates.success,
                          );
                          context.navigator.maybePop(true);
                        },
                        error: (message) {
                          context.showSnackBar(
                            message: 'Can\'t book this Date',
                            state: SnackBarStates.error,
                          );
                        },
                      );
                    },
                    child: AppButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      label: 'Book',
                      width: context.screenWidth * 0.9,
                      onPressed: () {
                        if (_dateRange != null) {
                          context.read<BookCubit>().makeBook(
                                BookRequestModel(
                                  carId: widget.car.id,
                                  startDate: _dateRange!.startDate!,
                                  endDate: _dateRange!.endDate!,
                                  userId: context
                                      .read<AuthCubit>()
                                      .state
                                      .user!
                                      .userId,
                                ),
                              );
                        }
                      },
                    ),
                  ),
                  20.emptyHeight,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
