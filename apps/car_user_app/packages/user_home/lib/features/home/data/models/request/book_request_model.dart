import 'package:core/app/data/model/base_request_model.dart';

class BookRequestModel extends BaseRequestModel {
  final int carId;
  final DateTime startDate;
  final DateTime endDate;

  BookRequestModel({
    required this.carId,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [carId, startDate, endDate];

  @override
  Map<String, dynamic> toJson() {
    return {
      'car_id': carId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      "status": "request_sent",
    };
  }
}
