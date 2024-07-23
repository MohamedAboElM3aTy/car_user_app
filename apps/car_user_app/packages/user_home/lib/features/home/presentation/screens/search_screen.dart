import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_home/features/home/presentation/widgets/elliptical_container.dart';
import 'package:user_home/features/home/presentation/widgets/page_title.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    return Scaffold(
      body: Stack(
        children: [
          const EllipticalContainer(),
          Positioned(
            top: context.screenHeight * 0.12,
            left: 25.0,
            right: 0.0,
            bottom: 0.0,
            child: const PageTitle(title: 'Search Page'),
          ),
          Positioned(
            top: 30.h,
            left: 20.w,
            child: CommonCloseButton(
              backgroundColor: context.seedColor.secondary,
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.36,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  RoundedTextField(
                    controller: _searchController,
                    changed: (car) => _searchController.text = car,
                    validator: (car) {
                      if (car == null || car.isEmpty) {
                        return 'Please enter car model';
                      }
                      return null;
                    },
                    hintText: 'Search',
                    icon: Icons.search,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
