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
  final int id;
  final DateTime? createdAt;
  final String? location;
  final String? overview;

  const CarModel({
    required this.modelName,
    required this.color,
    required this.imagePath,
    required this.speed,
    required this.price,
    required this.year,
    this.description = '',
    this.isBooked = false,
    required this.id,
    this.createdAt,
    this.location = '',
    this.overview = '',
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
      id,
      createdAt ?? DateTime.now(),
      location ?? '',
      overview ?? '',
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
    int? id,
    DateTime? createdAt,
    String? location,
    String? overview,
  }) {
    return CarModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      modelName: modelName ?? this.modelName,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
      speed: speed ?? this.speed,
      price: price ?? this.price,
      year: year ?? this.year,
      description: description ?? this.description,
      isBooked: isBooked ?? this.isBooked,
      location: location ?? this.location,
      overview: overview ?? this.overview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'model_name': modelName,
      'color': color,
      'image_path': imagePath,
      'speed': speed,
      'price': price,
      'year': year,
      'description': description,
      'is_booked': isBooked,
      'created_at': DateTime.now().toIso8601String(),
      'location': location,
      'overview': overview,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as int? ?? 0,
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'] as String) ?? DateTime.now()
          : null,
      modelName: map['model_name'] as String? ?? '',
      color: map['color'] as String? ?? '',
      imagePath: map['image_path'] as String? ?? '',
      speed: map['speed'] as String? ?? '',
      price: map['price'] as String? ?? '',
      year: map['year'] as String? ?? '',
      description: map['description'] as String?,
      location: map['location'] as String? ?? '',
      isBooked: map['is_booked'] as bool? ?? false,
      overview: map['overview'] as String? ?? '',
    );
  }
}
