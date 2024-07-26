import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;
  final UserRole userRole;
  final UserMetaData? userMetaData;
  final String? token;

  const AppUser({
    required this.email,
    required this.password,
    required this.userRole,
    this.firstName,
    this.lastName,
    this.userMetaData,
    this.token = '',
  });

  @override
  List<Object> get props => [
        email,
        password,
        userRole,
        firstName ?? '',
        lastName ?? '',
        userMetaData ?? const UserMetaData(),
        token ?? '',
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'userRole': userRole.toString().split('.').last,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userRole: UserRole.values.firstWhere(
        (role) => role.toString() == 'UserRole.${map['userRole']}',
      ),
      token: map['access_token'] as String,
      userMetaData:
          UserMetaData.fromMap(map['user_metadata'] as Map<String, dynamic>),
    );
  }
}

class UserMetaData extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;

  const UserMetaData({
    this.id,
    this.firstName,
    this.lastName,
  });

  UserMetaData copyWith({
    String? id,
    String? firstName,
    String? lastName,
  }) {
    return UserMetaData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  factory UserMetaData.fromMap(Map<String, dynamic> map) {
    return UserMetaData(
      id: map['id'] as String? ?? '',
      firstName: map['firstName'] as String? ?? '',
      lastName: map['lastName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  @override
  List<Object?> get props => [id, firstName, lastName];
}
