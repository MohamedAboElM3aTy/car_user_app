import 'package:equatable/equatable.dart';

class GenericDropdownMenuItem<T> extends Equatable {
  final String title;
  final String? image;
  final T? value;
  final bool isEnabled;
  final int? id;

  const GenericDropdownMenuItem({
    required this.title,
     this.value,
    this.id,
    this.image,
    this.isEnabled = true,
  });

  @override
  List<Object?> get props => [title, image, id,value, isEnabled];
}
