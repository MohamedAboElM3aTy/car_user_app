import 'package:auth/presentation/screens/auth_screen.dart';
import 'package:core/core.dart';
import 'package:core/views/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateAdmin(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashRoute:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(carColor: Colors.red),
        settings: settings,
      );
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingScreen(),
        settings: settings,
      );
    case AppRoutes.authRoute:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(userRole: UserRole.admin),
        settings: settings,
      );
    case AppRoutes.adminHomeRoute:
      final screen = settings.arguments as Widget?;
      return MaterialPageRoute(
        builder: (_) => AdminNavBar(homeScreen: screen),
        settings: settings,
      );
    case AppRoutes.adminBookHistory:
      return MaterialPageRoute(
        builder: (_) => const AdminBookingHistoryScreen(),
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
