import 'package:auth/data/services/supabase_auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'get_profile_data_cubit.freezed.dart';
part 'get_profile_data_state.dart';

@injectable
class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  final SupabaseAuthService _authService;
  GetProfileDataCubit(this._authService)
      : super(const GetProfileDataState.initial());

  Future<void> fetchUserProfile() async {
    try {
      emit(const GetProfileDataState.loading());
      final response = await _authService.getCurrentUser();
      response!.fold(
        (error) => emit(GetProfileDataState.error(error.message)),
        (user) => emit(GetProfileDataState.success(user)),
      );
    } on Exception catch (error) {
      emit(GetProfileDataState.error(error.toString()));
    }
  }
}
