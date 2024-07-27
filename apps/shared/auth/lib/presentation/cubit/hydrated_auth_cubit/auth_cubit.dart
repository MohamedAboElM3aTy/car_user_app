import 'package:auth/data/model/auth_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class HydratedAuthCubit extends HydratedCubit<HydratedAuthState> {
  HydratedAuthCubit() : super(const HydratedAuthState());

  void setUser(AuthResponseModel auth) =>
      emit(HydratedAuthState(user: auth, token: auth.token));

  void logout() => emit(const HydratedAuthState(user: null));

  @override
  HydratedAuthState? fromJson(Map<String, dynamic> json) =>
      HydratedAuthState.fromMap(json, state.token ?? '');

  @override
  Map<String, dynamic>? toJson(HydratedAuthState state) => state.toJson();
}
