import 'package:admin_home/home/presentation/widgets/car_container_description.dart';
import 'package:admin_home/home/presentation/widgets/car_details_row.dart';
import 'package:admin_home/home/presentation/widgets/edit_button.dart';
import 'package:admin_home/home/presentation/widgets/gradient_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarContainer extends StatelessWidget {
  const CarContainer({
    required this.car,
    super.key,
  });

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: context.screenHeight * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            // TODO: To review image height
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: car.imagePath,
                fit: BoxFit.fill,
                // width: double.infinity,
              ),
            ),
            const GradientContainer(),
            EditButton(car: car),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: InkWell(
                onTap: () => context.read<CarListCubit>().deleteCar(car.id),
                child: Icon(
                  Icons.delete,
                  color: context.seedColor.error,
                ),
              ),
            ),
            Positioned(
              bottom: 36.h,
              left: 10.w,
              right: 14.w,
              child: CarContainerDescription(car: car),
            ),
            Positioned(
              bottom: 26.h,
              left: 10.w,
              right: 14.w,
              child: Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 1,
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 10.w,
              right: 14.w,
              child: CarDetailsRow(car: car),
            ),
          ],
        ),
      ),
    );
  }
}
