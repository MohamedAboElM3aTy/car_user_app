import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;
  final UserRole userRole;

  const AppUser({
    required this.email,
    required this.password,
    required this.userRole,
    this.firstName,
    this.lastName,
  });

  @override
  List<Object> get props => [
        email,
        password,
        userRole,
        firstName ?? '',
        lastName ?? '',
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
    );
  }
}
