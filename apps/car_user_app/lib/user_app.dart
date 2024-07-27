import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_home/features/home/presentation/screens/user_nav_bar.dart';

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // The size of the smallest iphone ie iPhone 6's
      designSize: const Size(375, 667),
      // Adapt the text according to min width & Height
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, child) => BlocProvider(
        create: (context) => HydratedAuthCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<HydratedAuthCubit, HydratedAuthState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Car User App',
                onGenerateRoute: onGenerateUser,
                theme: userTheme(),
                onGenerateInitialRoutes: (initialRoute) => [
                  MaterialPageRoute(
                    builder: (_) {
                      if (state.isAuthenticated) {
                        return const UserNavBar();
                      } else {
                        return const SplashScreen(carColor: Colors.blue);
                      }
                    },
                  ),
                ],
              );
            },
          );
        }),
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
