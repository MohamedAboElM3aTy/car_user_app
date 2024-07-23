import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final String modelName;
  final String color;
  final String imagePath;
  final String speed;
  final String price;
  final String year;
  final String? description;
  final bool? isBooked;

  const CarModel({
    required this.modelName,
    required this.color,
    required this.imagePath,
    required this.speed,
    required this.price,
    required this.year,
    this.description = '',
    this.isBooked = false,
  });

  @override
  List<Object> get props {
    return [
      modelName,
      color,
      imagePath,
      speed,
      price,
      year,
      description ?? '',
      isBooked ?? false,
    ];
  }

  CarModel copyWith({
    String? modelName,
    String? color,
    String? imagePath,
    String? speed,
    String? price,
    String? year,
    String? description,
    bool? isBooked,
  }) {
    return CarModel(
      modelName: modelName ?? this.modelName,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
      speed: speed ?? this.speed,
      price: price ?? this.price,
      year: year ?? this.year,
      description: description ?? this.description,
      isBooked: isBooked ?? this.isBooked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modelName': modelName,
      'color': color,
      'imagePath': imagePath,
      'speed': speed,
      'price': price,
      'year': year,
      'description': description,
      'isBooked': isBooked,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      modelName: map['modelName'] as String,
      color: map['color'] as String,
      imagePath: map['imagePath'] as String,
      speed: map['speed'] as String,
      price: map['price'] as String,
      year: map['year'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      isBooked: map['isBooked'] != null ? map['isBooked'] as bool : null,
    );
  }
}
