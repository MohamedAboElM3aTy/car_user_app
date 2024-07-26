import 'package:equatable/equatable.dart';

class AuthResponseModel extends Equatable {
  final String userId;
  final String email;
  final String? firstName;
  final String? lastName;
  final String token;

  const AuthResponseModel({
    required this.userId,
    required this.email,
    this.firstName,
    this.lastName,
    required this.token,
  });

  @override
  List<Object> get props {
    return [
      userId,
      email,
      firstName ?? '',
      lastName ?? '',
      token,
    ];
  }

  AuthResponseModel copyWith({
    String? userId,
    String? email,
    String? firstName,
    String? lastName,
    String? token,
  }) {
    return AuthResponseModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      userId: map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      firstName: map['firstName'] as String? ?? '',
      lastName: map['lastName'] as String? ?? '',
      token: map['token'] as String? ?? '',
    );
  }
}
