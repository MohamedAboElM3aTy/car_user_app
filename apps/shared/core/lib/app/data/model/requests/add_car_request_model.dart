import 'package:core/app/data/model/base_request_model.dart';

class AddCarRequestModel extends BaseRequestModel {
  final String modelName;
  final String color;
  final String year;
  final String speed;
  final String price;
  final String description;
  final String overview;
  final String location;

  AddCarRequestModel({
    required this.modelName,
    required this.color,
    required this.year,
    required this.speed,
    required this.price,
    required this.description,
    required this.overview,
    required this.location,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'model_name': modelName,
      'color': color,
      'year': year,
      'speed': speed,
      'price': price,
      'description': description,
      'overview': overview,
      'location': location,
      'is_booked': false,
    };
  }

  @override
  List<Object?> get props => [
        modelName,
        color,
        year,
        speed,
        price,
        description,
        overview,
        location,
      ];
}
