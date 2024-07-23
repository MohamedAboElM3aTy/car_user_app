import 'package:auth/data/services/supabase_auth_service.dart';
import 'package:auth/entity/app_user.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: SupabaseAuthService)
class SupabaseAuthImplementation implements SupabaseAuthService {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<GenericFailure, User?>> signUp({
    required AppUser appUser,
  }) async {
    try {
      final userCredentials = await _supabase.auth.signUp(
        email: appUser.email,
        password: appUser.password,
        data: {
          'email': appUser.email,
          'firstName': appUser.firstName,
          'lastName': appUser.lastName,
          'userRole': appUser.userRole.toString().split('.').last,
        },
      );
      return Right(userCredentials.user);
    } on Exception catch (error) {
      return Left(
        GenericFailure(
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<GenericFailure, User?>> signIn({
    required AppUser appUser,
  }) async {
    try {
      final userCredentials = await _supabase.auth.signInWithPassword(
        email: appUser.email,
        password: appUser.password,
      );
      return Right(userCredentials.user);
    } on Exception catch (error) {
      return Left(
        GenericFailure(
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> signOut() async => _supabase.auth.signOut();

  @override
  User? getCurrentUser() => _supabase.auth.currentUser;
}
