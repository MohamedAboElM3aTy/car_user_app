import 'package:auth/data/model/auth_response_model.dart';
import 'package:auth/entity/app_user.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAuthService {
  Future<Either<GenericFailure, AuthResponseModel?>> signUp({
    required AppUser appUser,
  });

  Future<Either<GenericFailure, AuthResponseModel?>> signIn({
    required AppUser appUser,
  });

  Future<Either<GenericFailure, User>>? getCurrentUser();

  User? getCurrentUserName();

  Future<Either<GenericFailure,bool>> signOut();
}
