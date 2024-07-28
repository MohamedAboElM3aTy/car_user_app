import 'add_car_form.dart';
import 'package:core/app/services/app_service.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/bottom_sheet_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 10.w,
      child: InkWell(
        onTap: () async {
          final result = await AppServices.showDefaultModalSheet(
            context: context,
            isDismissible: true,
            isScrollable: false,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomSheetLabel(label: 'Add Car'),
                  const Divider(color: AppColors.divider),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'Enter Car Details:',
                      style: context.textTheme.labelLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  const Gap(10),
                  AddCarForm(carModel: car),
                ],
              ),
            ),
          );
          if (result == true) {
            context.read<CarListCubit>().fetchCars();
          }
        },
        child: Icon(
          Icons.edit,
          color: context.seedColor.primary,
        ),
      ),
    );
  }
}
