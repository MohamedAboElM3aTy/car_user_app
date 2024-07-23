import 'package:admin_home/view/pages/admin_home_screen.dart';
import 'package:core/app/constants/app_colors.dart';
import 'package:core/app/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      const AdminHomeScreen(),
      const Center(
        child: Text('Welcome To Second screen'),
      ),
      const Center(
        child: Text('Welcome To Third screen'),
      ),
      const Center(
        child: Text('Welcome To Fourth screen'),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildItem(
        label: 'Home',
        icon: Icons.home_outlined,
      ),
      _buildItem(
        label: 'Explore',
        icon: Icons.explore_outlined,
      ),
      _buildItem(
        label: 'Favorites',
        icon: Icons.work_outline_sharp,
      ),
      _buildItem(
        label: 'Profile',
        icon: Icons.person_outline,
      ),
    ];
  }

  PersistentBottomNavBarItem _buildItem({
    required String label,
    required IconData icon,
  }) {
    return PersistentBottomNavBarItem(
      icon: Icon(
        icon,
        size: 24.sp,
      ),
      title: label,
      textStyle: context.textTheme.labelLarge!.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: context.primaryColor,
      ),
      activeColorPrimary: context.primaryColor,
      inactiveColorPrimary: context.seedColor.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.whiteColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
