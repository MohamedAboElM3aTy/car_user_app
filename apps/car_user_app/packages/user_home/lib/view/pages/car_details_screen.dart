import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/model/car_model.dart';
import 'package:user_home/view/widgets/car_details/build_label.dart';
import 'package:user_home/view/widgets/car_details/car_details_box.dart';
import 'package:user_home/view/widgets/car_details/model_with_price_row.dart';
import 'package:user_home/view/widgets/car_details/solid_heart_component.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  final CarModel car;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: context.screenHeight * 0.65,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset(
                AppImages.onBoardingImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30.h,
            left: 20.w,
            child: const CommonCloseButton(),
          ),
          Positioned(
            top: context.screenHeight * 0.32,
            left: 0.0,
            right: 0.0,
            bottom: context.screenHeight * 0.14,
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: AppColors.whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildLabel(
                    label: widget.car.year,
                    fontSize: 16.sp,
                    verticalPadding: 20.h,
                    horizontalPadding: 25.w,
                    labelColor: AppColors.secondText,
                  ),
                  const Gap(10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ModelWithPriceRow(car: widget.car),
                  ),
                  const Gap(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: DetailsBox(car: widget.car),
                  ),
                  const Gap(20),
                  const BuildLabel(label: 'Corolla'),
                  const Gap(20),
                  BuildLabel(
                    label:
                        """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                    labelHeight: 1.5,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  const Gap(20),
                  const BuildLabel(label: 'Details'),
                  const Gap(20),
                  BuildLabel(
                    label:
                        """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                    labelHeight: 1.5,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ),
          const SolidHeartComponent(),
          Positioned(
            bottom: 30.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                width: context.screenWidth * 0.9,
                label: 'Book Now',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
