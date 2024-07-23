import 'package:auth/data/services/supabase_auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'logout_state.dart';
part 'logout_cubit.freezed.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final SupabaseAuthService _authService;

  LogoutCubit(this._authService) : super(const LogoutState.initial());

  Future<void> logOut() async {
    emit(const LogoutState.loading());
    final result = await _authService.signOut();
    emit(
      result.fold(
        (failure) => LogoutState.error(failure.message),
        (_) => const LogoutState.success(),
      ),
    );
  }
}