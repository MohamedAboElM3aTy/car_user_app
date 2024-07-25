import 'package:core/app/constants/app_colors.dart';
import 'package:core/app/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';
import 'package:user_home/features/home/presentation/screens/user_home_screen.dart';
import 'package:user_home/features/settings/presentation/pages/setting_page.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({super.key});

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
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
      const UserHomeScreen(),
      const SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildItem(
        label: 'Home',
        icon: CupertinoIcons.home,
      ),
      _buildItem(
        label: 'Profile',
        icon: CupertinoIcons.profile_circled,
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
      navBarStyle: NavBarStyle.style1,
    );
  }
}
