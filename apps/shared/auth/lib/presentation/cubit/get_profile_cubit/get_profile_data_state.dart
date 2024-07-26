part of 'get_profile_data_cubit.dart';

@freezed
class GetProfileDataState with _$GetProfileDataState {
  const factory GetProfileDataState.initial() = _Initial;

  const factory GetProfileDataState.loading() = _Loading;

  const factory GetProfileDataState.success(User user) = _Success;

  const factory GetProfileDataState.error(String message) = _Error;
}
