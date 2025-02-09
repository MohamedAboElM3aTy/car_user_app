import 'package:core/app/data/services/database_service_impl.dart';
import 'package:core/app/data/services/database_services.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  late final DatabaseServices _databaseServices;

  AddCarCubit() : super(const AddCarState()) {
    _databaseServices = DatabaseServiceImpl();
  }

  Future<void> addCar(AddCarRequestModel requestModel) async {
    emit(state.loading());
    final result = await _databaseServices.insert(
      table: DataBaseConstants.carTable,
      requestModel: requestModel,
      responseFromMap: CarModel.fromMap,
    );
    result.fold(
      (failure) => emit(state.error(failure)),
      (carModel) => emit(state.success(carModel, false)),
    );
  }

  Future<void> updateCar(AddCarRequestModel requestModel, int id) async {
    emit(state.loading());
    final result = await _databaseServices.update(
      table: DataBaseConstants.carTable,
      requestModel: requestModel,
      id: id,
      responseFromMap: CarModel.fromMap,
    );
    result.fold(
      (failure) => emit(state.error(failure)),
      (carModel) => emit(state.success(carModel, true)),
    );
  }
}
