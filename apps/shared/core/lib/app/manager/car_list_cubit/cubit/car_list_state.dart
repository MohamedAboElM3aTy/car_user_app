part of 'car_list_cubit.dart';

class CarListState extends Equatable {
  final bool isLoading;
  final List<CarModel> cars;
  final Failure? failure;
  final bool isDeleted;

  const CarListState({
    this.isLoading = false,
    this.cars = const [],
    this.failure,
    this.isDeleted = false,
  });

  CarListState loading() {
    return copyWith(
      isLoading: true,
      failure: null,
      cars: [],
    );
  }

  CarListState success(List<CarModel> cars) {
    return copyWith(
      isLoading: false,
      failure: null,
      cars: cars,
    );
  }

  CarListState error(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: failure,
      cars: [],
    );
  }

  CarListState copyWith({
    bool? isLoading,
    List<CarModel>? cars,
    Failure? failure,
    bool? isDeleted,
  }) {
    return CarListState(
      isLoading: isLoading ?? this.isLoading,
      cars: cars ?? this.cars,
      failure: failure ?? this.failure,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        cars,
        failure,
        isDeleted,
      ];
}
