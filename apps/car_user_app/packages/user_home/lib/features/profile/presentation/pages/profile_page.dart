import 'package:auth/di/injection_container.dart';
import 'package:auth/presentation/cubit/get_profile_cubit/get_profile_data_cubit.dart';
import 'package:auth/presentation/cubit/logout_cubit.dart';
import 'package:core/core.dart';
import 'package:core/views/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final LogoutCubit _logoutCubit;
  late final GetProfileDataCubit _getProfileDataCubit;

  @override
  void initState() {
    _logoutCubit = getIt<LogoutCubit>();
    _getProfileDataCubit = getIt<GetProfileDataCubit>()..fetchUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _getProfileDataCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => _logoutCubit,
          ),
          BlocProvider(
            create: (context) => _getProfileDataCubit,
          ),
        ],
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
