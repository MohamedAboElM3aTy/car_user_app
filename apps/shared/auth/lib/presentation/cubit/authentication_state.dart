part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;

  const factory AuthenticationState.authenticated({
    required bool isUserInHisApp,
    required AuthResponseModel user,
  }) = _Authenticated;

  const factory AuthenticationState.unauthenticated() = _Unauthenticated;

  const factory AuthenticationState.loading() = _Loading;

  const factory AuthenticationState.loggedOut() = _LoggedOut;

  const factory AuthenticationState.error({required String message}) = _Error;
}
