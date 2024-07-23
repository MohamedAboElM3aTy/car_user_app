import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CarCategory extends Equatable {
  final String carPicture;
  final String categoryName;
  final String categoryHint;
  final Color circleColor;

  const CarCategory({
    required this.carPicture,
    required this.categoryName,
    required this.categoryHint,
    required this.circleColor,
  });

  @override
  List<Object?> get props => [
        carPicture,
        categoryName,
        categoryHint,
        circleColor,
      ];
}
