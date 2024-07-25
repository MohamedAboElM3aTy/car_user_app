import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // The size of the smallest iphone ie iPhone 6's
      designSize: const Size(375, 667),
      // Adapt the text according to min width & Height
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, child) => MaterialApp(
        title: 'Car Admin App',
        onGenerateRoute: onGenerateAdmin,
        theme: adminTheme(),
      ),
    );
  }
}

void preventLandScape() => SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  preventLandScape();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
  await initAuthGetIt();
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(
      '🚨 ${details.exceptionAsString()}',
      stackTrace: details.stack,
    );
  };
}
