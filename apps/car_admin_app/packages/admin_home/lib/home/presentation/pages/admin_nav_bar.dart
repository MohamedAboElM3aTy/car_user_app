import 'package:admin_home/home/presentation/pages/admin_home_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
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
      const AdminBookingHistoryScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildItem(
        label: 'Home',
        icon: CupertinoIcons.home,
      ),
      _buildItem(
        label: 'History',
        icon: Icons.history,
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
      hideNavigationBarWhenKeyboardShows: false,
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
      navBarStyle: NavBarStyle.style1,
    );
  }
}
