import 'package:auth/entity/app_user.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAuthService {
  Future<Either<GenericFailure, User?>> signUp({
    required AppUser appUser,
  });

  Future<Either<GenericFailure, User?>> signIn({
    required AppUser appUser,
  });

  Future<Either<GenericFailure, User>>? getCurrentUser();

  User? getCurrentUserName();

  Future<Either<GenericFailure,bool>> signOut();
}
