import 'package:auth/data/services/supabase_auth_service.dart';
import 'package:auth/entity/app_user.dart';
import 'package:bloc/bloc.dart';
import 'package:core/app/errors/generic_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SupabaseAuthService _supabaseAuthService;
  AuthenticationCubit(this._supabaseAuthService)
      : super(const AuthenticationState.initial());

  Future<void> signUp({
    required AppUser? appUser,
  }) async {
    try {
      emit(const AuthenticationState.loading());
      final kwayesUser = AppUser(
        email: appUser!.email,
        password: appUser.password,
        firstName: appUser.firstName,
        lastName: appUser.lastName,
        userRole: appUser.userRole,
      );
      await _supabaseAuthService.signUp(appUser: kwayesUser);
      // final addedUser = await Supabase.instance.client.from('users').insert({
      //   kwayesUser.toMap(),
      // });
      // if (addedUser.error == null) {
      //   emit(
      // const AuthState.authenticated(isUserInHisApp: true),
      //   );
      // } else {
      //   emit(AuthState.error(message: addedUser.error.message));
      // }
      emit(const AuthenticationState.authenticated(isUserInHisApp: true));
    } on GenericFailure catch (error) {
      emit(AuthenticationState.error(message: error.toString()));
    }
  }

  Future<void> signIn({
    required AppUser appUser,
  }) async {
    try {
      emit(const AuthenticationState.loading());
      final response = await _supabaseAuthService.signIn(
        appUser: AppUser(
          email: appUser.email,
          password: appUser.password,
          userRole: appUser.userRole,
        ),
      );
      response.fold(
        (error) => emit(AuthenticationState.error(message: error.message)),
        (user) => emit(
          AuthenticationState.authenticated(isUserInHisApp: user != null),
        ),
      );
    } on GenericFailure catch (error) {
      emit(AuthenticationState.error(message: error.toString()));
    }
  }

  void logout() => emit(const AuthenticationState.initial());
}
