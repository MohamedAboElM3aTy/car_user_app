import 'package:auth/presentation/cubit/get_profile_cubit/get_profile_data_cubit.dart';
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
  void initState() {
    super.initState();
  }

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
        BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Text('Un Named User'),
              error: (message) => Text(message),
              success: (user) {
                final fullName = user.userMetadata!['firstName'] +
                    ' ' +
                    user.userMetadata!['lastName'];
                return Text(
                  fullName,
                  style: context.textTheme.labelLarge!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w200,
                    color: context.seedColor.secondary,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
