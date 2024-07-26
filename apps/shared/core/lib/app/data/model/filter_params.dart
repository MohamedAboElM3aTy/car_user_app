class FilterParam {
  final String column;
  final String condition;
  final dynamic value;

  FilterParam({
    required this.column,
    required this.condition,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'column': column,
      'condition': condition,
      'value': value,
    };
  }
}
