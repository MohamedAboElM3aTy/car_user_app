import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/home/presentation/widgets/cars_available_list_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        centerTitle: true,
        title: Text(
          'Search Page',
          style: context.textTheme.titleLarge!.copyWith(
            fontSize: 16.sp,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CarListCubit()..fetchCars(searchText: ''),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          RoundedTextField(
            controller: _searchController,
            validator: (car) {
              if (car == null || car.isEmpty) {
                return 'Please enter a car name';
              }
              return null;
            },
            hintText: 'Search For Cars',
            icon: Icons.search,
            changed: (car) {
              context.read<CarListCubit>().fetchCars(searchText: car);
            },
          ),
          const Gap(10),
          const CarsAvailableListView(isSearch: true),
        ],
      ),
    );
  }
}
