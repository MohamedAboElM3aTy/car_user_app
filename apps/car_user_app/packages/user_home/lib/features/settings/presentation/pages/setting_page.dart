import 'package:auth/di/injection_container.dart';
import 'package:auth/presentation/cubit/logout_cubit.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/settings/presentation/widgets/account_header_widget.dart';
import 'package:user_home/features/settings/presentation/widgets/setting_list_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final LogoutCubit _logoutCubit;

  @override
  void initState() {
    _logoutCubit = getIt<LogoutCubit>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _logoutCubit,
        child: Stack(
          children: [
            const EllipticalContainer(),
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
                    AccountHeaderWidget(),
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
      ),
    );
  }
}
