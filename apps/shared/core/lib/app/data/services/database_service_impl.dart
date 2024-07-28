import 'package:core/app/data/model/base_request_model.dart';
import 'package:core/app/data/model/filter_params.dart';
import 'package:core/app/data/services/database_services.dart';
import 'package:core/app/errors/generic_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: DatabaseServices)
class DatabaseServiceImpl implements DatabaseServices {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, R>> insert<R>({
    required String table,
    required BaseRequestModel requestModel,
    required R Function(Map<String, dynamic> map) responseFromMap,
  }) async {
    try {
      final result =
          await _supabase.from(table).insert(requestModel.toJson()).select();
      if (result.isEmpty) {
        return Left(GenericFailure(message: 'Failed to insert data'));
      }
      return Right(responseFromMap(result.first));
    } catch (e) {
      return Left(GenericFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, R>> fetch<R>({
    required String table,
    int? id,
    required R Function(Map<String, dynamic> map) responseFromMap,
    List<FilterParam>? filter,
    String? searchText,
  }) async {
    try {
      var query = _supabase.from(table).select('*');
      if (filter != null) {
        for (var item in filter) {
          query = query.filter(item.column, item.condition, item.value);
        }
      }
      if (searchText != null) {
        query = query.textSearch('model_name', searchText);
      }
      return Right(responseFromMap({"data": await query}));
    } on Exception catch (e) {
      return Left(GenericFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> delete<R>(
      {required String table, required int id}) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return const Right(true);
    } on Exception catch (e) {
      return Left(GenericFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, R>> update<R>({
    required String table,
    required BaseRequestModel requestModel,
    required int id,
    required R Function(Map<String, dynamic> map) responseFromMap,
  }) async {
    try {
      final result = await _supabase
          .from(table)
          .update(requestModel.toJson())
          .eq('id', id)
          .select();
      return Right(responseFromMap({"data": result}));
    } on Exception catch (e) {
      return Left(GenericFailure(message: e.toString()));
    }
  }
}
