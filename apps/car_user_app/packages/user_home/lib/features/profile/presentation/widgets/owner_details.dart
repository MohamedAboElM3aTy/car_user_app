import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({super.key});

  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.onBoardingImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        10.w.horizontalSpace,
        BlocBuilder<HydratedAuthCubit, HydratedAuthState>(
          builder: (context, state) {
            if (state.isAuthenticated) {
              final fullName =
                  "${state.user?.firstName} ${state.user?.lastName}";
              return Text(
                fullName,
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w200,
                  color: context.seedColor.secondary,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
