// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/data/repository/supabase_auth_implementaiton.dart'
    as _i130;
import 'package:auth/data/services/supabase_auth_service.dart' as _i540;
import 'package:auth/presentation/cubit/authentication_cubit.dart' as _i26;
import 'package:auth/presentation/cubit/logout_cubit.dart' as _i659;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i540.SupabaseAuthService>(
      () => _i130.SupabaseAuthImplementation());
  gh.factory<_i26.AuthenticationCubit>(
      () => _i26.AuthenticationCubit(gh<_i540.SupabaseAuthService>()));
  gh.factory<_i659.LogoutCubit>(
      () => _i659.LogoutCubit(gh<_i540.SupabaseAuthService>()));
  return getIt;
}