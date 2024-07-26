import 'package:auth/data/model/auth_response_model.dart';
import 'package:auth/data/services/supabase_auth_service.dart';
import 'package:auth/entity/app_user.dart';
import 'package:bloc/bloc.dart';
import 'package:core/app/errors/generic_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

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
      final response = await _supabaseAuthService.signUp(appUser: kwayesUser);
      response.fold(
        (error) => emit(AuthenticationState.error(message: error.message)),
        (user) => emit(
          AuthenticationState.authenticated(isUserInHisApp: user != null, user: user!),
        ),
      );
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
          AuthenticationState.authenticated(isUserInHisApp: user != null, user: user!),
        ),
      );
    } on GenericFailure catch (error) {
      emit(AuthenticationState.error(message: error.toString()));
    }
  }

  void logout() => emit(const AuthenticationState.initial());

  // Future<void> getCurrentUser() async {
  //   final user = await _supabaseAuthService.getCurrentUser();
  //   if (user != null) {
  //     user.fold(
  //       (error) => emit(AuthenticationState.error(message: error.message)),
  //       (user) => 
  //     emit(const AuthenticationState.authenticated(isUserInHisApp: true, user: user)),);
  //   } else {
  //     emit(const AuthenticationState.initial());
  //   }
  // }
}
