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
          'userRole': appUser.userRole.name,
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
      if (userCredentials.user?.userMetadata?["userRole"] != appUser.userRole.name) {
        return Left(
          GenericFailure(
            message: 'User is not authorized to access this app',
          ),
        );
      }
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
  Future<Either<GenericFailure, bool>> signOut() async {
    try {
      await _supabase.auth.signOut();
      return const Right(true);
    } on Exception catch (error) {
      return Left(GenericFailure(message: error.toString()));
    }
  }

  @override
  User? getCurrentUser() => _supabase.auth.currentUser;
}
