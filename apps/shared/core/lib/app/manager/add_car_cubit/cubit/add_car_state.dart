part of 'add_car_cubit.dart';

class AddCarState extends Equatable {
  final bool isLoading;
  final Failure? failure;
  final CarModel? carModel;
  final bool isUpdated;
  final bool isDeleted;

  const AddCarState({
    this.isLoading = false,
    this.carModel,
    this.failure,
    this.isUpdated = false,
    this.isDeleted = false,
  });

  AddCarState loading() {
    return copyWith(
      isLoading: true,
      failure: null,
      carModel: null,
    );
  }

  AddCarState success(CarModel carModel, bool isUpdate) {
    return copyWith(
      isLoading: false,
      failure: null,
      carModel: carModel,
      isUpdated: isUpdate,
    );
  }

  AddCarState error(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: failure,
      carModel: null,
    );
  }

  AddCarState copyWith({
    bool? isLoading,
    Failure? failure,
    CarModel? carModel,
    bool? isUpdated,
    bool? isDeleted,
  }) {
    return AddCarState(
      isLoading: isLoading ?? this.isLoading,
      carModel: carModel ?? this.carModel,
      failure: failure ?? this.failure,
      isUpdated: isUpdated ?? this.isUpdated,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        carModel,
        failure,
        isUpdated,
        isDeleted,
      ];
}
