import 'package:equatable/equatable.dart';
import 'package:user_home/features/home/data/enums/book_request_status.dart';

class BookModel extends Equatable {
  final int id;
  final int carId;
  final DateTime startDate;
  final DateTime endDate;
  final BookRequestStatus status;

  const BookModel({
    required this.id,
    required this.carId,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      carId: json['car_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      status: BookRequestStatus.fromString(json['status']),
    );
  }

  @override
  List<Object?> get props => [id, carId, startDate, endDate, status];
}
