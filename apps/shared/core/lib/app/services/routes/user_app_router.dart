import 'package:auth/presentation/screens/auth_screen.dart';
import 'package:core/core.dart';
import 'package:core/views/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:user_home/user_home.dart';

Route<dynamic> onGenerateUser(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashRoute:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(
          carColor: Colors.blue,
        ),
        settings: settings,
      );
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingScreen(),
        settings: settings,
      );
    case AppRoutes.authRoute:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(userRole: UserRole.user),
      );
    case AppRoutes.userHomeRoute:
      return MaterialPageRoute(
        builder: (_) => const UserNavBar(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const EmptyScreen(
          message: 'Can\'t find this route',
        ),
      );
  }
}
