import 'package:auth/data/model/auth_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void setUser(AuthResponseModel auth) => emit(AuthState(user: auth, token: auth.token));

  void logout() => emit(const AuthState(user: null));

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromMap(json, state.token ?? '');

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}
