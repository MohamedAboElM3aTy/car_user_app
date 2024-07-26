import 'package:core/app/data/model/base_request_model.dart';
import 'package:core/app/data/model/filter_params.dart';
import 'package:core/app/errors/generic_failure.dart';
import 'package:dartz/dartz.dart';

abstract class DatabaseServices {
  Future<Either<Failure, R>> insert<R>({
    required String table,
    required BaseRequestModel requestModel,
    required R Function(Map<String, dynamic> map) responseFromMap,
  });

  Future<Either<Failure, R>> update<R>({
    required String table,
    required BaseRequestModel requestModel,
    required int id,
    required R Function(Map<String, dynamic> map) responseFromMap,
  });

  Future<Either<Failure, bool>> delete<R>({
    required String table,
    required int id,
  });

  Future<Either<Failure, R>> fetch<R>({
    required String table,
    int? id,
    required R Function(Map<String, dynamic> map) responseFromMap,
    List<FilterParam>? filter,
    String? searchText,
  });
}
