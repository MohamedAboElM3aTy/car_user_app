import 'package:equatable/equatable.dart';

abstract class BaseRequestModel extends Equatable {
  Map<String, dynamic> toJson();
}
