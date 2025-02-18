part of 'auth_cubit.dart';

class HydratedAuthState extends Equatable {
  const HydratedAuthState({this.user, this.token});

  final AuthResponseModel? user;
  final String? token;

  bool get isAuthenticated => user != null && token != null;

  @override
  List<Object?> get props => [user, token];

  factory HydratedAuthState.fromMap(Map<String, dynamic> map, String token) {
    if (map.isEmpty) return const HydratedAuthState();
    final model = AuthStateModel.fromMap(map);
    return HydratedAuthState(
      user: model.user,
      token: token,
    );
  }

  Map<String, dynamic>? toJson() => isAuthenticated
      ? AuthStateModel(
          token: token!,
          user: user!,
        ).toJson()
      : {};

  HydratedAuthState copyWith({AuthResponseModel? user, String? token}) {
    return HydratedAuthState(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

class AuthStateModel {
  final String token;
  final AuthResponseModel user;

  AuthStateModel({
    required this.token,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toMap(),
    };
  }

  factory AuthStateModel.fromMap(Map<String, dynamic> map) {
    return AuthStateModel(
      token: map['token'] as String,
      user: AuthResponseModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }
}
