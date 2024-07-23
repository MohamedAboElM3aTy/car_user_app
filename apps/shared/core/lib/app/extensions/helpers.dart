import 'package:flutter/material.dart';

extension WidgetListUtils on List<Widget> {
  List<Widget> addSeparator(Widget separator, [int stopAt = 1]) {
    final newList = <Widget>[];
    if (length <= 1) return this;
    for (var i = 0; i < length; i++) {
      newList.add(this[i]);
      if (i < length - stopAt) {
        newList.add(separator);
      }
    }
    return newList;
  }
}
