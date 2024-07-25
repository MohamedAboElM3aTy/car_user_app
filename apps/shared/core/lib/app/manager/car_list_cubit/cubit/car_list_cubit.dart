import 'package:core/app/constants/database_constants.dart';
import 'package:core/app/data/model/car_model.dart';
import 'package:core/app/data/services/database_service_impl.dart';
import 'package:core/app/data/services/database_services.dart';
import 'package:core/app/errors/generic_failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_list_state.dart';

class CarListCubit extends Cubit<CarListState> {
  late final DatabaseServices _databaseServices;

  CarListCubit() : super(const CarListState()) {
    _databaseServices = DatabaseServiceImpl();
  }

  Future<void> fetchCars() async {
    emit(state.loading());
    final result = await _databaseServices.fetch(
      table: DataBaseConstants.carTable,
      responseFromMap: (json) =>
          json['data'].map<CarModel>((car) => CarModel.fromMap(car)).toList(),
    );
    result.fold(
      (failure) => emit(state.error(failure)),
      (cars) => emit(state.success(cars)),
    );
  }

  Future<void> deleteCar(int id) async {
    emit(state.copyWith(isLoading: true));
    final result = await _databaseServices.delete(
      table: DataBaseConstants.carTable,
      id: id,
    );
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (_) => emit(state.copyWith(isLoading: false, isDeleted: true)),
    );
  }
}
