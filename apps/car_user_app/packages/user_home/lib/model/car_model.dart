import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final String modelName;
  final String color;
  final String imagePath;
  final String speed;
  final String price;
  final String year;

  const CarModel({
    required this.modelName,
    required this.color,
    required this.imagePath,
    required this.speed,
    required this.price,
    required this.year,
  });

  @override
  List<Object?> get props => [
        modelName,
        color,
        imagePath,
        speed,
        price,
        year,
      ];
}
