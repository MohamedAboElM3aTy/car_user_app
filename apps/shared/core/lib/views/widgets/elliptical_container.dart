import 'package:core/core.dart';
import 'package:flutter/material.dart';

class EllipticalContainer extends StatelessWidget {
  const EllipticalContainer({
    super.key,
    this.bottom,
  });

  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      bottom: bottom ?? context.screenHeight * 0.66,
      child: Container(
        height: context.screenHeight * 0.35,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.primaryColor,
              context.seedColor.onPrimaryContainer,
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(
              300,
              100,
            ),
            bottomRight: Radius.elliptical(750, 275),
          ),
        ),
      ),
    );
  }
}
