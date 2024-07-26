import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/profile/presentation/widgets/account_header_widget.dart';
import 'package:user_home/features/profile/presentation/widgets/setting_list_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          EllipticalContainer(
            bottom: context.screenHeight * 0.7,
          ),
          Positioned(
            top: context.screenHeight * 0.12,
            left: 25.0,
            right: 0.0,
            bottom: 0.0,
            child: const PageTitle(title: 'Profile'),
          ),
          Positioned(
            top: context.screenHeight * 0.26,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Column(
                children: [
                  AccountHeaderWidget(isAdmin: false),
                  Gap(10),
                  Divider(),
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.35,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingListTile(
                    label: 'Edit Profile',
                    icon: Icons.edit,
                    onPressed: () {},
                  ),
                  SettingListTile(
                    label: 'Booking History',
                    icon: Icons.history,
                    onPressed: () => context.navigator.pushNamed(
                      AppRoutes.userBookingHistoryRoute,
                    ),
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
