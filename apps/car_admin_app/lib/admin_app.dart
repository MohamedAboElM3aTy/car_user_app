import 'dart:developer';

import 'package:admin_home/admin_home.dart';
import 'package:auth/auth.dart' as auth;
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
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
      child: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) => auth.AuthCubit(),
            child: BlocBuilder<auth.AuthCubit, auth.AuthState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Car admin App',
                  onGenerateRoute: onGenerateAdmin,
                  theme: adminTheme(),
                  onGenerateInitialRoutes: (initialRoute) => [
                    MaterialPageRoute(
                      builder: (_) {
                        if (state.isAuthenticated) {
                          return const AdminNavBar();
                        } else {
                          return const SplashScreen();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
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
  await auth.initAuthGetIt();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  FlutterError.onError = (details) {
    log(
      '🚨 ${details.exceptionAsString()}',
      stackTrace: details.stack,
    );
  };
}
