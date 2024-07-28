import '../widgets/add_car_form.dart';
import '../widgets/car_container.dart';
import 'package:core/app/services/app_service.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/bottom_sheet_label.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarListCubit()..fetchCars(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CarListCubit, CarListState>(
      listenWhen: (previous, current) =>
          previous.isDeleted != current.isDeleted,
      listener: (context, state) {
        if (state.isDeleted) {
          context.showSnackBar(
            message: 'Car deleted successfully',
            state: SnackBarStates.success,
          );
          context.read<CarListCubit>().fetchCars();
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
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
                    const AddCarForm(carModel: null),
                  ],
                ),
              ),
            );
            if (result == true) {
              context.read<CarListCubit>().fetchCars();
            }
          },
          backgroundColor: context.primaryColor,
          elevation: 0,
          label: Text(
            'Add Car',
            style: context.textTheme.labelLarge!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            EllipticalContainer(bottom: context.screenHeight * 0.7),
            Positioned(
              top: context.screenHeight * 0.13,
              left: 25.0,
              right: 0.0,
              bottom: 0.0,
              child: const PageTitle(title: 'Dashboard'),
            ),
            BlocBuilder<CarListCubit, CarListState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Positioned(
                    top: context.screenHeight * 0.23,
                    left: 0.0,
                    bottom: 0,
                    right: 0.0,
                    child: const ContainerShimmer(),
                  );
                } else if (state.failure != null) {
                  return Text(
                    'Error: ${state.error.toString()}',
                  );
                } else if (state.cars.isNotEmpty) {
                  return Positioned(
                    top: context.screenHeight * 0.23,
                    left: 0.0,
                    bottom: 0,
                    right: 0.0,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: state.cars.length,
                      itemBuilder: (ctx, index) => CarContainer(
                        car: state.cars[index],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: EmptyScreen(
                    message: 'No Cars Added For Rent Yet',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
